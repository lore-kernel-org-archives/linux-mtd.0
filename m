Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cQfa-0001U6-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 14:16:10 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0H00LY0662AG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2002 15:15:39 +0200 (MEST)
Date: Wed, 07 Aug 2002 15:15:38 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Hardware ECC in NAND flash driver
In-reply-to: <3D511B55.6ADABE4D@sgi.com>
To: Steven Hein <ssh@sgi.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1028726139.19447.255.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <3D511B55.6ADABE4D@sgi.com>
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

On Wed, 2002-08-07 at 15:06, Steven Hein wrote:
> Hello,
> 
> I'm working on the Linux port to the Samsung S3C2410 PDA controller
> (ARM 920T core with many interfaces, including a NAND flash controller,
> built-in).  The 2410's NAND flash controller generates ECC codes
> (3 bytes ECC per each 512 bytes data).  Are there any plans to
> incorporate hardware ECC support into this driver?  Specifically,
> I guess that would mean adding "hooks" so the hardware-specific
> driver could handle the ECC parts   (I only had to make
> a few small changes to nand.c to get this working for the 2410.)
> If there's an effort underway in this area, I'd be happy to
> participate in the development.
> 
We thougt about that already, but nobody made an attempt to do so,
because we had no hardware supporting this.
I was thinking about a similar hook as it is used for command function
and dev_ready function. So the hardware ecc support would be located in
the corresponding hardware driver.
If you send me a diff against current CVS, we can find a clean way
together to incorporate it into nand.c

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
