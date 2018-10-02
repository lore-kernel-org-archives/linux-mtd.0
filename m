Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GFo-0008O3-KW
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 08:42:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u12-v6so1184493wrr.4
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2018 01:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <5BB32167.1040902@ircoc.vrn.ru>
In-Reply-To: <5BB32167.1040902@ircoc.vrn.ru>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 2 Oct 2018 10:41:41 +0200
Message-ID: <CAFLxGvzDTi+tU6LT7r4QpxvM=f+mg5j8VOfyV5gZihu5-UWreg@mail.gmail.com>
Subject: Re: How to organize UBI volumes and power crash
To: myasoedovau@ircoc.vrn.ru
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
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

On Tue, Oct 2, 2018 at 9:43 AM "=D0=9C=D1=8F=D1=81=D0=BE=D0=B5=D0=B4=D0=BE=
=D0=B2 =D0=90.=D0=AE." <myasoedovau@ircoc.vrn.ru> wrote:
>
> I use UBIFS at my device. I'd like 2 UBIFS volumes, first volume for

There is no such thing. You guess mean UBI volumes.
A UBIFS filesystem always sits ontop of a UBI volume.

> work purposes, and second volume for logs omly. RootFS is in RAM.
>
> Both volumes are R/W, but the first volume is not intended for permanent
> writing. The second volume is intended for permanent writing (logs and
> some data tables).
>
> The second volume may be failured in casual power crash. But the first
> volume would work.

Both UBI and UBIFS must not corrupt upon a powercut, if you face such an
issue, please report. This could be a bug or a hardware problem.

> Will it be safe to have only 1 mfd device, and 2 UBI volume on the mtd
> device? Or I must to have 2 separate mtd devices with one UBI volume on
> each? The second approach is not suitable because of device tree
> modifications when I want to change volume sizes/

The general recommendation is having the MTD partition and therefore the UB=
I
device as large as possible such that the wear leveling large.

--=20
Thanks,
//richard
