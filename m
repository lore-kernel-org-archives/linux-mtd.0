Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ItGM-0003Ko-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 16:17:38 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6I00MX23ZGHG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 02 Dec 2002 17:47:41 +0100 (MET)
Date: Mon, 02 Dec 2002 17:45:46 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 - ECC errors with NAND flash
In-reply-to: 
 <F252EE46074AB645B4F44947EEAD572750AE21@mvebe001.americas.nokia.com>
To: Srinivasu.Vaduguri@nokia.com, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212021745.46279.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <F252EE46074AB645B4F44947EEAD572750AE21@mvebe001.americas.nokia.com>
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

On Monday 02 December 2002 17:00, Srinivasu.Vaduguri@nokia.com wrote:
> Hi,
>
> I am trying to mount JFFS2 on MTD driver which uses NAND flash. I am using
> the latest MTD snapshot (mtd-snapshot-20020731.tar.bz2).
Please use latest code in CVS. There were too mauch changes since then.

> I have one more doubt. If the ECC is not calculated for smaller number of
> bytes when writing, then how will the read operation be succesful,  which
> calculates the ECC for entire page?
JFFS2 for NAND always writes full pages with ECC. See 
http://www.linux-mtd.infradead.org/tech/html

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
