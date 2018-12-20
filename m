Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZzJz-0005mi-2W
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 14:29:09 +0000
From: Richard Weinberger <richard@nod.at>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: hung task detected in ubifs
Date: Thu, 20 Dec 2018 15:28:45 +0100
Message-ID: <3974794.HFKrkWXeJj@blindfold>
In-Reply-To: <CABatt_zp8nzfbCBowr81ZPt48uVJk8pGHstZg6paLu6WHxK+Fw@mail.gmail.com>
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <2102406.fBQmoxhIU4@blindfold>
 <CABatt_zp8nzfbCBowr81ZPt48uVJk8pGHstZg6paLu6WHxK+Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 20. Dezember 2018, 15:19:24 CET schrieb Martin Townsend:
> The hung task timeout is the default 2 minutes and it's setup to panic
> so I don't know if it recovers. I'll ask them to try a longer value or
> disable the panic and see if it recovers.

Yes, please.

> I checked and LOCKDEP=3Dy and the held locks are in the original trace.
> Are there particular locking checks you would like? Currently its
> setup like this:
>   =E2=94=82 =E2=94=82    [*] RT Mutex debugging, deadlock detection
>   =E2=94=82 =E2=94=82    -*- Spinlock and rw-lock debugging: basic checks
>   =E2=94=82 =E2=94=82    -*- Mutex debugging: basic checks
>   =E2=94=82 =E2=94=82    [ ] Wait/wound mutex debugging: Slowpath testing
>   =E2=94=82 =E2=94=82    [*] Lock debugging: detect incorrect freeing of =
live locks
>   =E2=94=82 =E2=94=82    [ ] Lock debugging: prove locking correctness

Hmm, this should be okay.
So it does not look like a traditional deadlock.

Basically we need to figure why and where exactly cma_alloc() hangs.
And of course also we need to know if it is really cma_alloc().

Can you please dig into that?

Thanks,
//richard
