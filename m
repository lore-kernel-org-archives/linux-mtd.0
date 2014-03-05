From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 1/8] mtd: spi-nor: copy the SPI NOR commands to a new
 header file
Date: Wed, 5 Mar 2014 04:43:19 +0100
References: <1393238262-8622-1-git-send-email-b32955@freescale.com>
 <201403042313.14353.marex@denx.de> <5316932C.5040405@freescale.com>
In-Reply-To: <5316932C.5040405@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201403050443.19529.marex@denx.de>
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

On Wednesday, March 05, 2014 at 03:59:56 AM, Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8805=E6=97=A5 06:13, Marek Vasut =E5=86=
=99=E9=81=93:
> > Please keep me on CC;-)
>=20
> sorry, My fault :(
>=20
> > I honestly have to wonder ... why do you not 'move' these definitions
> > instead of copying them ?
>=20
> In the first version , i did so:
> http://marc.info/?l=3Dlinux-arm-kernel&m=3D138544933522564&w=3D2
>=20
> if I need to resend the patch set again, i can change to move the
> commands to the new header.

Why didn't you keep it like that? Was there some reason for that ?

Best regards,
Marek Vasut
