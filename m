Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9xgQ-0008E1-BO
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 08:11:06 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1609503rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Dec 2008 00:11:04 -0800 (PST)
Message-ID: <2014bcab0812090011o5d49d00bk52febf070a8b1b5a@mail.gmail.com>
Date: Tue, 9 Dec 2008 17:11:04 +0900
From: "=?EUC-KR?B?yKu9xSBzaGluIGhvbmc=?=" <hongshin@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: A suspected bug in JFFS2.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear JFFS2 maintainer,

Hi. I found a suspected bug while I am reading JFFS2 Linux file system code.

For jffs2_compress() function in compr.c,

I think it necessary to increase this->usecount(its type is
jffs2_compressor) before every temporary releasing of
jffs2_compressor_list_lock.

For example, at compr.c line 131 (linux-2.6.27.6),
jffs2_compressor_list_lock is temporary released and then re-acquired.

Is this function may result data race with jffs2_unregister_compressor
since there is no usecount increasing for line 131?

Please check the function and let me know your opinion. Thanks.

Sincerely

Shin Hong

hongshin@gmail.com
M.S. candidate
Computer Science Div., EECS Dept.,
Korea Advanced Institute of Sci. and Tech.,
Republic of Korea
