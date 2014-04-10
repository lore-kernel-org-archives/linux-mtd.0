MIME-Version: 1.0
In-Reply-To: <201404101807.48238.marex@denx.de>
References: <CAOMZO5DR00ea=zfr+eM0uh2L5a6QB93g8X48JNkXZZc4UavdZA@mail.gmail.com>
 <201404101807.48238.marex@denx.de>
Date: Thu, 10 Apr 2014 14:16:49 -0300
Message-ID: <CAOMZO5CBV0tXhbBBFBO=T62nmCn9TenK8BgdAhT8r3b-30u6qg@mail.gmail.com>
Subject: Re: Wrong SPI NOR model detected by mx6sl
From: Fabio Estevam <festevam@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
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

Hi Marek,

On Thu, Apr 10, 2014 at 1:07 PM, Marek Vasut <marex@denx.de> wrote:

> Can you share the JEDEC ID codes that both of the boards actually read from the
> SPI NOR ? You can dump those in the m25p80.c driver . That'd be helpful, I
> suspect some kind of an "offset" or "polarity inversion" in the SPI
> communication causing this.

On mx6qsabresd:

m25p80 spi0.0: JEDEC id: 0x202016
m25p80 spi0.0: m25p32 (4096 Kbytes)

On mx6sl-evk:

m25p80 spi0.0: JEDEC id: 0x000000
m25p80 spi0.0: found mr25h256, expected m25p32
m25p80 spi0.0: mr25h256 (32 Kbytes)

Will need to dump the SPI registers to understand why mx6sl behaves like this.

Thanks,

Fabio Estevam
