Received: from web21101.mail.yahoo.com ([216.136.227.103])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gbOt-0007lt-Cb
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2003 03:36:43 +0100
Message-ID: <20030727023642.91956.qmail@web21101.mail.yahoo.com>
Date: Sat, 26 Jul 2003 19:36:42 -0700 (PDT)
From: Kien Phung Chi <pckien2001@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Compile error on kernel 2.5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Did anyone compile MTD code successfully with
kernel2.5.x. I download the latest MTD code and
compile with kernel2.4.20 without any problem. But
when I compile it with kernel2.5.45, it report error
about O_TARGET	:= mtdlink.o line in
driver/mtd/Makefile file. It say that the O_TARGET is
obsolote in kernel 2.5 and user must fix it.

Did anyone fix it ?

Phung Chi Kien
Automation Institute
Hanoi
Vietnam




__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
