Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTxE7-0002M7-Dg
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 17:07:12 +0000
Received: by mail-oa0-f51.google.com with SMTP id h16so518543oag.24
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 10:06:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131009120221.GB31294@localhost>
References: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAN8TOE-9XRW9QJ7+sSis+Omo0eVAGVHOXD70P4L8FNbLut=9Dg@mail.gmail.com>
 <20131009120221.GB31294@localhost>
Date: Wed, 9 Oct 2013 10:06:49 -0700
Message-ID: <CAN8TOE84raS7thT5ZU1Zpa7SQO7ocmmOdhrR7KxohQVsJix3Pg@mail.gmail.com>
Subject: Re: [PATCH/TRIVIAL] mtd: Use MTD_BLOCK_MAJOR instead of the magic
 number
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: trivial@kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 9, 2013 at 5:02 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On Tue, Oct 08, 2013 at 06:15:21PM -0700, Brian Norris wrote:
>> Why does MTD_BLOCK_MAJOR (and MTD_CHAR_MAJOR) live in
>> include/linux/mtd/mtd.h and not include/uapi/linux/major.h?
>
> Ah, nice catch. How about something like this?
>
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f9bfe52..9e1471e 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -24,14 +24,12 @@
>  #include <linux/uio.h>
>  #include <linux/notifier.h>
>  #include <linux/device.h>
> +#include <linux/major.h>

I think it's a (weak?) style preference that this type of #include
just go in the files that need it (there are only a few -- 4 I think?)
rather than importing it directly into the mtd.h header for all users.
But I don't object strongly.

>  #include <mtd/mtd-abi.h>
>
>  #include <asm/div64.h>
>
> -#define MTD_CHAR_MAJOR 90
> -#define MTD_BLOCK_MAJOR 31
> -
>  #define MTD_ERASE_PENDING      0x01
>  #define MTD_ERASING            0x02
>  #define MTD_ERASE_SUSPEND      0x04
> diff --git a/include/uapi/linux/major.h b/include/uapi/linux/major.h
> index 6a8ca98..620252e 100644
> --- a/include/uapi/linux/major.h
> +++ b/include/uapi/linux/major.h
> @@ -54,6 +54,7 @@
>  #define ACSI_MAJOR             28
>  #define AZTECH_CDROM_MAJOR     29
>  #define FB_MAJOR               29   /* /dev/fb* framebuffers */
> +#define MTD_BLOCK_MAJOR                31
>  #define CM206_CDROM_MAJOR      32
>  #define IDE2_MAJOR             33
>  #define IDE3_MAJOR             34
> @@ -105,6 +106,7 @@
>  #define IDE6_MAJOR             88
>  #define IDE7_MAJOR             89
>  #define IDE8_MAJOR             90
> +#define MTD_CHAR_MAJOR         90
>  #define IDE9_MAJOR             91
>
>  #define DASD_MAJOR             94
>
> --
>
> If you think this is OK, you can take this patch and I'll cook
> another one moving MTD_xxx_MAJOR as above.

Yeah, the original patch here is good. I'll run it through the build
tests and then apply it. Feel free to send a proper follow-up with
either the diff you just sent or with the #include <linux/major.h>
moved into the appropriate .c files.

Thanks,
Brian
