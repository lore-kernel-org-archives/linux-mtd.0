Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jyi6P-0001N3-Vp
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 06:47:10 +0000
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <411628.55054.qm@web36703.mail.mud.yahoo.com>
References: <411628.55054.qm@web36703.mail.mud.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 21 May 2008 09:47:12 +0300
Message-Id: <1211352433.31023.19.camel@sauron>
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

Hi,

I do not know much about SmartMedia and so on, so I cannot really
comment. I mail more because I am afraid your mail will not be answered.
Probably you should keep CCing LKML, not sure.

On Tue, 2008-05-20 at 06:59 -0700, Alex Dubov wrote:
> And third, architectural switch I'm proposing should not require modifica=
tion
> to low level chip drivers or higher level functionality of UBI kind. They=
 can
> be glued together with relative ease (callback architecture is quite flex=
ible).
> My target is device management and FTL drivers.
>=20
> Therefore, I propose (and intend to implement) a new architecture for MTD=
 core,
> modeled after the block device API. The "alpha" version of it is here:
>=20
> http://gentoo-wiki.com/User:Oakad/mtd_proposal

I've briefly read through this. I think it is nice having an
asynchronous interface based on requests. Probably UBI/UBIFS would
benefit from it as well. Just few thoughts:

1. You will probably need to solve the horrible MTD problem - it does
not support devices larger than 4GiB because it uses absolute 32-bit
offsets.
2. You will need to make MTD sysfs-aware.
3. Removable devices support is a separate task as well.
4. IMO you should preserve the low-level flash access interface and the
request-based infrastructure should yous it as the back-end. Is this
possible? Or my understanding of smartmedia is incorrect? I thought it
is accessible as bare NAND and you have to support its FTL in software.=20

Probably there are other tasks. I think you should work on these smaller
tasks separately and make them go in one by one, instead of trying to
put all together.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
