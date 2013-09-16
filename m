Message-ID: <5236DD17.5090203@freescale.com>
Date: Mon, 16 Sep 2013 18:27:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <522D3B79.3060707@freescale.com> <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
 <20130913025827.GA3051@gmail.com> <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com> <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com> <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com> <20130916101912.GY29403@sirena.org.uk>
In-Reply-To: <20130916101912.GY29403@sirena.org.uk>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C216=C8=D5 18:19, Mark Brown =D0=B4=B5=C0:
> I would expect that most controllers would look just the same as they d=
o
> now except for the additional ability to do quad transfers - it'd just
> get told that some transfers should use more data lines.
The SPI is about the byte streams, but the dummy may be not a byte, the
dummy maybe just 4bit.

It is interesting to handle the dummy issue for the future's SPI controll=
er.

thanks
Huang Shijie
