Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWxb-0001HK-KN
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:38:40 +0000
Received: by wwb17 with SMTP id 17so643541wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:38:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTim-GWLaibEL1O=fcCcuG0qgrO2=qY1k_iKdxJQi@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
	<AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
	<AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
	<AANLkTimNx5EqicJEAX_wZaz39paKusrDd4CemLcMQ3Qe@mail.gmail.com>
	<AANLkTi=w+zKPxdwWZ+-=8zbaagqjGPJyKRxOcku6kM7Y@mail.gmail.com>
	<AANLkTim-GWLaibEL1O=fcCcuG0qgrO2=qY1k_iKdxJQi@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 14 Dec 2010 10:38:17 -0500
Message-ID: <AANLkTikvRdCuPHkxt7=uz7MsVDugaZ4JRO=u_iVJfR4M@mail.gmail.com>
Subject: Re: Faster flash_eraseall for NOR flash
To: =?UTF-8?Q?=C3=98yvind_Harboe?= <oyvind.harboe@zylin.com>
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

On Tue, Dec 14, 2010 at 10:33, =C3=98yvind Harboe wrote:
>> the only thing it changes in your original patch is to remove the type
>> checking ?
>
> No. There is a different code path for writing the cleanmarkers.

OK, i missed that.  just change the code to issue a warning when
someone tries to use this option on a NAND device.  something like
"--skip-erased: sorry, no support (yet) for NAND devices".

in looking at the original patch, i noticed something else ... dont
mix variable decls and code.  i dont think mtd-utils has moved on to
newer C standards/styles yet and support that.  for example, the
"ssize_t i" decl after a bunch of if statements.
-mike
