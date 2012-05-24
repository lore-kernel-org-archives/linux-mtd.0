From: Marek Vasut <marex@denx.de>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH V2] GPMI-NAND: Define ecc.strength
Date: Thu, 24 May 2012 23:27:31 +0200
References: <1337633967-8387-1-git-send-email-marex@denx.de>
 <201205220834.25981.marex@denx.de> <4FBE57DB.400@newsguy.com>
In-Reply-To: <4FBE57DB.400@newsguy.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201205242327.31910.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dedekind1@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Mike Dunn,

> On 05/21/2012 11:34 PM, Marek Vasut wrote:
> > Dear Artem Bityutskiy,
> > 
> >> On Mon, 2012-05-21 at 22:59 +0200, Marek Vasut wrote:
> >>> The ecc.strength wasn't set, resulting in the following crash:
> >>> [    2.550000] kernel BUG at drivers/mtd/nand/nand_base.c:3347!
> >>> [    2.550000] Internal error: Oops - BUG: 0 [#1] ARM
> >> 
> >> Pushed to l2-mtd.git, thanks!
> > 
> > Thank you!
> 
> Yes, thanks much Marek.  I must have missed this one while doing the
> EUCLEAN patches (maybe because it's in its own directory).  Sorry to
> everyone for the confusion it caused.

Mike, nice to see you became more involved with the MTD :-) How's the DoCG3/G4 
thing turned out btw?

> Mike

Best regards,
Marek Vasut
