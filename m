Message-ID: <52284F32.2020302@freescale.com>
Date: Thu, 5 Sep 2013 17:30:26 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com> <20130904095523.GT3084@sirena.org.uk>
 <52270B8E.5080402@freescale.com> <20130904113322.GA5859@sirena.org.uk>
 <20130905014350.GA2261@gmail.com>
 <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent.ti.com>
 <5228369A.9000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C907@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA0C907@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8805=E6=97=A5 17:11, Gupta, Pekon =E5=86=99=
=E9=81=93:
> No, SPI generic framework (struct spi_transfer, spi_message,...)
> should be kept independent of any MTD flash specific data handlers.
> <wangyuhang2014@gmail.com>  added two new fields (tx_nbits, rx_nbits)
> to spi_device because those properties are part of SPI protocol.
> But, 'dummy_cycles' is no related to SPI protocol. So it should be kept=
 out
> of SPI generic framework.
> This is where if you could use DT based approach, things would have bee=
n
> simpler, because you give end-user the freedom to enter device-info fro=
m
> device datasheet.
ok. i think i do not need to change the spi code now.
>> > =20
>> > =20
>> > =20
>> > =20
>> > =20
>> > =20
>> > =20
>>> >  >  Example: How to select opcodes in DT ?
>>> >  >  (step-1) eliminate opcode which cannot be used due to board con=
strains.
>>> >  >     your board connects only 2 data I/O between device and contr=
oller,  So you
>>> >  >     cannot use any of the QUAD  Read opcodes. Thus your choice i=
s limited to
>>> >  >     DUAL or SINGLE modes only.
>> >  we have 4 data I/O lines between the device and controller, i only =
need
>> >  the Quad mode.:)
>> > =20
> May be because you are currently working on a development EVM or
> demo board, so you can live with QUAD mode.
> But when customer will have custom boards with different QSPI devices
> then you would end-up  supporting all sorts of configurations:-)
> And in production scenarios, it=E2=80=99s the price economics which mos=
tly dominates
> which part to choose and how to connect it on board.
> Like as I remember some freescale boards have WINBOND QSPI flash
> which uses different opcodes and semantics, so you might need to suppor=
t
> that too in future.
>
> So my suggestion is think again. As you are inviting lot of re-work for=
 yourself
> and for others too:-)
>
> Anyway, if you really want to continue with this is, then please re-nam=
e
> include/linux/mtd/spi-nor.h to
> include/linux/mtd/spi-fsl-quadspi.h
> because something specific for your driver should not conflict with
> generic spi-nor framework added later.
i think there is no specific thing for this driver. The S25FL128S is a=20
common flash,
other person may uses it too. Could you show me what is specific?

so, i prefer to spi-nor.h.

thanks
Huang Shijie
