Received: from fep04-mail.bloor.is.net.cable.rogers.com ([66.185.86.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18X5kK-0007eI-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 20:27:16 +0000
Received: from ei.homeip.net ([65.48.182.245])
          by fep04-mail.bloor.is.net.cable.rogers.com
          (InterMail vM.5.01.05.06 201-253-122-126-106-20020509) with ESMTP
          id <20030110205646.JHBC214174.fep04-mail.bloor.is.net.cable.rogers.com@ei.homeip.net>
          for <linux-mtd@lists.infradead.org>;
          Fri, 10 Jan 2003 15:56:46 -0500
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ei.homeip.net (8.12.6/8.12.5) with ESMTP id h0AKvahC012062
	(version=TLSv1/SSLv3 cipher=EDH-DSS-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 15:57:36 -0500
Received: from localhost (ilgiz@localhost)
	by localhost.localdomain (8.12.6/8.12.5/Submit) with ESMTP id h0AKvadx012058
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 15:57:36 -0500
Date: Fri, 10 Jan 2003 15:57:36 -0500 (EST)
From: Ilguiz Latypov <ilatypov@infradead.org>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: DiskOnChip GRUB menu fall-back fix
Message-ID: <Pine.LNX.4.44.0301101549410.12054-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I submitted a modification to the David Woodhouse's GRUB patch,
patches/grub-2003-01-08-doc.patch in the MTD CVS tree.  It is the same as
the previous one posted by Mark Meade plus the fix for a fall-back menu 
option.  When the default drive (DiskOnChip) doesn't contain the menu.lst 
file, the menu will be looked for among the first hard disk and the floppy 
disk.  The bug was that selecting an item of the fall-back menu barked 
about non-existent disk.

I hope I didn't break anything by fixing this bug.

-- 
Ilguiz Latypov
Montreal, Quebec
Canada

+1 (514) 526-6911 (home)
+1 (514) 281-9191 x 117 (work)
