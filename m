Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3L2M-00085p-4d
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 06:00:30 +0000
Message-ID: <5031D2D5.7050801@freescale.com>
Date: Mon, 20 Aug 2012 14:01:57 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>	<CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>	<502E0417.3040708@freescale.com>
 <CAN8TOE99ncoBgzpDjKXAWuMQ9O25JZhzLixbXtJA+c2T=mro-A@mail.gmail.com>
In-Reply-To: <CAN8TOE99ncoBgzpDjKXAWuMQ9O25JZhzLixbXtJA+c2T=mro-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8818=E6=97=A5 10:51, Brian Norris =E5=86=99=
=E9=81=93:
> agreed there was no good way to detect these chips without practically
> hard-coding the ID + parameter configuration. If that's the case, then
Yes, we have to hard-coding the ID for Hynix. But there is already a=20
hard-coding for SAMSUNG.

so I think the hard-coding is accecpted, aren't we?

thanks
Huang Shijie
