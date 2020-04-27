params.input = ''

Channel
    .fromPath(file(params.input))
    .splitCsv(header:true, sep:'\t')
    .map{ row-> tuple(row.subject, file(row.filepath))}
    .view()
