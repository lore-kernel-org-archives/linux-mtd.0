Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8QFN-00071k-LS
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 02:16:50 +0000
Received: by rv-out-0708.google.com with SMTP id b17so4447159rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Dec 2008 18:16:48 -0800 (PST)
Message-ID: <2014bcab0812041816h3c4de2a2va00cb9bf10ac59dd@mail.gmail.com>
Date: Fri, 5 Dec 2008 11:16:48 +0900
From: "=?EUC-KR?B?yKu9xSBzaGluIGhvbmc=?=" <hongshin@gmail.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: a report of a suspected jffs2 bug
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

I found a suspected bug from jffs2_flash_writev() at  wbuf.c  in jffs2
linux-2.6.27.6.

At line number 900, the function is returned without up_write(&c->wbuf_sem)

so that down_write(&c->wbuf_sem) and up_write(&c->wbuf_sem) seems to
be unmatched.


Shin Hong

hongshin@gmail.com
M.S.candidate. CS div., EECS dept.,
Korea Advanced Institute of Sci.&Tech.
Republic of Korea
