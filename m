Received: from [131.228.20.172] (helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GqBzj-0006qd-6m
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 17:16:17 +0000
Subject: Re: ext2 over NANDSim
From: Artem Bityutskiy <dedekind@infradead.org>
To: Youngjae Kim <youkim@cse.psu.edu>
In-Reply-To: <027c01c71565$bad4fff0$c4251cac@Ggenikims>
References: <027c01c71565$bad4fff0$c4251cac@Ggenikims>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Dec 2006 19:15:41 +0200
Message-Id: <1164993341.20337.22.camel@sauron>
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


On Fri, 2006-12-01 at 11:28 -0500, Youngjae Kim wrote:
> Dear,
>=20
> How can I mount ext2 over mtd-nandsim? Is there necessary any layer=20
> in-betweens ext2 and MTD like NFTL? I'm a starting developer in this area=
.=20
> Is there any help to start up this work?

nandsim is a debugging tool to emulate NAND flashes. Technically you can
use ext2 over it. But in general it is bad idea. You encoureger me to
create this FAQ entry:

http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd

Please, read.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
