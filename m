Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyLHa-0002WB-UV
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 15:01:28 +0000
Received: by obbnk6 with SMTP id nk6so123315310obb.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 07:01:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151103143850.45c4ded9@bbrezillon>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
 <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
 <562FD60E.9020807@nod.at>
 <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
 <CAJ+vNU3Y_SnLSAojp3-hXxR02dtfX5n78GkS6Zt-izDZMh2msQ@mail.gmail.com>
 <20151103143850.45c4ded9@bbrezillon>
Date: Mon, 16 Nov 2015 07:01:05 -0800
Message-ID: <CAJ+vNU2Sm9wzdM7mbe6c-qtKbYcOkn_KauPfSpmS6Kao=+AjWQ@mail.gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
From: Tim Harvey <tharvey@gateworks.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Huang Shijie <shijie.huang@arm.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 3, 2015 at 5:38 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Tim,
>
> On Mon, 2 Nov 2015 12:31:11 -0800
> Tim Harvey <tharvey@gateworks.com> wrote:
>
>> On Mon, Nov 2, 2015 at 12:27 PM, Tim Harvey <tharvey@gateworks.com> wrote:
>> > [    8.635364] UBIFS (ubi0:0): recovery needed
>> > [    8.676203] ubi0 warning: ubi_io_read: error -74 (ECC error) while
>> > reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
>> > [    8.692460] ubi0 warning: ubi_io_read: error -74 (ECC error) while
>> > reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
>> > [    8.708741] ubi0 warning: ubi_io_read: error -74 (ECC error) while
>> > reading 69632 bytes from PEB 2254:192512, read only 69632 bytes, retry
>> > ^^^^ non correctable ecc error on PEB 2254  - I verified that this was
>> > not the first time this PEB has been used
>
> I suspect one of the bit in PEB 2254 to be stuck at 0 (even after
> erasing the block the bit stays at 0). Have you tried to erase this
> block (flash_erase /dev/mtd2 0x23380000 1) and dump it in raw mode
> (nanddump -n -l 0x40000 -s 0x23380000 -f /tmp/dump /dev/mtd2)?

Boris,

I examined the bad PEB on several boards now that I have reproduced
this issue with and found no stuck bits (no 0's following erase, no
1's following erase and raw write all ff's).

So in this case it doesn't appear to be a bad block. Incidentally for
UBI/UBIFS, what is in charge of detecting bad blocks, how are they
detected, and when/how are they marked?

>
>> >
>> > I've cc'd Huang, Elie, and Brian who were involved in the patch to
>> > detect bit-flips in gpmi-nand.c reads - perhaps they have some more
>> > ideas. I find it interesting that in one case that patch resolves the
>> > issue and in the other it does not.
>
> I posted a slightly reworked version of Huang's patch [1] a while ago
> addressing the "account for bitflips in OOB area" problem, but maybe we
> could do better (avoid this extra "read in raw mode" step, or use the
> generic nand_check_erased_ecc_chunk() function when ECC bytes are
> aligned).
>
> Best Regards,
>
> Boris
>
> [1]https://patchwork.ozlabs.org/patch/416543/

At this point I likely need to reproduce this problem with additional
debugging enabled to show what last erased and/or wrote to the PEB's
that are corrupt. I will also try your patch as well and see if that
resolves anything.

Regards,

Tim
