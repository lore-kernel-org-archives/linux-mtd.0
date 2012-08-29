Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6kgQ-0007dX-Vl
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 15:59:59 +0000
Received: by wibhn17 with SMTP id hn17so634618wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 08:59:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346251980.2848.488.camel@sauron.fi.intel.com>
References: <1346242803-18748-1-git-send-email-zajec5@gmail.com>
 <1346251980.2848.488.camel@sauron.fi.intel.com>
Date: Wed, 29 Aug 2012 17:59:55 +0200
Message-ID: <CACna6ryFy2+XM4ZHV6KoDPVXD76-dR9fVwRGFODYeDuWQQcrvg@mail.gmail.com>
Subject: Re: [PATCH V4] mtd: bcm47part driver for BCM47XX chipsets
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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

2012/8/29 Artem Bityutskiy <dedekind1@gmail.com>:
> --- before_patching.log
> +++ after_patching.log
> @@ @@
> +drivers/mtd/bcm47xxpart.c:178 bcm47xxpart_parse() warn: possible memory =
leak of 'buf' [smatch]

Ouch, my bad...


> checkpatch.pl results for patch "[PATCH] mtd: bcm47part driver for BCM47X=
X chipsets"
>
> WARNING:CONFIG_DESCRIPTION: please write a paragraph that describes the c=
onfig symbol fully
> #35: FILE: drivers/mtd/Kconfig:151:
> +config MTD_BCM47XX_PARTS

Do you think something like:
> This provides partitions parser for devices based on BCM47xx boards.
will be enough? checkpatch still generates error (it believes
description is too short), but I'm not sure what else I could put
here.

--=20
Rafa=C5=82
