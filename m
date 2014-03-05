Message-ID: <5316B9F2.8050301@freescale.com>
Date: Wed, 5 Mar 2014 13:45:22 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 1/8] mtd: spi-nor: copy the SPI NOR commands to a new
 header file
References: <1393238262-8622-1-git-send-email-b32955@freescale.com>
 <201403042313.14353.marex@denx.de> <5316932C.5040405@freescale.com>
 <201403050443.19529.marex@denx.de>
In-Reply-To: <201403050443.19529.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: angus.clark@st.com, computersforpeace@gmail.com, b44548@freescale.com,
 broonie@linaro.org, lee.jones@linaro.org, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8805=E6=97=A5 11:43, Marek Vasut =E5=86=99=
=E9=81=93:
> Why didn't you keep it like that? Was there some reason for that ?
http://marc.info/?l=3Dlinux-arm-kernel&m=3D138545182232220&w=3D4

Pekon suggestted  do not touch the m25p80.c.
So i just copy these commands to a new header.
Anyway, it's really not an important issue for me. :)



thanks
Huang Shijie
