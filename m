Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFdx2-00059x-5I
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 10:00:34 +0000
Date: Tue, 30 May 2017 11:59:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Honza =?UTF-8?B?UGV0cm91xaE=?= <jpetrous@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] mtd:nor:ppb_unlock fixes
Message-ID: <20170530115959.4244924a@bbrezillon>
In-Reply-To: <CAJbz7-0+WijkdxuwL_xvjwTWfzWcqL5PHAqSwGbwV=txQVnnAA@mail.gmail.com>
References: <CAJbz7-0+WijkdxuwL_xvjwTWfzWcqL5PHAqSwGbwV=txQVnnAA@mail.gmail.com>
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

Hi Honza,

On Tue, 30 May 2017 11:51:07 +0200
Honza Petrou=C5=A1 <jpetrous@gmail.com> wrote:

> Hi Boris,
> as you advised I come back with v2 patch, now it is the series
> of three fixes I found them during the testing of the original fix.

Just a few things before I start reviewing the patches:

1/ commit title prefix should be "mtd: cfi: " not "mtd:nor:"
2/ Don't know how you send your patches, but patches 1 to 3 should be
   "In-Reply-To" your cover letter, which is not the case here.
   Normally, git send-email does that automatically.

>=20
> From the fixes it is evident that PPB unlocking is not so much
> widely used. What is understandable as usually the flashing
> is done in bootloader. At least in projects I was involved before.
>=20
> Anyway, I can say I tested the code only on one-flashchip
> configuration, so I'm not 100% sure if all will be ok with multichip
> setting. All my old embedded boards have unfortunatelly only
> one nor chip.
>=20
> As I noted already, the original issue was very slow unlocking
> on Spansion S29GL01GS, what led in really horrible timing,
> sometimes in minutes! With the fix (when only one chip unlock
> cmd is used) the operation returns to the "standard" behaviour
> whats make the whole system happy again.
>=20
> BR.
> /Honza
