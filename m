Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VspT-000783-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 12:27:35 +0000
Received: from dagobert.svc.sysgo.de ([172.22.1.2])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id h07CwNl06416
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jan 2003 13:58:23 +0100
Date: Tue, 7 Jan 2003 13:58:23 +0100 (MET)
From: Armin Schindler <acs@sysgo.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Error in cfi_cmdset_0002.c
Message-ID: <Pine.LNX.4.21.0301071354240.6191-100000@dagobert.svc.sysgo.de>
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

Hello,

the following patch fixes a "scheduling in interrupt" in case of
a write-complete timeout. The removed code already exists at the end
of the function which is also reached.

Regards,
Armin

Armin Schindler <acs@sysgo.de>
SYSGO AG
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany
phone: +49 6136 9948-0
fax  : +49 6136 9948-10
http://www.sysgo.de
http://www.elinos.com

--------------------

--- cfi_cmdset_0002.c.orig	Mon Nov 18 00:00:05 2002
+++ cfi_cmdset_0002.c	Tue Jan  7 13:48:36 2003
@@ -550,10 +550,6 @@
 		} else {
 			printk(KERN_WARNING "Waiting for write to complete timed out in do_write_oneword.");        
 			
-			chip->state = FL_READY;
-			wake_up(&chip->wq);
-			cfi_spin_unlock(chip->mutex);
-			DISABLE_VPP(map);
 			ret = -EIO;
 		}
 	}
