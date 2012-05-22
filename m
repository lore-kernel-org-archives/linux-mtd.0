From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
Subject: Re: [PATCH V2] GPMI-NAND: Define ecc.strength
Date: Tue, 22 May 2012 08:34:25 +0200
References: <1337633967-8387-1-git-send-email-marex@denx.de>
 <1337668383.2483.87.camel@sauron.fi.intel.com>
In-Reply-To: <1337668383.2483.87.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201205220834.25981.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Shawn Guo <shawn.guo@linaro.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem Bityutskiy,

> On Mon, 2012-05-21 at 22:59 +0200, Marek Vasut wrote:
> > The ecc.strength wasn't set, resulting in the following crash:
> > [    2.550000] kernel BUG at drivers/mtd/nand/nand_base.c:3347!
> > [    2.550000] Internal error: Oops - BUG: 0 [#1] ARM
> 
> Pushed to l2-mtd.git, thanks!

Thank you!

Best regards,
Marek Vasut
