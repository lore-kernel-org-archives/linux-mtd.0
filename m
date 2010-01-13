Received: from mail.theptrgroup.com ([71.178.251.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUtsL-0001kw-L6
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 03:26:33 +0000
Message-ID: <4B4D3D61.2020305@theptrgroup.com>
Date: Tue, 12 Jan 2010 22:26:25 -0500
From: Jeff Angielski <jeff@theptrgroup.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubiattach fails with "bad image sequence number"
References: <4B2FF7CF.7040401@theptrgroup.com>	
	<1263081089.7315.119.camel@localhost.localdomain>
	<1263081191.7315.121.camel@localhost.localdomain>
In-Reply-To: <1263081191.7315.121.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Sun, 2010-01-10 at 01:51 +0200, Artem Bityutskiy wrote:
>> Hi,
>>
>> On Mon, 2009-12-21 at 17:33 -0500, Jeff Angielski wrote:
>>> If I ubiformat my NAND partition with an UBIFS image I keep on getting 
>>> "bad image sequence number" when I try to do the ubiattach.  If I just 
>>> do a plain ubiformat with no image then everything works fine when I 
>>> ubiattach.
>>>
>>> I was wondering if somebody ran into something similar.  The steps are 
>>> so trivial it seems like something fundamentally wrong with either the 
>>> mkfs.ubifs or the ubiformat.
>>>
>>> I did not see anything related to this on the UBFI FAQ or documentation.
>> I believe this is an ubiformat bug. Thanks for reporting and sorry for
>> inconvenience.
>>
>> I attach and inline 2 patches which should fix this. I cannot have a
>> possibility to test them now, so they are untested. They are against the
>> latest mtd-utils.git (commit a4e502d99129da8ebba6d40b373a4422a175e9af).
> 
> Could you please try them and report if they fix your problem or not?
> 
> P.S. when we fix this, we'll have to tag a new mtd-utils version, since
> this is a very bad bug.

This patch worked for me.

FWIW, I am using 2.6.31 kernel and the mtd-utils last commit was: 
a4e502d99129da8ebba6d40b373a4422a175e9af.

I did receive a warning "ubi_eba_init_scan: cannot reserve enough PEBs 
for bad PEB handling, reserved 9, need 20" but I believe that is 
operator error related to the large volume size in the mtd partition.

I have one slight change from the original command line commands I 
posted.  For mkfs.ubifs my original -e was incorrectly the PEB instead 
of the LEB.  So for those kids following along, don't use the original 
command sequence.


So the new command line sequence on the x86 host looks like:

$ mkfs.ubifs -r build/targetfs_tiny -m 4096 -e 258048 -c 2047 -o tiny.ubifs

$ ubinize -s 1024 -o ubifs1b.img -m 4096 -p 256KiB ubifs1.cfg

$ cat ubifs1.cfg
[ubifs]
mode=ubi
image=tiny.ubifs
vol_id=0
vol_size=500MiB
vol_type=dynamic
vol_name=fs1
vol_alignment=1
vol_flags=autoresize

And on the PowerPC target:

# ubiformat -s 1024 -f ubifs1b.img /dev/mtd8
ubiformat: mtd8 (nand), size 536870912 bytes (512.0 MiB), 2048 
eraseblocks of 262144 bytes (256.0 KiB), min. I/O size 4096 bytes
libscan: scanning eraseblock 2047 -- 100 % complete 

ubiformat: 2045 eraseblocks have valid erase counter, mean value is 6 

ubiformat: 3 bad eraseblocks found, numbers: 72, 930, 1846 

ubiformat: flashing eraseblock 30 -- 100 % complete 

ubiformat: formatting eraseblock 2047 -- 100 % complete 


# ubiattach /dev/ubi_ctrl -m 8
[ 3149.923007] UBI: attaching mtd8 to ubi0
[ 3149.927224] UBI: physical eraseblock size:   262144 bytes (256 KiB)
[ 3149.934138] UBI: logical eraseblock size:    258048 bytes
[ 3149.939914] UBI: smallest flash I/O unit:    4096
[ 3149.944762] UBI: sub-page size:              1024
[ 3149.949573] UBI: VID header offset:          1024 (aligned 1024)
[ 3149.955688] UBI: data offset:                4096
[ 3151.183443] UBI warning: ubi_eba_init_scan: cannot reserve enough 
PEBs for bad PEB handling, reserved 9, need 20
[ 3151.209875] UBI: volume 0 ("fs1") re-sized from 2032 to 2032 LEBs
[ 3151.224125] UBI: attached mtd8 to ubi0
[ 3151.228345] UBI: MTD device name:            "fs1"
[ 3151.234848] UBI: MTD device size:            512 MiB
[ 3151.239993] UBI: number of good PEBs:        2045
[ 3151.244830] UBI: number of bad PEBs:         3
[ 3151.249382] UBI: max. allowed volumes:       128
[ 3151.254106] UBI: wear-leveling threshold:    4096
[ 3151.258916] UBI: number of internal volumes: 1
[ 3151.263465] UBI: number of user volumes:     1
[ 3151.268013] UBI: available PEBs:             0
[ 3151.272562] UBI: total number of reserved PEBs: 2045
[ 3151.277633] UBI: number of PEBs reserved for bad PEB handling: 9
[ 3151.283748] UBI: max/mean erase counter: 8/7
[ 3151.288124] UBI: image sequence number: 882190247
[ 3151.292941] UBI: background thread "ubi_bgt0d" started, PID 1055
UBI device number 0, total 2045 LEBs (527708160 bytes, 503.3 MiB), 
available 0 LEBs (0 bytes), LEB size 258048 bytes (252.0 KiB)

# mount -t ubifs ubi0:fs1 /mnt/ubifs
[ 3165.535851] UBIFS: mounted UBI device 0, volume 0, name "fs1"
[ 3165.541636] UBIFS: file system size:   521773056 bytes (509544 KiB, 
497 MiB, 2022 LEBs)
[ 3165.549640] UBIFS: journal size:       9420800 bytes (9200 KiB, 8 
MiB, 37 LEBs)
[ 3165.556948] UBIFS: media format:       w4/r0 (latest is w4/r0)
[ 3165.562779] UBIFS: default compressor: lzo
[ 3165.566873] UBIFS: reserved for root:  0 bytes (0 KiB)



-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
