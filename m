Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFdsE-0002SX-1E
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 16:29:09 -0400
From: Wade Farnsworth <wfarnsworth@mvista.com>
To: Stefan Roese <sr@denx.de>
In-Reply-To: <200509141108.44960.sr@denx.de>
References: <1126642370.27734.84.camel@rhino.az.mvista.com>
	<200509141108.44960.sr@denx.de>
Content-Type: text/plain
Message-Id: <1126729684.27734.254.camel@rhino.az.mvista.com>
Mime-Version: 1.0
Date: 14 Sep 2005 13:28:04 -0700
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Add MTD support for the AMCC PPC440EP Bamboo Eval Board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-09-14 at 02:08, Stefan Roese wrote:
> Hi Wade,
> 
> On Tuesday 13 September 2005 22:12, Wade Farnsworth wrote:
> > [MTD] MAPS/NAND:  This adds MTD support for the AMCC PPC440EP Bamboo
> > Evaluation Board.
> >
> > The Bamboo has both NAND and NOR chips.  Currently, HW ECC for the NAND
> > chips is not supported.  Any comments would be appreciated.
> 
> Just gave it a try. I am using the Bamboo with U-Boot (not PIBS). Linux NOR 
> support works fine for me. But I am having trouble with the NAND support. The 
> 2nd chip can't be detected (same problem in U-Boot by the way). Do you have 
> any idea why?
> 

Hi Stefan,

I'm not sure what's causing this.  I tested this with PIBS level 10, and
didn't have any problems, so obviously PIBS is tweaking some register
that U-Boot and this driver are not.

-Wade Farnsworth

> Best regards,
> Stefan
