Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MT2d-0001xx-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 13:06:15 +0000
Received: from mag.devdep.sysgo.de ([172.22.2.10])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id gBCDaps14464
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 14:36:51 +0100
Date: Thu, 12 Dec 2002 14:36:51 +0100 (CET)
From: Marius Groeger <mag@sysgo.de>
To: linux-mtd@lists.infradead.org
Subject: Timeout in do_write_oneword()
Message-ID: <Pine.LNX.4.40.0212121431470.7437-100000@mag.devdep.sysgo.de>
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

we ran into a problem with the current CVS version of
drivers/mtd/chips/cfi_cmdset_0002.c::do_write_oneword(), line 514. We
think the following is broken on most platform, where HZ is 100 and
results in a 10ms jiffy resolution:

  timeo = jiffies + (HZ/1000); /* setting timeout to 1ms for now */

Wouldn't this be better:

  /* setting timeout to 1ms for now, but wait a least one system tick */
  timeo = jiffies + (HZ/1000) ? (HZ/1000) : 1;

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions AG       mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
