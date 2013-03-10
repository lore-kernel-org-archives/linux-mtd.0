Received: from mail-vc0-f174.google.com ([209.85.220.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEaSr-00008h-Im
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2013 07:14:38 +0000
Received: by mail-vc0-f174.google.com with SMTP id n11so1567135vch.5
 for <linux-mtd@lists.infradead.org>; Sat, 09 Mar 2013 23:14:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGNmLEN8OJw5AmbGE2LHoWMRdb8tTh4ySojnFbSY6ZY1EfgWmQ@mail.gmail.com>
References: <CAGNmLEN8OJw5AmbGE2LHoWMRdb8tTh4ySojnFbSY6ZY1EfgWmQ@mail.gmail.com>
Date: Sat, 9 Mar 2013 23:14:34 -0800
Message-ID: <CAN8TOE-4m6XnK=RqJFoy31=ebCdt5PYd9PqjdzAZebfCn4m-sA@mail.gmail.com>
Subject: Re: [PATCH] mtd omap2 driver fix IOERR
From: Brian Norris <computersforpeace@gmail.com>
To: Toan Pham <tpham3783@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: jzhang@ti.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Toan,

On Mon, Mar 4, 2013 at 10:03 AM, Toan Pham <tpham3783@gmail.com> wrote:
> I am running the omap2 nand driver on kernel 2.6.39 and i am having a
> problem formatting JFFS2 filesystem.  Normal flash erase by issuing
> "flash_erase /dev/mtd4 0 0" would work fine.  However, nand erase with JFFS2
> formatting by issuing "flash_erase -j /dev/mtd4 0 0"  would fail with IO
> errors.  Below is the description of the error generated from
> mtd-utils-1.4.9 or mtd-utils-1.5.0.
>
> localhost# flash_erase -j /dev/mtd4 0 0
>
> Erasing 128 Kibyte @ 1f920000 -- 99 % complete libmtd: error!: MEMERASE64
> ioctl failed for eraseblock 4041 (mtd4)
>         error 5 (Input/output error)
> flash_erase: error!: /dev/mtd4: MTD Erase failure
>              error 5 (Input/output error)
> Erasing 128 Kibyte @ 1f940000 -- 99 % complete libmtd: error!: MEMERASE64
> ioctl failed for eraseblock 4042 (mtd4)
>         error 5 (Input/output error)
> flash_erase: error!: /dev/mtd4: MTD Erase failure
>              error 5 (Input/output error)
> etc......
>
> Attached is a bug fix to properly use Jiffies tick timer.  Previous code was
> buggy b/c it did not account for scheduler tick (HZ) to be less than 50HZ.
> When kernel config HZ tick is set below 50HZ, the omap driver does not wait
> at all after executing a status request command, because:
>
> timeo += (HZ * 20) / 1000;
>
> evaluates to zero.  Again, this bug should only surface when HZ is set below
> 50Hz.

Your patch looks correct, but can you do a few things to make it
easier to accept into the kernel?

1) Look at the SubmittingPatches documentation, e.g.:

https://www.kernel.org/doc/Documentation/SubmittingPatches

For one, it is useful to provide the patch inline (not an attachment).
But if your mail client will mangle that, then an attachment is
probably OK.

2) Provide a "Signed-off-by" line. 'SubmittingPatches' describes what
this means, exactly.

3) Don't use spaces for indentation; use tabs. If you need other tips
on Linux kernel coding style, see:

https://www.kernel.org/doc/Documentation/CodingStyle

Thanks,
Brian
