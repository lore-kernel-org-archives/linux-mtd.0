Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UlLQM-0007rG-AD
 for linux-mtd@lists.infradead.org; Sat, 08 Jun 2013 15:51:27 +0000
Received: by mail-ob0-f173.google.com with SMTP id wc20so8100683obb.18
 for <linux-mtd@lists.infradead.org>; Sat, 08 Jun 2013 08:51:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1370705783-2140-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1370705783-2140-1-git-send-email-Julia.Lawall@lip6.fr>
Date: Sat, 8 Jun 2013 17:50:59 +0200
Message-ID: <CACna6rwKDKriiw2Q+et02ZmhHU9U+7ni3ik=14XZDEnN54J3YQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/mtd/devices/bcm47xxsflash.c: correct argument to
 kfree
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/6/8 Julia Lawall <Julia.Lawall@lip6.fr>:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The argument to kfree should not be the address of a structure field.
> The argument is adjusted to correspond to what is found in the subsequent
> remove function.

This was already addressed in
[PATCH RESEND 1/2] mtd: bcm47: convert kzalloc to avoid invalid access

Artem: can you pick pointed patch, please? So people don't report it
over and over ;)

--=20
Rafa=C5=82
