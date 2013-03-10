Received: from mail-vc0-f169.google.com ([209.85.220.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEZtp-0005l0-M2
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2013 06:38:26 +0000
Received: by mail-vc0-f169.google.com with SMTP id n10so1594622vcn.28
 for <linux-mtd@lists.infradead.org>; Sat, 09 Mar 2013 22:38:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E99E24B@DBDE01.ent.ti.com>
References: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
 <20980858CB6D3A4BAE95CA194937D5E73E99E24B@DBDE01.ent.ti.com>
Date: Sat, 9 Mar 2013 22:38:21 -0800
Message-ID: <CAN8TOE-yrwMshXd+O-Ar0T7O79spzEY+APtxxzFrmA4rK5TKjQ@mail.gmail.com>
Subject: Re: 'ubi clone' from Live NAND.
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringle@sympatico.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As a NAND driver developer and a developer of nanddump / nandwrite, I
have some comments. Note, however, that I have not tried this kind of
UBI clone, so my suggestions are somewhat of educated guesses.

On Thu, Mar 7, 2013 at 4:11 AM, Gupta, Pekon <pekon@ti.com> wrote:
>> If 'rootfs.ubi' is the 'ubinize' image, then I can mount and see the
>> file system on my PC.  However, if the 'rootfs.ubi' is a 'dump' of the
>> NAND flash, I fail with the following 'dmesg',
>
> [pekon]
> I have tried this, using following steps, and it works well
>
> (1) nanddump   -b -s 0x0  -l <size_of_source_partition>  -f  <image_dump.bin>  <source_partition>

FYI, "-b" (or "omitbad") has been dropped from recent nanddump
releases. A similar (but not identical) option is now available as
--bb=skipbad (default). And then, you probably don't want to specify a
-l (length) option, since the length actually refers to the length of
the resulting image, which may vary depending on the number of bad
blocks. So, with recent mtd-utils releases, the equivalent dump would
be:

nanddump --bb=skipbad -s 0x0 -f <image_dump.bin> <source_partition>

or, because many of the provided options are defaults, the following
is also equivalent:

nanddump -f <image_dump.bin> <source_partition>

> (2) flash_erase   <target_partition>  0 0
> (3) nandwrite -n -r   <target_partition>         <image_dump.bin>

This looks likely to cause problems. See my comment below.

> where,
> source_partition= partition on source device from which NAND binary would be dumped. (/dev/mtdX)
> target_partition= partition on another device which NAND dumped image would be flashed (/dev/mtdY)
>
>
> You need to keep few things in mind..
> (1) sizeof(target_partion) > sizeof(source_partition), So as to take care of bad-blocks present on target device.
>
> (2) '-n' option in nandwrite tells NAND driver not to calculate ECC while programming nand, as its is already part of 'raw' binary image

The image dump command above does not contain any ECC information, so
when you write with '-n', you aren't writing *any* ECC information.
This is quite likely to cause your ECC decoder to flag all your data
as uncorrectable. Are you sure this has worked for any length of time?
I would strongly recommend against writing your image in this way.

I'm guessing that your recommendation of '-n' (no ECC) is to solve the
0xFF page problem, documented here?

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat

Anyway, I don't think you want nandwrite; just use ubiformat.

Brian
