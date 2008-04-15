Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jljef-0002q2-NR
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 11:48:54 +0000
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080415114135.GA3556@shareable.org>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron> <1207995042.5965.136.camel@sauron>
	<bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
	<1208163958.5965.158.camel@sauron>
	<20080415114135.GA3556@shareable.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 15 Apr 2008 14:44:18 +0300
Message-Id: <1208259858.5965.220.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-04-15 at 12:41 +0100, Jamie Lokier wrote:
> If erase counters are stored at the start of each block, for the block
> itself, what happens in this sequence?
>=20
>     1. Begin erase block.
>     2. Erase succeeds.
>     3. Power failure / system reset / watchdog / etc.
>     4. ....?
>=20
> Is the erase counter zeroed as a result of this?

It tries to minimize probability of situations like this by writing the
EC right after the erasure. But this still can happen of course. In this
case UBI uses the average erase-counter (calculated while scanning is
done) and writes it to this eraseblock.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
