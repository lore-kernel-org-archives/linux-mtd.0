Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jm0uR-0000ap-47
	for linux-mtd@lists.infradead.org; Wed, 16 Apr 2008 06:14:19 +0000
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804150504v6b07ac06m62459278f2b375d@mail.gmail.com>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron> <1207995042.5965.136.camel@sauron>
	<bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
	<1208163958.5965.158.camel@sauron>
	<bae050c10804140435v5141dec6qd61b325a4a1ff6ad@mail.gmail.com>
	<1208173090.5965.187.camel@sauron>
	<bae050c10804150504v6b07ac06m62459278f2b375d@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 16 Apr 2008 09:11:09 +0300
Message-Id: <1208326269.5965.253.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-04-15 at 08:04 -0400, Nancy wrote:
> >  Then first of all you cannot use the default 4096 UBI WL threshold. Ma=
ke
> >  it 256 for example. 4K is almost lifetime of your eraseblock!
>        Why 4K is almost lifetime of my eraseblock? the specs says 10K,
> how you result that number 4?
I meant they are close and you should use something an order of
magnitude less then 4K.

>        How to set the WL threshold? any equation?
No equation. I'd suggest 256 for you. There is a configuration option
for this.

>        When eraseblock counter exceed 2*WL threshold, it will be less
> used, move its data to seldom used eraseblock?
>        Why WL can't just simply pick up the min used PEB to be the
> next block to use?

Consider a situation when you have static data, which never changes, and
it sits a a subset of eraseblock N, while the rest of the flash is
intensively used. In this case UBI moves data from N to more worn-out
eraseblocks, and start using N. And the threshold says which should be
the difference between erase-counter of eraseblocks N and the other
ones, roughly speaking.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
