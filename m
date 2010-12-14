Received: from cpanel5.proisp.no ([209.85.100.29])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWmA-0007AE-NC
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:26:51 +0000
Received: from mail-gx0-f171.google.com ([209.85.161.171]:55224)
	by cpanel5.proisp.no with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <oyvind.harboe@zylin.com>) id 1PSWm9-00041X-Ix
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:26:49 +0100
Received: by gxk8 with SMTP id 8so447063gxk.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:26:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
	<AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
	<AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
Date: Tue, 14 Dec 2010 16:26:37 +0100
Message-ID: <AANLkTimNx5EqicJEAX_wZaz39paKusrDd4CemLcMQ3Qe@mail.gmail.com>
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

> i think it's fine to let the option operate on NAND devices. =C2=A0if
> someone has a problem with how it operates, then they can post a fix
> for their use case. =C2=A0i wouldnt worry about trying to come up with a
> bullet proof solution at the first try.

I'd rather pass the buck, because NAND is using a different code
path. Also this is an optimization that makes little difference on
NAND.


--=20
=C3=98yvind Harboe

Can Zylin Consulting help on your project?

US toll free 1-866-980-3434 / International +47 51 63 25 00

http://www.zylin.com/zy1000.html
ARM7 ARM9 ARM11 XScale Cortex
JTAG debugger and flash programmer
