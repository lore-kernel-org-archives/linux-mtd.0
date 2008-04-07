Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jilva-0005rK-S4
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:38:07 +0000
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <1207553242.8040.48.camel@sauron>
References: <OF56D7FBB0.A3722ECD-ON88257423.008249AB-88257423.00833E0B@selinc.com>
	<1207553242.8040.48.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 10:37:06 +0300
Message-Id: <1207553826.8040.58.camel@sauron>
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

On Mon, 2008-04-07 at 10:27 +0300, Artem Bityutskiy wrote:
> Hi,
>=20
> On Sun, 2008-04-06 at 16:53 -0700, Bruce_Leonard@selinc.com wrote:
> > This is probably a basic question but I'll admit to being lost.  I'm=20
> > relatively new to kernel coding and up till now I've been focused on th=
e=20
> > very low level stuff, i.e., making hardware work and LEDs go=20
> > blinkey-blinkey.  Currently I'm working on a NAND flash driver that I n=
eed=20
> > to tie into UBI/UBIFS.  I've got the driver working, I can=20
> > read/write/erase my flash parts, so the low level stuff that I understa=
nd=20
> > is good.=20
>=20
> Is it a secret what is your flash and what is its size? If it is NAND
> I'd recommend you to test it with Adrian's NAND tests:
> git://infradead.org/~ahunter/nand-tests.git

Just a note - be careful with torture test - it may harm. Although we
were unable to wear-out SLC OneNAND after even > 2 000 000 erases.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
