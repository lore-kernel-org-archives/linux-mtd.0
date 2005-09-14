Received: from natfrord.rzone.de ([81.169.145.161])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFTGM-00074c-LU
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 10:09:07 +0100
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 14 Sep 2005 11:08:44 +0200
References: <1126642370.27734.84.camel@rhino.az.mvista.com>
In-Reply-To: <1126642370.27734.84.camel@rhino.az.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200509141108.44960.sr@denx.de>
Cc: Wade Farnsworth <wfarnsworth@mvista.com>
Subject: Re: [PATCH] Add MTD support for the AMCC PPC440EP Bamboo Eval Board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wade,

On Tuesday 13 September 2005 22:12, Wade Farnsworth wrote:
> [MTD] MAPS/NAND:  This adds MTD support for the AMCC PPC440EP Bamboo
> Evaluation Board.
>
> The Bamboo has both NAND and NOR chips.  Currently, HW ECC for the NAND
> chips is not supported.  Any comments would be appreciated.

Just gave it a try. I am using the Bamboo with U-Boot (not PIBS). Linux NOR 
support works fine for me. But I am having trouble with the NAND support. The 
2nd chip can't be detected (same problem in U-Boot by the way). Do you have 
any idea why?

Best regards,
Stefan
