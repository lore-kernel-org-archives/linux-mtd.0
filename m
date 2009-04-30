Received: from mail-gx0-f176.google.com ([209.85.217.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzWa0-0005yv-An
	for linux-mtd@lists.infradead.org; Thu, 30 Apr 2009 13:45:44 +0000
Received: by gxk24 with SMTP id 24so786972gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Apr 2009 06:45:35 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 30 Apr 2009 22:45:34 +0900
Message-ID: <2014bcab0904300645l695bc0d4ue7ff390879fa36d@mail.gmail.com>
Subject: report of possible data race at jffs2_rename()
From: =?EUC-KR?B?yKu9xSBzaGluIGhvbmc=?= <hongshin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi. It seems that jffs2_rename() in jffs/dir.c may result
race condition for the following reason.

jffs2_rename() in jffs2/dir.c accesses "victim_f->inocache"
while it does not hold "mutex_lock(&victim_f->sem)".

However, it seems that it may result race conditions
since there are functions such as jffs2_do_read_inode()
which may change the value of "inocache" as "null".

Shin Hong
