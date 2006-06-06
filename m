Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnUGC-0001in-5s
	for linux-mtd@lists.infradead.org; Tue, 06 Jun 2006 06:37:49 +0100
Subject: Re: NAND OOB Questions...
From: Thomas Gleixner <tglx@linutronix.de>
To: Steve Finney <saf76@earthlink.net>
In-Reply-To: <21148625.1149520632350.JavaMail.root@elwamui-karabash.atl.sa.earthlink.net>
References: <21148625.1149520632350.JavaMail.root@elwamui-karabash.atl.sa.earthlink.net>
Content-Type: text/plain
Date: Tue, 06 Jun 2006 07:38:49 +0200
Message-Id: <1149572330.11983.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-05 at 08:17 -0700, Steve Finney wrote:
> >From: Thomas Gleixner <tglx@linutronix.de>
> >The buffer is usually 0xff except when a caller provides content.
> 
> I'm not going to repeat all the previous content, but from what you've said,
> it confirms that there is a bug in the current nand_base.c code under the following particular
> set of circumstances:
> 
> 1) A NAND flash that allows more than one cycle of writing between erases (at
>   least in the OOB area). (e.g., the Samsung K9F* chip).
> 2) Using hardware ECC (e.g., the Samsung S3C2410 processor).
> 3) A sequence in which you initially write to the device with ECC, and then
>   turn off ECC and do additional writes including the OOB area.
> 
> In the above sequence, the ECC the user writes to the OOB may get corrupted.

Yeah. I did not think about that abstruse scenario :) What the hell is
this for ?

> I  have an (ugly) user-level workaround: before I turn off the ECC, I write a 
> block that I know will generate ECC bytes consisting of 0xFF. Then the subsequent
> user ECC writes are OK.
> 
> It's obscure enough that it's probably not worth fixing (well, I'm not going to try to
> fix it :-) ),  and hopefully it's fixed in the refactoring. 

Should be.

	tglx
