Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsBWC-00023M-Ne
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 11:04:57 +0000
Received: by bke5 with SMTP id 5so5818054bke.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 03:04:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120131101734.GE2471@pengutronix.de>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <20120131101734.GE2471@pengutronix.de>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 31 Jan 2012 19:04:34 +0800
Message-ID: <CAGsJ_4wyJ6Wymy4AWoW1eHubZX=W7GT_Fbow9ofXoY1RrcHzgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
 workgroup.linux@csr.com, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Erik Gilling <konkers@google.com>, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/1/31 Wolfram Sang <w.sang@pengutronix.de>:
> On Tue, Jan 31, 2012 at 06:00:00PM +0800, Barry Song wrote:
>> From: Barry Song <Baohua.Song@csr.com>
>>
>> this patch helps to move the common pattern from
>>
>> "
>> res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> if (!res) {
>> =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
>> =C2=A0 =C2=A0 =C2=A0 goto err;
>> }
>
> You don't need to do the error checking for 'res'. You can simply do
>
> res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> base =3D devm_request_and_ioremap(&dev->dev, res);

i do know  devm_request_and_ioremap() does res checking. but that is
implicit, confused and not a smart way actually.
actually, no people by now really use the implicit checking. that
shows people don't really think that is a good programming way.

>
> devm_request_and_ioremap() will check res. Given that, I don't think
> we can save a lot with another wrapper.

i think we can save some.
The story begins from Grant's feedback in:
http://www.spinics.net/lists/arm-kernel/msg157644.html

>
> Thanks,
>
> =C2=A0 Wolfram
>
> --
> Pengutronix e.K. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Wolfram Sang =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> Industrial Linux Solutions =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | http://www.pengutronix.de/ =C2=A0|

-barry
