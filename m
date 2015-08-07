Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNgnu-0003qP-4r
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 12:31:19 +0000
Received: by obdeg2 with SMTP id eg2so78022673obd.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 05:30:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEo2pzuPdN56QQbvoao_oo9oppr1CNmBMhq7d0BSGQXraBZYOA@mail.gmail.com>
References: <CAEo2pzuPdN56QQbvoao_oo9oppr1CNmBMhq7d0BSGQXraBZYOA@mail.gmail.com>
Date: Fri, 7 Aug 2015 14:30:56 +0200
Message-ID: <CAFLxGvxjKVLRQ1Jrjw-hTLq8k1jMTeWVOYwdgHzg=_dQfFsnRg@mail.gmail.com>
Subject: Re: ubifs: nand flash wear profiling for userspace application file
 i/o
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?B?0JjQu9GM0Y/RgSDQk9Cw0YHQsNC90L7Qsg==?= <torso.nafi@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On Fri, Aug 7, 2015 at 1:47 PM, =D0=98=D0=BB=D1=8C=D1=8F=D1=81 =D0=93=D0=B0=
=D1=81=D0=B0=D0=BD=D0=BE=D0=B2 <torso.nafi@gmail.com> wrote:
> Hello.
>
> We are developing a GNU/Linux-based appliance, and our customers are
> concerned that the defining application, which runs on it, wears out
> its flash storage too quickly under certain circumstances. The h/w
> supplier guarantees at least 10 000 rewrite cycles for its nand flash
> blocks before wear out.

10000 is not much, is this MLC?

> Is there a suitable method to count (or accurately estimate) the
> distribution of rewrite cycles for ubifs flash blocks during a certain
> period of application work cycle, e. g. for three days? The power is
> not guaranteed to be 100% time on, without a single outage, so it
> would be preferred if persistent data is used, like ubifs journal or
> ubi wear-leveling peb contents, rather than volatile kernelspace
> counters and such.

ubinfo prints the maximum erase counter value, does this help?
This info is also available via /sys/class/ubi/ubi0/max_ec.

If you want the distribution you have to write a small script which
reads the EC header of all blocks.
But as UBI does wear leveling for you, the distribution should not
matter. Please keep in mind that you need to define a sane
WL threshold.

--=20
Thanks,
//richard
