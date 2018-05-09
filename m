Received: from mail1.bemta8.messagelabs.com ([216.82.243.209])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGQ5i-0004d9-Kj
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 14:29:19 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Date: Wed, 9 May 2018 14:28:58 +0000
Message-ID: <TY1PR01MB0954BC7ABCE51B0B22DA09BFDC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180508044142.4159-1-ikegami@allied-telesis.co.jp>
 <20180508044534.4226-1-smtpuser@allied-telesis.co.jp>
 <TY1PR01MB0954BFF431218DC5E2E8F3A2DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <TY1PR01MB09542BAFA49897752D5A5B30DC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180509155319.170784df@bbrezillon>
In-Reply-To: <20180509155319.170784df@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris-san,

Thank you so much for your support.
Okay I will do follow the process below.

> Just a few more tips regarding the submission process:
>=20
> - you can group several patches in a patch series when some are
>   dependent on others. Just use 'git format-patch -<X>
>   <last-commit>' where <X> is the number of patches you want to generate
>   and <last-commit> is the last commit in the series. When you do that,
>   it's generally a good practice to have a cover letter explaining what
>   the patch series does. You can generate the cover letter with the
>   --cover-letter option
>=20
> - when you send a new version of a patch or a patch series it should be
>   prefixed with "[PATCH vX ...]". This can be done by passing -v<X> (X
>   being the version number) to git format-patch
>=20
> - when you send the exact same version of a patch or patch series
>   because the previous one has not been sent properly, you should
>   prefix the patches with "[PATCH RESEND ...]". Again, can be done by
>   passing --subject-prefix=3D"PATCH RESEND" to git format-patch
>=20
> - you should have a changelog describing what has changed between each
>   version of the patch or patchset. The changelog can be placed in the
>   cover-letter if you have one, or just after the "---" in the patch
>   itself. You can also add extra information that you don't want to
>   appear in the commit message just after this marker.

Regards,
Ikegami
