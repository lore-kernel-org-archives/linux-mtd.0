Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXBzt-0005bl-2n
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 11:11:49 +0000
Received: by ewy21 with SMTP id 21so1337035ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jan 2010 03:11:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1263898721.2891.0.camel@localhost>
References: <804f0d21001190234t3d576efdi2b915b97df379f65@mail.gmail.com>
	<1263898721.2891.0.camel@localhost>
Date: Tue, 19 Jan 2010 12:11:43 +0100
Message-ID: <804f0d21001190311ja482318ucbe64df52f66ac93@mail.gmail.com>
Subject: Re: one time programmable flash (OTP)
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
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

2010/1/19 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2010-01-19 at 11:34 +0100, Arno Steffen wrote:
>> Is there any support by kernel to have access (write/read) to that OPT a=
rea?
>> The flash (MT29F1G) on my omap board has OTP blocks.
>> What do I have to do to get it and how to use?
>> I've been searching a lot in the net, but hasn't been succesful with
>> that, except for Blackfin's build-in OTP.
>
> OneNAND has, and there is some support in the kernel.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)

Unfortunatly I use a Micron NAND. So no chance for me?
Best regards
Arno
