Message-ID: <529DB442.90206@freescale.com>
Date: Tue, 3 Dec 2013 18:36:50 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com> <5298AA23.7080404@st.com>
 <201312030132.10410.marex@denx.de>
In-Reply-To: <201312030132.10410.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Angus Clark <angus.clark@st.com>, broonie@linaro.org, dwmw2@infradead.org,
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

=E4=BA=8E 2013=E5=B9=B412=E6=9C=8803=E6=97=A5 08:32, Marek Vasut =E5=86=99=
=E9=81=93:
> Finally, the erase_sector() call would probably need to be extended. I =
would
> rename it to simple erase(), since we can erase from sub-sectors (4K) t=
o whole
> chip.
yes. this is what i am coding now. I rename it to erase().

thanks
Huang Shijie
