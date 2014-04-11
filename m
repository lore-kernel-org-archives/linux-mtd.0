From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Wrong SPI NOR model detected by mx6sl
Date: Fri, 11 Apr 2014 13:59:26 +0200
References: <CAOMZO5DR00ea=zfr+eM0uh2L5a6QB93g8X48JNkXZZc4UavdZA@mail.gmail.com>
 <20140411002635.GB3837@localhost.localdomain>
 <CAOMZO5CzMyB=boSO+1QeJbw0yYsa1mME-sMVb6yocJAfnErksA@mail.gmail.com>
In-Reply-To: <CAOMZO5CzMyB=boSO+1QeJbw0yYsa1mME-sMVb6yocJAfnErksA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404111359.26723.marex@denx.de>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Huang Shijie <b32955@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, Shawn Guo <shawn.guo@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, April 11, 2014 at 01:43:50 PM, Fabio Estevam wrote:
> On Thu, Apr 10, 2014 at 9:26 PM, Huang Shijie <shijie8@gmail.com> wrote:
> > On Thu, Apr 10, 2014 at 02:16:49PM -0300, Fabio Estevam wrote:
> >> Hi Marek,
> >> 
> >> On Thu, Apr 10, 2014 at 1:07 PM, Marek Vasut <marex@denx.de> wrote:
> >> > Can you share the JEDEC ID codes that both of the boards actually read
> >> > from the SPI NOR ? You can dump those in the m25p80.c driver . That'd
> >> > be helpful, I suspect some kind of an "offset" or "polarity
> >> > inversion" in the SPI communication causing this.
> >> 
> >> On mx6qsabresd:
> >> 
> >> m25p80 spi0.0: JEDEC id: 0x202016
> >> m25p80 spi0.0: m25p32 (4096 Kbytes)
> >> 
> >> On mx6sl-evk:
> >> 
> >> m25p80 spi0.0: JEDEC id: 0x000000
> > 
> > It seems the kernel can not read out anything from the NOR.
> > Please check the pinctrl or the schematic.
> 
> Yes, there was a pinmux issue in U-boot and I have fixed it.
> 
> SPI NOR is properly detected in U-boot and kernel now.

This means there's also a pinmux issue in kernel, did you fix it in kernel as 
well please ?

Best regards,
Marek Vasut
