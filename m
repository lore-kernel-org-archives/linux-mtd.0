From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Wrong SPI NOR model detected by mx6sl
Date: Thu, 10 Apr 2014 18:07:48 +0200
References: <CAOMZO5DR00ea=zfr+eM0uh2L5a6QB93g8X48JNkXZZc4UavdZA@mail.gmail.com>
In-Reply-To: <CAOMZO5DR00ea=zfr+eM0uh2L5a6QB93g8X48JNkXZZc4UavdZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404101807.48238.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shawn Guo <shawn.guo@freescale.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 10, 2014 at 05:49:18 PM, Fabio Estevam wrote:
> Hi,
> 
> On the imx6sl-evk there is a m25p32 spi nor flash, but in the kernel
> probe we get:
> 
> m25p80 spi0.0: found mr25h256, expected m25p32
> m25p80 spi0.0: mr25h256 (32 Kbytes)
> 
> On the mx6qsabresd there is also a m25p32, which is correctly detected:
> m25p80 spi0.0: m25p32 (4096 Kbytes)
> 
> Any ideas as to why mx6sl detects the wrong spi nor model?

Can you share the JEDEC ID codes that both of the boards actually read from the 
SPI NOR ? You can dump those in the m25p80.c driver . That'd be helpful, I 
suspect some kind of an "offset" or "polarity inversion" in the SPI 
communication causing this.

Best regards,
Marek Vasut
