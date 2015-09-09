Date: Wed, 9 Sep 2015 15:00:50 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Bayi Cheng <bayi.cheng@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll
 <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar
 Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mtk-nor: mtk serial flash controller driver
Message-ID: <20150909150050.44d2b197@ipc1.ka-ro>
In-Reply-To: <20150909063701.GD18700@pengutronix.de>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-3-git-send-email-bayi.cheng@mediatek.com>
 <20150909063701.GD18700@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > +	writeb(len, mt8173_nor->base + MTK_NOR_CNT_REG);
> > +	return mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_PRG_CMD);
> > +}
> > +
> > +static int mt8173_nor_get_para(struct mt8173_nor *mt8173_nor, u8 *buf,=
 int len)
> > +{
> > +	if (len > 1) {
> > +		/* read JEDEC ID need 4 bytes commands */
> > +		mt8173_nor_set_cmd(mt8173_nor, 0, 32, SPINOR_OP_RDID);
> > +		buf[2] =3D readb(mt8173_nor->base + MTK_NOR_SHREG0_REG);
> > +		buf[1] =3D readb(mt8173_nor->base + MTK_NOR_SHREG1_REG);
> > +		buf[0] =3D readb(mt8173_nor->base + MTK_NOR_SHREG2_REG);
> > +	} else {
> > +		if (mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_RDSR_CMD)) {
> > +			dev_err(mt8173_nor->dev, "read status failed!\n");
> > +			return -EINVAL;
> > +		}
> > +		*buf =3D readb(mt8173_nor->base + MTK_NOR_RDSR_REG);
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* cmd1 sent to nor flash, cmd2 write to nor controller */
> > +static int mt8173_nor_set_para(struct mt8173_nor *mt8173_nor, int cmd1,
> > +			       int cmd2)
> > +{
> > +	if (mt8173_nor_set_cmd(mt8173_nor, 0, 8, SPINOR_OP_WREN)) {
> > +		dev_err(mt8173_nor->dev,
> > +			"write enable failed in write protect!\n");
> > +		return -EINVAL;
> > +	}
> > +	writeb(cmd1, mt8173_nor->base + MTK_NOR_PRGDATA5_REG);
> > +	writeb(8, mt8173_nor->base + MTK_NOR_CNT_REG);
> > +	if (mt8173_nor_execute_cmd(mt8173_nor, cmd2)) {
> > +		dev_err(mt8173_nor->dev, "execute cmd failed!\n");
>=20
> mt8173_nor_execute_cmd() will already have printed an error message.
>=20
And mt8173_nor_execute_cmd()/mt8173_nor_set_cmd() returned an error
code which should be promoted to the caller rather than
inventing a new one.
The same for other instances of this code fragment.


Lothar Wa=C3=9Fmann
