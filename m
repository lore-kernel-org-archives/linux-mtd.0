Received: from mail-oa0-f52.google.com ([209.85.219.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfFTa-0002la-2i
 for linux-mtd@lists.infradead.org; Wed, 22 May 2013 20:17:34 +0000
Received: by mail-oa0-f52.google.com with SMTP id h1so3284016oag.39
 for <linux-mtd@lists.infradead.org>; Wed, 22 May 2013 13:17:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1369226342-20102-1-git-send-email-zajec5@gmail.com>
References: <1369226342-20102-1-git-send-email-zajec5@gmail.com>
Date: Wed, 22 May 2013 22:17:12 +0200
Message-ID: <CACna6ryUW0pKFMtj-p+WFMK6k7x7DMafdhvBNdJXcd7AMHv0og@mail.gmail.com>
Subject: Re: [RFC][PATCH] mtd: bcm47xxsflash: writing support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/22 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> ---
>  drivers/mtd/devices/bcm47xxsflash.c |  130 +++++++++++++++++++++++++++++=
++++--
>  1 file changed, 126 insertions(+), 4 deletions(-)

To make it clear, it was successfully tested with BCM4706.

--=20
Rafa=C5=82
