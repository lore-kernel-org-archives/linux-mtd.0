Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190i3K-0004lY-UF
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 14:13:19 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HCP00E7SWPC00@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 15:12:48 +0200 (MEST)
Date: Wed, 02 Apr 2003 16:13:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <002101c2f918$bbd9a710$1200a8c0@JOHNB>
To: John Burch <jburch@vincisystems.com>, linux-mtd@lists.infradead.org
Message-id: <200304021613.17222.tglx@linutronix.de>
MIME-version: 1.0
References: <002101c2f918$bbd9a710$1200a8c0@JOHNB>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: reach of jffs2 within image vs. partition
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 April 2003 15:06, John Burch wrote:
> Will JFFS2 ever read/write an area of flash memory that is within the
> same mtd partition but outside of the jffs2 image (as defined -p switch
> of mkfs.jffs2)?  In other words, if the jffs2 image spans 0x0 - 0x120000
> and it lies within an mtd partition that spans 0x0 - 0x140000, will the
> last 128k, spanning from 0x120000 - 0x140000, ever be accessed in any
> way by jffs2?  Would that 128k area be as safe/non-volatile there as in
> a separate partition?
JFSS2 is mounted on a partition and accesses the hole partition. 
If you want to reserve an aera in your flash chip for other purposes, put this 
area in a seperate partition.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
