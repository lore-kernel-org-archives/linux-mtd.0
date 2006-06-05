Received: from pop.scorch.co.nz ([203.167.215.14] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnBAy-0003HR-7i
	for linux-mtd@lists.infradead.org; Mon, 05 Jun 2006 05:15:16 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org,
 tglx@linutronix.de
Subject: Re: NAND OOB Questions...
Date: Mon, 5 Jun 2006 21:23:47 +1200
References: <32905508.1149179928067.JavaMail.root@elwamui-karabash.atl.sa.earthlink.net>
	<1149495264.11983.12.camel@localhost.localdomain>
In-Reply-To: <1149495264.11983.12.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606052123.47126.manningc2@actrix.gen.nz>
Cc: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 05 June 2006 20:14, Thomas Gleixner wrote:
> On Thu, 2006-06-01 at 09:38 -0700, Steve Finney wrote:
> > 1) The Samsung K9F56* NAND chip allows doing more than one write
> > to the OOB area of a page without an erase; the second write
> > may zero bits that were set to 1 by the first write. Is the Samsung
>
> Bits can not be set to 1 by the first write. FLASH cells are set to 1 by
> erasing and programming can set bits to 0.
>
> > chip unusual in this, or is this normal NAND behavior? (I believe
> > this would be normal for NOR flash).
>
> On NOR you can do this almost unlimited. NAND is much more restricted
> vs. write ordering.

Just one point of clarification that tglx might not have spelled out clearly 
here.

In both NAND and NOR you cannot set a 0 bit back to a 1 bit by programming. 
You can only do this by erasing the erasable block.

Where NOR and NAND differ is that if you program a pattern into NOR that tries 
to set a 0 to a 1 then (in most cases) the programming operation will be 
aborted. However, NAND will program the zeros only and 1 bits are just "don't 
care".
