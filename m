Received: from cpanel5.proisp.no ([209.85.100.29])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWt7-0000Ra-GN
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:34:02 +0000
Received: from mail-yw0-f49.google.com ([209.85.213.49]:62449)
	by cpanel5.proisp.no with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <oyvind.harboe@zylin.com>) id 1PSWt6-0004b6-0D
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:34:00 +0100
Received: by ywf7 with SMTP id 7so433006ywf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:33:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=w+zKPxdwWZ+-=8zbaagqjGPJyKRxOcku6kM7Y@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
	<AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
	<AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
	<AANLkTimNx5EqicJEAX_wZaz39paKusrDd4CemLcMQ3Qe@mail.gmail.com>
	<AANLkTi=w+zKPxdwWZ+-=8zbaagqjGPJyKRxOcku6kM7Y@mail.gmail.com>
Date: Tue, 14 Dec 2010 16:33:59 +0100
Message-ID: <AANLkTim-GWLaibEL1O=fcCcuG0qgrO2=qY1k_iKdxJQi@mail.gmail.com>
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

> the only thing it changes in your original patch is to remove the type
> checking ?

No. There is a different code path for writing the cleanmarkers.


--=20
=C3=98yvind Harboe

Can Zylin Consulting help on your project?

US toll free 1-866-980-3434 / International +47 51 63 25 00

http://www.zylin.com/zy1000.html
ARM7 ARM9 ARM11 XScale Cortex
JTAG debugger and flash programmer
