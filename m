Received: from blu0-omc1-s27.blu0.hotmail.com ([65.55.116.38])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHbpw-0004gE-Aj
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 15:18:57 +0000
Message-ID: <BLU0-SMTP1571BC8B2E1A0CF1ECB92CB8E80@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: dedekind1@gmail.com
Subject: Re: 'ubi clone' from Live NAND.
References: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
 <1363171938.11441.9.camel@sauron.fi.intel.com>
Date: Mon, 18 Mar 2013 11:20:11 -0400
In-Reply-To: <1363171938.11441.9.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Wed, 13 Mar 2013 12:52:18 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2013-03-06 at 15:08 -0500, Bill Pringlemeir wrote:
>> I have a 'ubinize' image that I have created on a PC and I have a
>> 'raw' copy of the NAND flash on a 'Live' Linux distribution; the
>> target was cleanly unmounted.  I use nandsim, with all my real FLASH
>> id bytes and setup partitions as per the target.  Here is the
>> sequence I follow on my PC.

>>  modprobe nandsim first_id_byte=0x2c second_id_byte=0xda third_id_byte=0x90 fourth_id_byte=0x95 parts=2,64,64
>>  flash_erase /dev/mtd3 0 0
>>  ubiformat /dev/mtd3 -f rootfs.ubi
>>  modprobe ubi mtd=3
>>  mount -t ubifs /dev/ubi0_3 /mnt/ubifs

On 13 Mar 2013, dedekind1@gmail.com wrote:

> Does it work if you do the same, but avoid flashing your 'rootfs.ubi'.
> Just run 'ubiformat /dev/mtd3'. Can you mount it then, successfully do
> the I/O, unmount, and remount? If that works fine, you probably did
> not create 'rootfs.ubi' correctly. Double-check that you specified
> correct eraseblock size, correct nand page size and subpage size.

Thanks, all.  Indeed everything is fine if I don't use the 'improper'
rootfs.ubi.  Pekon Gupta had clued me in to the problem; If he hadn't, I
think Brian would have.  I am not using 'nandump' as I don't want the
file system to be live.  I wanted to use a flash programmer/JTAG device
to get a copy of the flash.

The problem is simply that the binary copy must include the 'entire
flash' and not be limited to a 'df' size because of course UBI does wear
leveling across the whole partition; a benefit of using it that I had
forgot about.

The 'dmesg' was basically as if someone suddenly truncated the 'UbiFs'
file system.

Sorry to trouble you.  I hope the information is useful to someone in
the future.  Btw, it doesn't seem that I have to avoid bad blocks.  I
think the 'host' UBI/UbiFs recognizes that erase blocks are bad from the
'target' copy and doesn't use them, or I was lucky and somehow I didn't
have bad blocks or the tool/code I am using is somehow removing them.

Regards,
Bill Pringlemeir.

-- 
If it weren't for pickpockets I'd have no sex life at all. 
- Rodney Dangerfield
