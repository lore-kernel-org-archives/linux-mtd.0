Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCkAU-0000X7-Rm
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 04:39:47 +0000
Received: by lbbgf7 with SMTP id gf7so3148857lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2012 21:39:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5031D2D5.7050801@freescale.com>
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>
 <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
 <502E0417.3040708@freescale.com>
 <CAN8TOE99ncoBgzpDjKXAWuMQ9O25JZhzLixbXtJA+c2T=mro-A@mail.gmail.com>
 <5031D2D5.7050801@freescale.com>
Date: Fri, 14 Sep 2012 21:39:43 -0700
Message-ID: <CAN8TOE-gEvc2Gej=OY=107kq-6h1XTj8WYTb3DzcJ1Lr=pVSuw@mail.gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
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

On Sun, Aug 19, 2012 at 11:01 PM, Huang Shijie <b32955@freescale.com> wrote=
:
> =D3=DA 2012=C4=EA08=D4=C218=C8=D5 10:51, Brian Norris =D0=B4=B5=C0:
>
>> agreed there was no good way to detect these chips without practically
>> hard-coding the ID + parameter configuration. If that's the case, then
>
> Yes, we have to hard-coding the ID for Hynix. But there is already a
> hard-coding for SAMSUNG.

It's not exactly hard-coding, as there is a recognizable pattern that
covers a class of different chips: all Samsung MLC with 6-byte ID
strings.

> so I think the hard-coding is accecpted, aren't we?

We try to do as little hard-coding as possible, as it can blow up as a
larger maintainability problem. But as we see, we may need real
hard-coding.

Brian
