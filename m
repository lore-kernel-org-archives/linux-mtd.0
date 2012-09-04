Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8jhh-0004rk-CT
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 03:21:30 +0000
Message-ID: <5045742C.9000608@freescale.com>
Date: Tue, 4 Sep 2012 11:23:24 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
In-Reply-To: <1346686544.3061.75.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 shmulik.ladkani@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B409=E6=9C=8803=E6=97=A5 23:35, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> 1. Sort. This leads to
>
> 100m@100m(kernel)
> 1g@200m(rootfs)
> 100m(boot)
>
> "OFFSET_CONTINOUS" is always the largest and will be at the end when
> sorting.
>
ok.
> 2. Verification.
>
> We verify for overlaps and gaps. And refuse this one.
>
It's really necessary to check the overlaps.

I will try to send out the new patch set.


Best Regards
Huang Shijie
