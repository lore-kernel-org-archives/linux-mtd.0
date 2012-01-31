Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsDHB-00010P-Jr
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 12:57:34 +0000
Received: by bke5 with SMTP id 5so5922406bke.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 04:57:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328008455.956.30.camel@sauron.fi.intel.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328008455.956.30.camel@sauron.fi.intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 31 Jan 2012 20:57:11 +0800
Message-ID: <CAGsJ_4yVTaZQOE2dB4A3L6WCLE78b4eBPaOcDDJ7RH+0LN=R_A@mail.gmail.com>
Subject: Re: [PATCH 0/3] platform: add platform_devm_request_and_ioremap()
 common API
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: workgroup.linux@csr.com, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

2012/1/31 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2012-01-31 at 17:59 +0800, Barry Song wrote:
>> these patches move the common pattern from
>>
>> "
>> res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> if (!res) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto err;
>> }
>>
>> base =3D devm_request_and_ioremap(&dev->dev, mem_res);
>> if (!base) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto err;
>> }
>> "
>
> Am I right that these patches have been generated using the
> coccinelle/api/devm_request_and_ioremap.cocci script?
>
> If yes, I think it would be nice of you to give a credit to coccinelle
> and its authors for developing this awesome tool in every commit
> message.

devm_request_and_ioremap() is still something new by commit
72f8c0bfa0de64c68ee59f40eb9b2683bffffbb0:
author	Wolfram Sang <w.sang@pengutronix.de>=09
	Tue, 25 Oct 2011 13:16:47 +0000 (15:16 +0200)

there are only a few users until now. but it is going to be used as a
common/suggested way to request and map resource. now we don't need a
script to find them, just cscope "cs f c devm_request_and_ioremap".

>
> --
> Best Regards,
> Artem Bityutskiy

-barry
