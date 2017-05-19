Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBfox-0004qG-2X
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 11:11:48 +0000
Date: Fri, 19 May 2017 08:11:17 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Doc Mailing List  <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 08/29] rfkill.txt: standardize document format
Message-ID: <20170519081117.6da0a699@vento.lan>
In-Reply-To: <1495188901.3274.0.camel@sipsolutions.net>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <3361dce0e96427ed8fc375ab78371c0a6d0f55cc.1495157082.git.mchehab@s-opensource.com>
 <1495188901.3274.0.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Fri, 19 May 2017 12:15:01 +0200
Johannes Berg <johannes@sipsolutions.net> escreveu:

> On Thu, 2017-05-18 at 22:25 -0300, Mauro Carvalho Chehab wrote:
> >=20
> > +.. CONTENTS
> > =C2=A0
> > +=C2=A0=C2=A01. Introduction
> > +=C2=A0=C2=A02. Implementation details
> > +=C2=A0=C2=A03. Kernel API
> > +=C2=A0=C2=A04. Userspace support =20
>=20
> Why not let this be auto-generated?
>=20
> .. contents::
>    :depth: 1
>=20
> should work, no?

Yes, it should work. Actually, you would need to use :depth: 2 to
produce this output:


	Contents

	    . rfkill - RF kill switch support
	        . Introduction
	        . Implementation details
	        . Kernel API
	        . Userspace support

I opted to keep the contents as a comment just because, in the past, some
maintainers complained about TOC removal, arguing that it makes harder
for the ones that would be reading the file in ascii.

Thanks,
Mauro
