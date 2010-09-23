Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oykkq-0006WZ-JJ
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:18:25 +0000
Received: by qwe4 with SMTP id 4so20342qwe.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 05:18:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <74A5BE60138147F696E151AACD52EDEE@THOR>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
	<74A5BE60138147F696E151AACD52EDEE@THOR>
Date: Thu, 23 Sep 2010 14:18:22 +0200
Message-ID: <AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
From: Yegor Yefremov <yegorslists@googlemail.com>
To: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> =C2=A0Thanks for your response. Does this mean this chip isn't CFI compli=
ant?
> Like, datasheet says it is, but not really.
> Sorry if I sound confused, I've never messed with flashchips before so na=
mes
> and terms are still complicated.

Just to apply the patch and see what happens. The most important part
of this patch is:

Please refer to the data sheets Table 6:
39VF6401B data sheet http://www.sst.com/downloads/datasheet/S71288.pdf
39VF6401 data sheet http://www.sst.com/downloads/datasheet/S71223-03.pdf

The difference in the 6th bus write cycle. 39VF6401B uses 0x50 and
39VF6401 uses 0x30.

Without this even if the chip gets detected you cannot write to it.

I haven't look at this since my try to submit this patch, so I don't
know how to fix the stuff for cfi_probe.

Regards,
Yegor
