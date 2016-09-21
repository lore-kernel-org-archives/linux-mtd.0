Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeCD-0001aO-HS
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:52:59 +0000
Subject: Re: Micron qspi nor flash and UBIFS
To: Richard Weinberger <richard@nod.at>, Andras Szemzo
 <szemzo.andras@gmail.com>
References: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
 <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
 <CB87F86A-3E14-4091-B669-6C325085F397@gmail.com>
 <3806eb18-1939-567d-6006-ae02ecbf14a4@nod.at>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 <hramrach@gmail.com>, <computersforpeace@gmail.com>
Message-ID: <7a29bdfc-3722-2869-54fc-6cf79c2e1af5@atmel.com>
Date: Wed, 21 Sep 2016 11:51:09 +0200
MIME-Version: 1.0
In-Reply-To: <3806eb18-1939-567d-6006-ae02ecbf14a4@nod.at>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 01/09/2016 à 12:23, Richard Weinberger a écrit :
> Andras,
> 
> On 01.09.2016 11:37, Andras Szemzo wrote:
>> UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 47
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 1 at drivers/mtd/spi-nor/spi-nor.c:1177 spi_nor_write+0x57/0xea
>> Writing at offset 128 into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-rc2 #49
>> Hardware name: Atmel SAMx7
>> [<7000c5d9>] (unwind_backtrace) from [<7000b3ab>] (show_stack+0xb/0xc)
>> [<7000b3ab>] (show_stack) from [<7000f095>] (__warn+0x89/0xb0)
>> [<7000f095>] (__warn) from [<7000f0db>] (warn_slowpath_fmt+0x1f/0x28)
>> [<7000f0db>] (warn_slowpath_fmt) from [<70127e8d>] (spi_nor_write+0x57/0xea)
>> [<70127e8d>] (spi_nor_write) from [<70124593>] (part_write+0x27/0x2a)
>> [<70124593>] (part_write) from [<70122717>] (mtd_write+0x53/0x68)
>> [<70122717>] (mtd_write) from [<701301f3>] (ubi_io_write+0x23f/0x410)
>> [<701301f3>] (ubi_io_write) from [<7012e0f7>] (ubi_eba_write_leb+0x77/0x5fc)
>> [<7012e0f7>] (ubi_eba_write_leb) from [<7012d4c1>] (ubi_leb_write+0x71/0x8a)
>> [<7012d4c1>] (ubi_leb_write) from [<7009dd9d>] (ubifs_leb_write+0x65/0xb4)
>> [<7009dd9d>] (ubifs_leb_write) from [<7009edf3>] (ubifs_write_node+0xf7/0x124)
>> [<7009edf3>] (ubifs_write_node) from [<700a2945>] (ubifs_write_master+0x91/0xc8)
>> [<700a2945>] (ubifs_write_master) from [<7009c64f>] (ubifs_mount+0xebf/0x1020)
>> [<7009c64f>] (ubifs_mount) from [<700555e9>] (mount_fs+0x9/0x60)
>> [<700555e9>] (mount_fs) from [<7006427b>] (vfs_kern_mount+0x33/0xc0)
>> [<7006427b>] (vfs_kern_mount) from [<700664c9>] (do_mount+0x599/0x788)
>> [<700664c9>] (do_mount) from [<7006682b>] (SyS_mount+0x4f/0x6a)
>> [<7006682b>] (SyS_mount) from [<702cd8d1>] (mount_block_root+0xa9/0x1e8)
>> [<702cd8d1>] (mount_block_root) from [<702cdab1>] (prepare_namespace+0x4d/0xf0)
>> [<702cdab1>] (prepare_namespace) from [<702cd731>] (kernel_init_freeable+0x105/0x14c)
>> [<702cd731>] (kernel_init_freeable) from [<701c67db>] (kernel_init+0x7/0xa0)
>> [<701c67db>] (kernel_init) from [<70009c49>] (ret_from_fork+0x11/0x28)
> 
> This proves my assumption.
> spi-nor.c warns as soon you write with an offset to a page.
> So, it will warn for *every* non-trivial user.
> 
> The warning is also rather new, CC'ing patch authors.
> 
> commit e5d05cbd6d8b01f08c95c427a36c66aac769af4f
> Author: Michal Suchanek <hramrach@gmail.com>
> Date:   Thu May 5 17:31:54 2016 -0700
> 
>     mtd: spi-nor: simplify write loop
> 
>     The spi-nor write loop assumes that what is passed to the hardware
>     driver write() is what gets written.
> 
>     When write() writes less than page size at once data is dropped on the
>     floor. Check the amount of data writen and exit if it does not match
>     requested amount.
> 
>     Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>     Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>     Tested-by Cyrille Pitchen <cyrille.pitchen@atmel.com>
>     Acked-by: Michal Suchanek <hramrach@gmail.com>
>     Tested-by: Michal Suchanek <hramrach@gmail.com>
> 
> 
> Guys, this patch is odd in multiple ways.
> 1. Patch description does not match the code. It does *not* just simplify the write loop.
>    It also introduces a new scary WARN_ON_ONCE(). Unless I miss something it will trigger
>    for every write with an offset. So, you rule out any filesystem on top of SPI-NOR.
>    What's the deal?

I've just looked closely to this specific patch in the Michal's series: except
for WARN_ONCE(), the new code seems alright. The new loop is more readable than
it was before and now it also checks the actual amount of written data returned
by the .write() hook to avoid crossing the page boundary during the next
.write() call.

With the old spi_nor_write() implementation:

Inputs:
nor->page_size = 256
to = 0;
len = 0x10000;
ret = nor->page_size;

The old loop:
for (i = ret; i < len; ) {
	page_size = len - 1;
	if (page_size > nor->page_size)
		page_size = nor->page_size;

	[...]
	ret = nor->write(nor, to + i, page_size, buf + i);
	if (ret < 0)
		goto write_err;
	i += ret;
}

If one call of .write() wrote less than nor->page_size, the next call of
.write() tried to write a *full* page at a page unaligned offset, hence
crossing the page boundary. It might be an issue with some memories.
Indeed, crossing the *sector* boundary during a Page Program operation is an
issue with some Micron memories which stack 2 memories in a single package.

So I think we should keep Michal's patch but only remove the WARN_ONCE() as
it seems to be the only regression reported.

Richard, Andras, would it be ok for you?


> 2. The SOB chain is strange. Michal, you authored this patch, right?
>    Why did you add an Acked-by and Tested-by tag too?
> 
> Thanks,
> //richard
> 

Best regards,

Cyrille
