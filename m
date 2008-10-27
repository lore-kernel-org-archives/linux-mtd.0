Received: from fk-out-0910.google.com ([209.85.128.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KuNDC-0007tR-TZ
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2008 08:12:31 +0000
Received: by fk-out-0910.google.com with SMTP id 18so2513900fks.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Oct 2008 01:12:29 -0700 (PDT)
Message-ID: <d459bb380810270112i18eb2ae9q76481dab1abad2f2@mail.gmail.com>
Date: Mon, 27 Oct 2008 10:12:28 +0200
From: "Marco Braga" <marco.braga@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 losing dirs/files on NAND flash
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

Hello,

I am using JFFS2 on an ARM base board with a 128Mb NAND flash, kernel
2.6.22.10. Sometimes the board does not boot because a directory in
/etc has disappeared after a JFFS2 error or a file is missing data.
I'm trying to understand at what level (hardware, kernel, MTD, file
system) it happens. The error appears when trying to access the
directory or file:

JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes found
for ino #65
JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has children
so we fake some modes for it
JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes found
for ino #97
JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has children
so we fake some modes for it
...

I've not been able to relate it to an unclean shutdown. I've tried
powering off the board several times without being able to make the
problem happen. Moreover I've tried a multithreaded program that
opens, writes, reads and deletes several files to stress the FS and it
never happened after an overnight run.

Can you please help understanding the cause or the meaning of those log lines?
Thank you!
