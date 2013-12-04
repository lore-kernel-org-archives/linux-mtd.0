Message-ID: <529E976E.4050104@freescale.com>
Date: Wed, 4 Dec 2013 10:46:06 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com> <5298AA23.7080404@st.com>
In-Reply-To: <5298AA23.7080404@st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, broonie@linaro.org, dwmw2@infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8829=E6=97=A5 22:52, Angus Clark =E5=86=99=
=E9=81=93:
> 	int (*write_reg)(struct spi_nor_info *info,
> 			 uint8_t cmd, uint8_t *reg, int len,
> 			 int wren, int wtr);
I guess you add the 'wren' for the issuing write-enable before issuing=20
the 'cmd'.

but what's 'wtr' for? i do not know what's the meaning of the 'wtr'.

thanks
Huang Shijie
