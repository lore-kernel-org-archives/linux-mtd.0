MIME-Version: 1.0
Date: Thu, 10 Apr 2014 12:49:18 -0300
Message-ID: <CAOMZO5DR00ea=zfr+eM0uh2L5a6QB93g8X48JNkXZZc4UavdZA@mail.gmail.com>
Subject: Wrong SPI NOR model detected by mx6sl
From: Fabio Estevam <festevam@gmail.com>
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Hi,

On the imx6sl-evk there is a m25p32 spi nor flash, but in the kernel
probe we get:

m25p80 spi0.0: found mr25h256, expected m25p32
m25p80 spi0.0: mr25h256 (32 Kbytes)

On the mx6qsabresd there is also a m25p32, which is correctly detected:
m25p80 spi0.0: m25p32 (4096 Kbytes)

Any ideas as to why mx6sl detects the wrong spi nor model?

Regards,

Fabio Estevam
