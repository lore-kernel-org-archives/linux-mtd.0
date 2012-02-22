Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S07Ok-0001cK-Du
 for linux-mtd@lists.infradead.org; Wed, 22 Feb 2012 08:18:03 +0000
Received: by yhjj56 with SMTP id j56so3603430yhj.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2012 00:18:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F430DA5.9040003@freescale.com>
References: <1329476273-14381-1-git-send-email-b32955@freescale.com>
 <CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>
 <4F430DA5.9040003@freescale.com>
Date: Wed, 22 Feb 2012 00:18:00 -0800
Message-ID: <CAN8TOE8MVdnG4jc785H5r9J5gAf2cEe_GZYCh0nSN7jrnYYzRg@mail.gmail.com>
Subject: Re: [PATCH] mtd: use the full-id string as the keyword to search the
 id table
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 20, 2012 at 7:21 PM, Huang Shijie <b32955@freescale.com> wrote:
>> Do you have a particular reason why the nand_flash_full_ids[] and
>> nand_flash_ids[] tables can't be merged, and (1) (2) and (4) performed
>
> The particular reason is we can not get the right chipsize when two
> same Device ids appears.

But if we make some small changes to how the table is parsed (as I
already mentioned), then we can order entries properly, such that the
longest ID strings are at the top, with more generic strings (with
just the device ID, for instance, that still require ID decoding)
placed lower in the table. That would allow multiple uses of the same
device ID, matching to the most specific entry available.

> We can not get the right chipsize from H27UBG8T2A's ID data. There is
> already a 0xd7 device id in the nand_flash_ids table.

There is already a 0xD7 device ID, but it's correct, isn't it? I mean,
H27UBG8T2A is 32 Gbit and so is 0xD7? There's still a problem with
parsing the other properties, but there *is* a provided parsing table,
as mentioned already.

>> only after the ONFI detection? We simply order the "full ID" entries
>> first in the table, so that if they match, then we break out of our
>
> I ever thought this method too, =A0It does works too.
> But =A0it makes the nand_flash_ids mess in logic. The full ID entries sta=
nds
> for single nands, while
> the others stand for a class of nands. =A0Is the "mess in logic" acceptab=
le to
> us?
>
> I do not object this method, If Artem also agrees this method, I can chan=
ge
> the patch.

Alright. We'll see if Artem will appear again soon. Looks like he's
been busy with other things for the last week or so.

BTW, there are a few other issues:

(1) you missed a change to nandsim's usage of nand_flash_ids[]
(2) are the SZ_* macros safe to use here? Compilation here (i386,
defconfig + MTD enabled) fails with stuff like the following:

  CC      drivers/mtd/nand/nand_ids.o
drivers/mtd/nand/nand_ids.c:18:5: error: =91SZ_8K=92 undeclared here (not
in a function)

If I make some tweaks or have my own additions based on your patches,
is it best to send my own patch series with your name included in the
description, or is there some official way of tagging it? (Like just a
"Signed-off-by" on an ACKed, final version?)

Brian
