Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ThkPa-0001y2-IG
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2012 17:11:31 +0000
Received: by mail-we0-f177.google.com with SMTP id x48so842140wey.36
 for <linux-mtd@lists.infradead.org>; Sun, 09 Dec 2012 09:11:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1354526555-27143-1-git-send-email-zajec5@gmail.com>
References: <1354526555-27143-1-git-send-email-zajec5@gmail.com>
Date: Sun, 9 Dec 2012 18:11:28 +0100
Message-ID: <CACna6ryJ4NsiixQpX-_dPzbGsgt5ePhccexv5mPf8bwTOtcZAg@mail.gmail.com>
Subject: Re: [PATCH] bcm47xxnflash: writing support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/12/3 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig                     |    5 +-
>  drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |   77 ++++++++++++++++++++=
++++++
>  2 files changed, 79 insertions(+), 3 deletions(-)

Could we still get that for the 3.8 merge window, please? :)

--=20
Rafa=C5=82
