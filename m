Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JnunD-0000rQ-Sb
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 12:06:44 +0000
Subject: Re: [U-Boot-Users] ubi and u-boot
From: Artem Bityutskiy <dedekind@infradead.org>
To: Wolfgang Denk <wd@denx.de>
In-Reply-To: <20080420222237.4AE5324657@gemini.denx.de>
References: <20080420222237.4AE5324657@gemini.denx.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 21 Apr 2008 15:05:08 +0300
Message-Id: <1208779508.5965.371.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: u-boot-users@lists.sourceforge.net,
	Bernard Blackham <bernard@largestprime.net>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-21 at 00:22 +0200, Wolfgang Denk wrote:
> In message <4808DF3B.2080702@largestprime.net> you wrote:
> >=20
> > Wolfgang showed some interest briefly too.[1]
>=20
> I am definitely interested.

What I would suggest to start with is to teach U-boot to erase flash and
preserve erase counters, because now it just wipes the erase counters
out. Also, it would be nice to teach it to flash images properly in case
of NAND flash.

I've just written a documentation section which I hope would help to do
this. Please, see
http://www.linux-mtd.infradead.org/doc/ubi.html#L_format

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
