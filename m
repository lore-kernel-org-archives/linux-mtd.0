Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JCH3-0005Gq-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2002 12:35:37 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6J008IEODGCU@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 03 Dec 2002 14:05:41 +0100 (MET)
Date: Tue, 03 Dec 2002 14:03:41 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 and bad blocks
In-reply-to: <3DEC8633.25166.12C6FD@localhost>
To: simon@baydel.com, MTD mailing list <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200212031403.42061.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3DEC8633.25166.12C6FD@localhost>
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

On Tuesday 03 December 2002 11:23, simon@baydel.com wrote:
> I am using an SMC via the MTD layer. On one of the partitions I
> would like to put a JFFS2 filesystem. Normally I erase the partition
> and then mount it JFFS2. The problem is that if the partition has a
> bad block I cannot erase or mount it. Does the bad block handling
> have to be in the vendor specific nand driver ?

Please use latest MTD-CVS code.
Read http://www.linux-mtd.infradead.org/tech/nand.html

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
