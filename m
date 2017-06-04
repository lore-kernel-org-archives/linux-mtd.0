Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHYEs-0008JL-2i
 for linux-mtd@lists.infradead.org; Sun, 04 Jun 2017 16:18:51 +0000
Received: by mail-qt0-x232.google.com with SMTP id u12so36038493qth.0
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jun 2017 09:18:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170530152401.750d42e2@bbrezillon>
References: <CAJbz7-0+WijkdxuwL_xvjwTWfzWcqL5PHAqSwGbwV=txQVnnAA@mail.gmail.com>
 <20170530152401.750d42e2@bbrezillon>
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Sun, 4 Jun 2017 18:18:27 +0200
Message-ID: <CAJbz7-1oESF4TcCEi=xCxz8KRy-2tqPKFu6ojiKYRfX41zgJ7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd:nor:ppb_unlock fixes
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris.

2017-05-30 15:24 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> On Tue, 30 May 2017 11:51:07 +0200
> Honza Petrou=C5=A1 <jpetrous@gmail.com> wrote:
>
>> Hi Boris,
>> as you advised I come back with v2 patch, now it is the series
>> of three fixes I found them during the testing of the original fix.
>>
>> From the fixes it is evident that PPB unlocking is not so much
>> widely used. What is understandable as usually the flashing
>> is done in bootloader. At least in projects I was involved before.
>>
>> Anyway, I can say I tested the code only on one-flashchip
>> configuration, so I'm not 100% sure if all will be ok with multichip
>> setting. All my old embedded boards have unfortunatelly only
>> one nor chip.
>
> I think I found another bug here [1]. The test does not work for
> multichip flashes because adr is set back to 0 when you cross a chip
> boundary.
>
> If you want my opinion, you'd better re-code the whole logic (you can
> probably do better, but here is an example [2]).

Yeh, it seems the code has much more issues.

I will try to recode it.

Thanks.

/Honza
