Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbrBv-0000Ll-Dx
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 14:26:40 +0000
Received: by wiclk2 with SMTP id lk2so30043417wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2015 07:26:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1659571442320272@web21h.yandex.ru>
References: <1659571442320272@web21h.yandex.ru>
Date: Tue, 15 Sep 2015 11:26:17 -0300
Message-ID: <CAAEAJfAqoTp8cXffFRfQazUQa+UtKRGpkft3k9xZQ+W8J2u75w@mail.gmail.com>
Subject: Re: Backporting ubiblock to Linux 3.3
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Konstantin Tokarev <annulen@yandex.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
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

Konstantin,

On 15 September 2015 at 09:31, Konstantin Tokarev <annulen@yandex.ru> wrote=
:
> Hi Ezequiel and others,
>
> How do you think, would it be feasible to backport ubiblock to Linux 3.3 =
without large amount of work? I don't need latest and greatest version, jus=
t anything to get working and stable squashfs on top of it.
>

Yes, this should be feasible and not too complex.

> Could you point me to any specific version of ubiblock patch to start fro=
m? Should I apply patches from [1] first? Or any specific patches to UBI or=
 MTD which are missing in that branch?
>

On 15 September 2015 at 11:01, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
[..]
> Backporting the state before my blk-mq conversion should be trivial.

As Richard says, you'll want to avoid the blk-mq conversion. I'd say
starting with v3.18 should
be sufficient:

$ git log v3.18.21  --reverse --no-merges --oneline -- drivers/mtd/ubi/bloc=
k.c
9d54c8a UBI: R/O block driver on top of UBI volumes
4d283ee UBI: block: do not use term "attach"
ca2b722 UBI: block: Mark init-only symbol as __initdata
9981e14 UBI: block: Use 'u64' for the 64-bit dividend
8af8718 UBI: rename block device ioctls
d56030a UBI: block: Remove __initdata from ubiblock_param_ops
b4f42e2 block: remove struct request buffer member
bebfef1 UBI: avoid workqueue format string leak
151d6b2 UBI: block: Fix error path on alloc_workqueue failure
495f2bf UBI: block: Make ubiblock_resize return something
0a3d571 UBI: block: Set disk_capacity out of the mutex
4df3892 UBI: block: Avoid disk size integer overflow
3df7707 UBI: block: fix dereference on uninitialized dev
978d649 UBI: block: Fix block device size setting
06d9c29 UBI: block: Add support for the UBI_VOLUME_UPDATED notification

And you might want to backport this one too:

commit eb20e69ac83a1e4d764a49bf671e1e2e5dc4c15c
Author: Kevin Cernekee <cernekee@chromium.org>
Date:   Wed Apr 22 09:30:53 2015 -0300

    UBI: block: Add missing cache flushes

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
