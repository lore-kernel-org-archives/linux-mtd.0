Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S07j8-0002Ps-Tb
 for linux-mtd@lists.infradead.org; Wed, 22 Feb 2012 08:39:08 +0000
Message-ID: <4F44AA27.9090605@freescale.com>
Date: Wed, 22 Feb 2012 16:41:11 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: use the full-id string as the keyword to search
 the id table
References: <1329476273-14381-1-git-send-email-b32955@freescale.com>	<CAN8TOE92WVD0Z6e7WtyUp4gD4XN9EwFBXwg8Y9UPcpoQQEzBnQ@mail.gmail.com>	<4F430DA5.9040003@freescale.com>
 <CAN8TOE8MVdnG4jc785H5r9J5gAf2cEe_GZYCh0nSN7jrnYYzRg@mail.gmail.com>
In-Reply-To: <CAN8TOE8MVdnG4jc785H5r9J5gAf2cEe_GZYCh0nSN7jrnYYzRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

=E4=BA=8E 2012=E5=B9=B402=E6=9C=8822=E6=97=A5 16:18, Brian Norris =E5=86=99=
=E9=81=93:
> On Mon, Feb 20, 2012 at 7:21 PM, Huang Shijie<b32955@freescale.com>  wr=
ote:
>>> Do you have a particular reason why the nand_flash_full_ids[] and
>>> nand_flash_ids[] tables can't be merged, and (1) (2) and (4) performe=
d
>> The particular reason is we can not get the right chipsize when two
>> same Device ids appears.
> But if we make some small changes to how the table is parsed (as I
> already mentioned), then we can order entries properly, such that the
> longest ID strings are at the top, with more generic strings (with
> just the device ID, for instance, that still require ID decoding)
> placed lower in the table. That would allow multiple uses of the same
> device ID, matching to the most specific entry available.
>
yes, I know.
>> We can not get the right chipsize from H27UBG8T2A's ID data. There is
>> already a 0xd7 device id in the nand_flash_ids table.
> There is already a 0xD7 device ID, but it's correct, isn't it? I mean,
> H27UBG8T2A is 32 Gbit and so is 0xD7? There's still a problem with
:(, yes, you are right. I am an idiot.

It seems there is no need to add a new table now.
The only thing is to add parsing functions for Hynix.

BR
Huang Shijie
> parsing the other properties, but there *is* a provided parsing table,
> as mentioned already.
>
>>> only after the ONFI detection? We simply order the "full ID" entries
>>> first in the table, so that if they match, then we break out of our
>> I ever thought this method too,  It does works too.
>> But  it makes the nand_flash_ids mess in logic. The full ID entries st=
ands
>> for single nands, while
>> the others stand for a class of nands.  Is the "mess in logic" accepta=
ble to
>> us?
>>
>> I do not object this method, If Artem also agrees this method, I can c=
hange
>> the patch.
> Alright. We'll see if Artem will appear again soon. Looks like he's
> been busy with other things for the last week or so.
>
> BTW, there are a few other issues:
>
> (1) you missed a change to nandsim's usage of nand_flash_ids[]
> (2) are the SZ_* macros safe to use here? Compilation here (i386,
> defconfig + MTD enabled) fails with stuff like the following:
>
>    CC      drivers/mtd/nand/nand_ids.o
> drivers/mtd/nand/nand_ids.c:18:5: error: =E2=80=98SZ_8K=E2=80=99 undecl=
ared here (not
> in a function)
>
> If I make some tweaks or have my own additions based on your patches,
> is it best to send my own patch series with your name included in the
> description, or is there some official way of tagging it? (Like just a
> "Signed-off-by" on an ACKed, final version?)
>
> Brian
>
