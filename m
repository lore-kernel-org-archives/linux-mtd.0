Received: from cpanel5.proisp.no ([209.85.100.29])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSX4l-00022U-Si
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:46:05 +0000
Received: from mail-yx0-f177.google.com ([209.85.213.177]:53843)
	by cpanel5.proisp.no with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <oyvind.harboe@zylin.com>) id 1PSX4k-0005b2-Gu
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:46:02 +0100
Received: by yxm34 with SMTP id 34so448428yxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:46:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikvRdCuPHkxt7=uz7MsVDugaZ4JRO=u_iVJfR4M@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
	<AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
	<AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
	<AANLkTimNx5EqicJEAX_wZaz39paKusrDd4CemLcMQ3Qe@mail.gmail.com>
	<AANLkTi=w+zKPxdwWZ+-=8zbaagqjGPJyKRxOcku6kM7Y@mail.gmail.com>
	<AANLkTim-GWLaibEL1O=fcCcuG0qgrO2=qY1k_iKdxJQi@mail.gmail.com>
	<AANLkTikvRdCuPHkxt7=uz7MsVDugaZ4JRO=u_iVJfR4M@mail.gmail.com>
Date: Tue, 14 Dec 2010 16:46:01 +0100
Message-ID: <AANLkTincaN6in-9F-jUFygCx6-=DGW_9ju=Ve1QbXWSf@mail.gmail.com>
Subject: Re: Faster flash_eraseall for NOR flash
From: =?UTF-8?Q?=C3=98yvind_Harboe?= <oyvind.harboe@zylin.com>
To: Mike Frysinger <vapier.adi@gmail.com>
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

On Tue, Dec 14, 2010 at 4:38 PM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> On Tue, Dec 14, 2010 at 10:33, =C3=98yvind Harboe wrote:
>>> the only thing it changes in your original patch is to remove the type
>>> checking ?
>>
>> No. There is a different code path for writing the cleanmarkers.
>
> OK, i missed that. =C2=A0just change the code to issue a warning when
> someone tries to use this option on a NAND device. =C2=A0something like
> "--skip-erased: sorry, no support (yet) for NAND devices".
>
> in looking at the original patch, i noticed something else ... dont
> mix variable decls and code. =C2=A0i dont think mtd-utils has moved on to
> newer C standards/styles yet and support that. =C2=A0for example, the
> "ssize_t i" decl after a bunch of if statements.

I'll see about getting this done. Don't know when though, if
someone beats me to the punch here, no loss :-)


--=20
=C3=98yvind Harboe

Can Zylin Consulting help on your project?

US toll free 1-866-980-3434 / International +47 51 63 25 00

http://www.zylin.com/zy1000.html
ARM7 ARM9 ARM11 XScale Cortex
JTAG debugger and flash programmer
