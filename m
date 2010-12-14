Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWsU-0000HO-Q0
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:33:23 +0000
Received: by wwb17 with SMTP id 17so638181wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:33:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimNx5EqicJEAX_wZaz39paKusrDd4CemLcMQ3Qe@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
	<AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
	<AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
	<AANLkTimNx5EqicJEAX_wZaz39paKusrDd4CemLcMQ3Qe@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 14 Dec 2010 10:33:00 -0500
Message-ID: <AANLkTi=w+zKPxdwWZ+-=8zbaagqjGPJyKRxOcku6kM7Y@mail.gmail.com>
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

On Tue, Dec 14, 2010 at 10:26, =C3=98yvind Harboe wrote:
>> i think it's fine to let the option operate on NAND devices. =C2=A0if
>> someone has a problem with how it operates, then they can post a fix
>> for their use case. =C2=A0i wouldnt worry about trying to come up with a
>> bullet proof solution at the first try.
>
> I'd rather pass the buck, because NAND is using a different code
> path. Also this is an optimization that makes little difference on
> NAND.

so pass the buck to me and say i told you to do it that way ;)

the only thing it changes in your original patch is to remove the type
checking ?
-mike
