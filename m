Received: from hardrain.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ajed-0002QB-DQ
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 23:12:43 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: jasmine@regolith.co.uk, David Woodhouse <dwmw2@infradead.org>
Date: Fri, 11 Jul 2003 10:16:03 +1200
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
	<1057846853.21073.378.camel@passion.cambridge.redhat.com>
	<Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
In-Reply-To: <Pine.LNX.4.53.0307101611170.844@hex.linuxgrrls.org>
MIME-Version: 1.0
Message-Id: <20030710221251.830334960@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 11 July 2003 03:12, jasmine@regolith.co.uk wrote:
> On Thu, 10 Jul 2003, David Woodhouse wrote:
> > Hmmm. When sending multiple bytes of address, isn't ALE supposed to
> > remain high for the entire duration, without going low again between
> > cycles? How do you achieve this if it's on the address bus?
>
> By waiting to see if the next write is to the same address-  it's not hard
> to do that sort of thing in an FPGA or SoC.  Since the only line involved
> is the ALE to the NAND, there's no downside in hanging on a little longer
> before dropping it.

Certainly this will work, as would using GPIOs, FPGAs etc.

Maybe I misread the original posting, but my understanding is that the bloke 
has hardware connected to address lines. This should work, from what I read, 
although I would be more inclined to use IO pins of some sort.

Having the R/B line connected to an address line is broken for sure.

-- CHarles
