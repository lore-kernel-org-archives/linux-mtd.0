Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oetju-0000ar-5f
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 17:51:22 +0000
Received: by wyb32 with SMTP id 32so1594383wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jul 2010 10:51:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280506337.2826.1.camel@localhost.localdomain>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<AANLkTimY5d6_koSrmg7Ser0O1SveWCBpYs76tEqd3GaX@mail.gmail.com>
	<1280506337.2826.1.camel@localhost.localdomain>
Date: Fri, 30 Jul 2010 13:51:15 -0400
Message-ID: <AANLkTikgmnRZHwN64xCFaO7F71xHaGXWo3WZ62u4939u@mail.gmail.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, Jul 30, 2010 at 12:12 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
>
> Something like this, I guess, would be good enough?
>
...
> + * =A0 o if this is a new UBI image, then just print the warning
> + * =A0 o if this is an UBI image which has already been used for some ti=
me, print
> + * =A0 =A0 a warning only if we can reserve less than 10% of the expecte=
d amount of
> + * =A0 =A0 the reserved PEB.
> + *
> + * The idea is that when UBI is used, PEBs become bad, and the reserved =
pool
> + * of PEBs becomes smaller, which is normal and we do not want to scare =
users
> + * with a warning every time they attach the MTD device. This was an iss=
ue
> + * reported by real users.

This sounds like a good compromise to me.  I was wondering whether
we'd still want to warn in the case in which nearly all of the reserve
PEBs had been exhausted, and using a 10% threshold seems like a good
way to accomplish that without scaring others unnecessarily.  :)

Thanks

--=20
Matthew L. Creech
