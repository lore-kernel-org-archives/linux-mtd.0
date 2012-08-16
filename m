Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T21Vs-0004F4-AY
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 14:57:33 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: kill MTD_NAND_VERIFY_WRITE
Date: Thu, 16 Aug 2012 16:57:28 +0200
References: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
 <201208151409.12390.marex@denx.de> <502CBAA5.4070302@freescale.com>
In-Reply-To: <502CBAA5.4070302@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201208161657.28728.marex@denx.de>
Cc: dedekind1@gmail.com, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B408=E6=9C=8815=E6=97=A5 20:09, Marek Vasut =E5=86=
=99=E9=81=93:
> > I'd still prefer for this to be rather fixed. It seems to be able to fi=
nd
> > some obvious mistakes etc.
>=20
> could you please point out the mistakes?

Usual stuff -- flaws in drivers, misbehavior of the chip etc

Best regards,
Marek Vasut
