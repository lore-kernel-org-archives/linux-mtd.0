Received: from mail-bn1on0110.outbound.protection.outlook.com
 ([157.56.110.110] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrs6v-0001WE-Me
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 18:39:43 +0000
Date: Thu, 29 Oct 2015 13:28:03 -0500
From: Han Xu <han.xu@freescale.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
CC: "b45815@freescale.com" <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie.huang@arm.com" <shijie.huang@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "vinod.koul@intel.com"
 <vinod.koul@intel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, "dmaengine@vger.kernel.org"
 <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v7 4/7] mtd: nand: gpmi: may use minimum required ecc
Message-ID: <20151029182801.GA7007@chopperman.am.freescale.net>
References: <A765B125120D1346A63912DDE6D8B6310BF4F18D@NTXXIAMBX02.xacn.micron.com>
 <20151028155757.GB4035@chopperman.am.freescale.net>
 <A765B125120D1346A63912DDE6D8B6310BF4F392@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4F392@NTXXIAMBX02.xacn.micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 29, 2015 at 04:34:37AM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> > > > By default NAND driver will choose the highest ecc strength that oob
> > > > could contain, in this case, for some 8K+744 NAND flash, the ecc
> > > > strength will be up to 52bit, which beyonds the i.MX6QDL BCH capability
> > (40bit).
> > >
> > >
> > > For normal working environment, if hardware BCH ECC cannot meet NAND
> > > ecc requirement, We can set a minimum required ecc strength, and file
> > system refresh/scrub can control bitflips under NAND ecc strength. But during
> > reflow solder, it is very possible that NAND bitflips may increase over your
> > hardware BCH capability, I don't know how this controller handle this?
> > > For example, NAND require 80bit ECC, but hardware BCH ECC can only hold
> > 40bit.
> > > After reflow, there are some blocks that bitflips over 40bit.
> > 
> > if the minimum ecc strength read from NAND ONFI parameter exceeds the
> > BCH ECC capability, the NAND driver quits and reports unsupport NAND chip.
> 
> Current Linux already set ECC strength according to NAND minimum required ECC that read
> from ONFI table. So if NAND minimum required ECC is 60bit, but this BCH controller can only hold 40bit,
> NAND driver quits? Why not transfer to use software BCH ECC? 

SW ECC brings huge computational complexity, that's why needs HW ECC. I
think user should choose the proper NAND chip according to platfrom
capability rather than involve SW ECC in driver.

> 
> > Do you mean reflow solder may change the NAND minimum required ECC
> > strength, in other word, the actual minimum ECC may larger than it said in
> > NAND chip SPEC?
> 
> NAND minimum required ECC does not changed because of reflow.
> I mean that if hardware BCH ECC Can not meet nand minimum required ECC, during normal working, we can set
> ECC strength according to Your hardware ECC capability. 
> for example in this case, NAND minimum required ECC is 60bit, but hardware ECC capability Is 40bit, during normal working,
> we can set ECC strength according to 40bit, this can work, it will definitely increase PE cycle.
> But for reflow operation, there are some blocks that their bitflips will increase over your hardware ECC 40bit, so how do you handle this?
> Or you don't meet this case?

I don't quite understand, why 60bit ECC NAND can work on 40bit ECC
platform, it is quite possible to get uncorrectable ECC error. Excuse
me, I didn't get your point about reflow operation part, in your case,
the original ECC read from ONFI table has already beyond the HW ECC,
even without reflow.

> 
> 
> 
> > --
> > Best Regards,
> > 
> > Han "Allen" Xu
> 

-- 
Best Regards,

Han "Allen" Xu
