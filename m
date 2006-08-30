Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GIT1l-0005wz-9S
	for linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 17:34:58 +0100
Subject: Re: Issue with h/w ecc based NAND driver.
From: Thomas Gleixner <tglx@linutronix.de>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F48855559EABB206C5E9E4BC470@phx.gbl>
References: <BAY110-F48855559EABB206C5E9E4BC470@phx.gbl>
Content-Type: text/plain
Date: Wed, 30 Aug 2006 18:37:57 +0200
Message-Id: <1156955877.29250.186.camel@localhost.localdomain>
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

On Wed, 2006-08-23 at 11:12 -0700, Han Chang wrote:
> Hi there,
> 
> I'm using a NAND with h/w ecc. When a block is erased, both main data and 
> oob are set to 0xff, and if the driver read the main data in the page with 
> hardware enabled ecc, the 0xff in the oob is not the right ecc code, so the 
> ecc mechanism in the h/w try to recover the error and trash the content in 
> the main data area.
> 
> I tried to set the right ecc code in the oob for every page whenever a block 
> is erased. But then the problem is with page programming. When write a page, 
> the h/w ecc controller generates the ecc code and write it to the oob, since 
> the oob is already written once during erase, the 2nd write to the oob is 
> not taken well. So when read back the same page, it causes ecc error again.
> 
> I would appreciate very much if someone can shed some light on this kind of 
> delimma.

That's a know problem with braindead hardware. One solution is to apply
cluesticks (i.e. baseball bats) on the hardware designer. This only
helps for your well-being and does not solve the problem itself.

Look into drivers/mtd/nand/diskonchip.c doc200x_correct_data(). There is
an approach to tackle exactly the same problem.

	tglx
