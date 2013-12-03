Message-ID: <529D7838.6030606@freescale.com>
Date: Tue, 3 Dec 2013 14:20:40 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com> <5298AA23.7080404@st.com>
 <529C5BBF.6000604@freescale.com> <529C6CBB.4000008@st.com>
In-Reply-To: <529C6CBB.4000008@st.com>
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

=E4=BA=8E 2013=E5=B9=B412=E6=9C=8802=E6=97=A5 19:19, Angus Clark =E5=86=99=
=E9=81=93:
> To be honest, I am just glad that someone is taking a look at this area=
.
> However, whether or not is it possible to come up with something that s=
olves all
> our problems remains to be seen.  It might turn out that the various H/=
W
> Controllers are just too different to fit into a single unified framewo=
rk.
>
Hi Angus & Pekon:
thanks for the explanations.

I am not sure that after we add more hooks, if it will meet Jones's new=20
driver.

i will wait for Jones' comment for several days, and send out the next=20
version if he does not reply this thread.


thanks
Huang Shijie
