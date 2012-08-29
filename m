Received: from mo4.mail-out.ovh.net ([178.32.228.4])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6kBt-0006At-Dj
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 15:28:26 +0000
Received: from mail403.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with SMTP id E0F561054C96
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 17:33:30 +0200 (CEST)
Date: Wed, 29 Aug 2012 17:28:20 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Roland Stigge <stigge@antcom.de>
Subject: Re: mxc_nand.c on mach-imx/imx53
Message-ID: <20120829172820.43bbe68e@eb-e6520>
In-Reply-To: <503E3331.8050203@antcom.de>
References: <5035F84E.3000901@antcom.de>
 <20120829074122.GV26594@pengutronix.de>
 <503E3331.8050203@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roland,

Le Wed, 29 Aug 2012 17:20:17 +0200,
Roland Stigge <stigge@antcom.de> a =E9crit :
> Using  ".ecclayout_4k =3D &nandv2_hw_eccoob_4k" also doesn't work. So is
> there any hint how I can proceed from here? Any plans or hint regarding
> the "XXX"?
>=20
you may need something like this patch from barebox :
http://git.pengutronix.de/?p=3Dbarebox.git;a=3Dcommit;h=3D632c45795065e6a74=
71ab82be38e808eb6204341

I may have time to adapt this next week but if you have time before feel
free to do it ;-)

Eric
