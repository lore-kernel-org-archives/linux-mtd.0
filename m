Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15mbnK-0008NX-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2001 15:05:43 +0100
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id HAA05824
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2001 07:11:29 -0700 (PDT)
Message-ID: <82B1591A280FD411B91200D0B75B484A015F5C6C@sis-uk-msg01.altera.com>
From: Clive Davies <cdavies@altera.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: endless calls to jffs_garbage_collect_trigger
Date: Thu, 27 Sep 2001 07:15:00 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

In my system I'm using kernel 2.4.9-ac10-rmk2 on an ARM based system,
booting from a jffs flash root filesystem using a hacked compaq bootldr.
During the boot sequence, after freeing the Init memory the kernel gets
stuck in a call to kernel_thread - kupdate - sync_old_buffers - sync_supers

It seems that sync_supers scans down the list of sb structures looking for
those with a non-zero s_dirt field. s_dirt is set for the jffs filesystem so
sync_supers calls jffs_garbage_collect_trigger and then goes back to the
start of the sb list and searches for sb stucts with their s_dirt field set
again. The problem is that the s_dirt field for the jffs sb never seems to
be cleared so it get stuck in an endless loop of calls to
jffs_garbage_collect_trigger.

I've got around the problem by forcing jffs_garbage_collect_trigger to clear
s_dirt, but as I know very little about jffs I suspect that this my not be
the best/correct solution. 

Can anyone tell me how I ought to fix this?

TIA
Clive
