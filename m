Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oykq6-0000D2-JR
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:23:51 +0000
Received: by qyk34 with SMTP id 34so2509902qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 05:23:49 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20100923120534.GD2994@pengutronix.de>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
	<74A5BE60138147F696E151AACD52EDEE@THOR>
	<20100923120534.GD2994@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 23 Sep 2010 14:23:27 +0200
Message-ID: <AANLkTikU011z8uK8axjmzqpyepRHNgnyNupZzJSxkWTa@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>,
	linux-mtd@lists.infradead.org, Yegor Yefremov <yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/9/23 Wolfram Sang <w.sang@pengutronix.de>:
>
>> =C2=A0Thanks for your response. Does this mean this chip isn't CFI
>> compliant? Like, datasheet says it is, but not really.
>
> SST? Broken CFI happened to me, too :(
> http://patchwork.ozlabs.org/patch/51027/

This patch [1] (tried to) add support for your chip.
According to the datasheet [2], it uses addr_unlock1 =3D 0x555 and
addr_unlock2 =3D 0x2AA, and has no extended query table.
So this chip must be handled by the fixup_sst39vf_rev_b() fixup function.

Could you provide us with a more detailed log, i.e. with
DEBUG_CFI_FEATURES enabled in cfi_cmdset_0002.c and DEBUG_CFI in
cfi_probe.c ?


[1] http://patchwork.ozlabs.org/patch/50906/
[2] http://www.sst.com/dotAsset/40661.pdf
--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
