Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6BxR-0001O2-9r
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 07:13:21 +0000
Received: by mail-oi0-x230.google.com with SMTP id j1so160928298oih.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 00:12:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <046201d1b7b0$5f15b400$1d411c00$@rogers.com>
References: <046201d1b7b0$5f15b400$1d411c00$@rogers.com>
Date: Fri, 27 May 2016 09:12:58 +0200
Message-ID: <CAFLxGvyQ3-xa2OKuv_aBPhOmKWMEsMCL8RNB3F9o21NWnyjs7A@mail.gmail.com>
Subject: Re: Looking for an alternative to ubimirror
From: Richard Weinberger <richard.weinberger@gmail.com>
To: PJ <paul.j2@rogers.com>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 27, 2016 at 2:40 AM, PJ <paul.j2@rogers.com> wrote:
> Hi,
>
> Can anyone please recommend a procedure to copy one UBI volume to another?
>
> I'd like to execute from the bash command line, if possible.
>
> One upon a time I was able to use ubimirror, however that command appears to
> have been removed from mtd-utils.
>
> - The source volume will be mounted R/O as it is the rootfs.
> - The destination volume will be unrestricted (unmounted).
> - Both the source and destination volumes are in the same device.
>
> I checked the FAQ, the archive, and Google but I came up empty, so thanks.

This happened some time ago:
commit 94a20240f9d6776619d7652013bb10131ddad1fc
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Tue Sep 28 10:47:06 2010 +0300

    ubi-utils: remove old ubi-utils

    The utilities are unmaintained for long time, and many of them
    do not even work, just compile, and no on complains about this.
    This suggests they are unused and we can now safely kill them.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>


Artem? :-)

-- 
Thanks,
//richard
