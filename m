Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWeg-0005Yc-9N
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:19:06 +0000
Received: by wyf22 with SMTP id 22so570740wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:19:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
	<AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
	<AANLkTinBpNA9VGB3druyijTKVhK4aDLDc-f=MgKZ4NK6@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 14 Dec 2010 10:18:43 -0500
Message-ID: <AANLkTin7OwjwSyMbnOg+RnYEN5gd1Qzspn6RUE1vLzRR@mail.gmail.com>
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

On Tue, Dec 14, 2010 at 10:09, =C3=98yvind Harboe wrote:
>> why cant this also be used for NAND ? =C2=A0all the NAND devices i use h=
ave
>> 0xff when erased.
>
> I don't have any NAND to test with, nor am I terribly familiar with
> NAND.
>
> I think it would be good to limit this patch to NOR flash that I
> can actually test and know something about. Also NAND flash
> doesn't have the horrible erase performance issues, so it
> might not be worth it from the point of view that it adds a new
> code path.

i think it's fine to let the option operate on NAND devices.  if
someone has a problem with how it operates, then they can post a fix
for their use case.  i wouldnt worry about trying to come up with a
bullet proof solution at the first try.
-mike
