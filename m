Received: from postfix1-2.free.fr ([213.228.0.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jZZu-0003sh-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 07:11:50 +0100
Received: from imp3-1.free.fr (imp3-1.free.fr [213.228.0.28])
	by postfix1-2.free.fr (Postfix) with ESMTP id 37285AAFFE
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 08:11:50 +0200 (CEST)
To: linux-mtd@lists.infradead.org,
	UNEXPECTED_DATA_AFTER_ADDRESS@.SYNTAX-ERROR
Subject: Cannot remove child on JFFS2 FS
Message-ID: <1030428801.3d6b1881e7ed3@imp.free.fr>
Date: Tue, 27 Aug 2002 08:13:21 +0200 (MEST)
From: olivier.eribon@free.fr
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I am using JFFS2 (from CVS july 01 2002) and 2.4.17 linux kernel on a specific 
board (ppc405gp with a nand flash : Toshiba TC58256FT/DC)

After booting on linux with nand flash FS, I create a directory (dir) and I put 
some files
> mkdir /dir
> cp /src/file* /dir
Now I remove all files from this directory
> rm /dir/*
I remove the directory too
> rmdir /dir

Now, after reboot for each FS mount and for each file on the removed directory, 
this message appears on console :
Cannot remove child "fileXXX", ino #0, because it doesn't exist

How can I solve this problem ? (because this message induce long time to
mount partition.)

Thanks in advance for your time and your help !

Best regards,

Olivier
