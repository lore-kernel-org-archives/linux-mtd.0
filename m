Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQCNu-0003FP-56
 for linux-mtd@lists.infradead.org; Thu, 21 Jul 2016 11:43:22 +0000
Received: by mail-oi0-x242.google.com with SMTP id d204so7444772oig.3
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2016 04:43:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1AA17CE09ACFBD499BB5F503A7513F5B43ADFB03@us0exc08.us.sonicwall.com>
References: <1AA17CE09ACFBD499BB5F503A7513F5B43ADFB03@us0exc08.us.sonicwall.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 21 Jul 2016 13:42:59 +0200
Message-ID: <CAFLxGvySC1f-rN9UKTh-sdZDvCW6M5-FdU3Qepg-8N3JDrTaJA@mail.gmail.com>
Subject: Re: [PATCH] mtd: ubi: Fix race condition between ubi device creation
 and udev
To: Iosif Harutyunov <iharutyunov@sonicwall.com>
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

Iosif,

On Thu, Jul 21, 2016 at 4:07 AM, Iosif Harutyunov
<iharutyunov@sonicwall.com> wrote:
>
> While implementing udev rules for UBI device I ran into the problem when udev would
> ignore UBI rules I created to process attachment of volume. Interestingly, when I trigger
> udev ubi subsystem "change" event manually after the attachment, rules would work just fine.
>
> I traced problem down to UBI sysfs processing, which turned out to be racing condition.
> See patch below to address the problem.

The symptom is that /dev/ubiX_Y appeared, udev got a notification but
reading sysfs
attributes always failed with -ENODEV?

How did you debug this? Sounds like a painful issue to debug. ;-\

> Thanks.
> Iosif,_
>
> Signed-off-by: Iosif Harutyunov <iharutyunov@sonicwall.com>
> ---
> Once ubi is attached, make sure ubi_devices[] is initialized early before being
> used in the dev_attribute_show().
>
> This is to prevent race condition between udev ubi rules processing and ubi device
> creation, which manifests itself ignoring udev ATTR rules.
>
> ---
>  drivers/mtd/ubi/build.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index ef36182..e6117d7 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -986,6 +986,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>                 goto out_free;
>         }
>
> +       ubi_devices[ubi_num] = ubi;
> +

Okay, the fix is to make sure that ubi_devices[ubi_num] is set before
we init sysfs.
Why do you add this before the autoresize code?
I'd expect it right before uif_init().

-- 
Thanks,
//richard
