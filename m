Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8VLK-0002MP-8d
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 09:52:25 +0000
Message-ID: <4CBEBBC9.5040902@parrot.com>
Date: Wed, 20 Oct 2010 11:52:09 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] UBIFS: add unstable pages problem description
References: <1287396125-1890-1-git-send-email-dedekind1@gmail.com>
	<1287475068.9272.8.camel@localhost>
In-Reply-To: <1287475068.9272.8.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Artem Bityutskiy a écrit :
> On Mon, 2010-10-18 at 13:02 +0300, Artem Bityutskiy wrote:
>> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>>
>> Describe a problem reported by Matthieu CASTET which is currently
>> not handled by UBIFS.
>>
>> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> Matthiew, are you happy with this description? Does it properly reflect
> your findings? Could you please correct, if not?
Yes that seems correct.

> 
> I'm starting working on your problem. Since I do not have much time,
> I'll do a little everyday, but hope to come up with some patches this
> week already. The thing is that it is a lot of work. We need to go
> through a lot of UBI/UBIFS subsystems and analyze them.
> 
> Why a lot of work? Because we assumed everywhere we can rely on CRC - if
> it is correct, we are safe. However, according to you this is not
> reliable for unstable pages - you do not have guarantee that next time
> you read it you will get correct data.
> 
> Also, I do not have HW to test this, so I expect you to help by testing,
> are your testing set-ups kept ready? :-)
> 
Yes our boards are ready to test things.

But we can sent you flashs or boards with the problem.
What flash/board do you have on your side ?
Could you swap nand on your board (via tsop socket) ?

We could sent one of our board, but the update side can be complex/tricky.

Some of beagleboard may have the problem. But I am unable to test it.
On the beagleboard I have, I got strange ecc error [1] event without 
reboot. Also the driver look strange (for example doesn't do bad block 
scanning [2]). I end up with unusable nand [3]. Do you know if there is 
a better version of the nand driver for beagle (I use the one from 
ubi-2.6) ?

Matthieu

[1]
UBI error: ubi_io_read: error -74 (ECC error) while reading 4144
bytes from PEB 3:45056, read 4144 bytes
[...]
UBI error: do_sync_erase: cannot erase PEB 137, error -5


[2]
for each format I got
ubiformat: formatting eraseblock 137 -- 53 % complete
ubiformat: error!: failed to erase eraseblock 137
            error 5 (Input/output error)
ubiformat: marking block 137 bad

[3]
# ubiformat /dev/mtd3 -y 

ubiformat: mtd3 (nand), size 33554432 bytes (32.0 MiB), 256 eraseblocks 
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 255 -- 100 % complete 

ubiformat: 255 eraseblocks have valid erase counter, mean value is 10 

ubiformat: 1 bad eraseblocks found, numbers: 137 

ubiformat: warning!: VID header and data offsets on flash are 2048 and 
4096, which is different to requested offsets 512 and 28
ubiformat: use new offsets 512 and 2048? (yes/no)  yes 

ubiformat: use offsets 512 and 2048 

ubiformat: formatting eraseblock 255 -- 100 % complete 

# ubiattach /dev/ubi_ctrl -m 3 -d 3 

[  166.922119] UBI: attaching mtd3 to ubi3 

[  166.926177] UBI: physical eraseblock size:   131072 bytes (128 KiB) 

[  166.932495] UBI: logical eraseblock size:    129024 bytes 

[  166.937927] UBI: smallest flash I/O unit:    2048 

[  166.942657] UBI: sub-page size:              512 

[  166.947326] UBI: VID header offset:          512 (aligned 512) 

[  166.953186] UBI: data offset:                2048 

[  166.958740] Correcting single bit ECC error at offset: 389, bit: 3 

[  167.137695] UBI: max. sequence number:       0 

[  167.142883] Correcting single bit ECC error at offset: 340, bit: 6 

[  167.149108] ecc failure 

[  167.151580] Correcting single bit ECC error at offset: 12, bit: 6 

[  167.158325] ecc failure 

[  167.160797] ecc failure 

[  167.163269] Correcting single bit ECC error at offset: 44, bit: 6 

[  167.170013] ecc failure 

[  167.172485] ecc failure 

[  167.175567] ecc failure 

[  167.178039] ecc failure 

[  167.181121] ecc failure 

[  167.183593] ecc failure 

[  167.186645] ecc failure 

[  167.189147] ecc failure 

[  167.192199] Correcting single bit ECC error at offset: 188, bit: 6 

[  167.198455] Correcting single bit ECC error at offset: 196, bit: 6 

[  167.205291] Correcting single bit ECC error at offset: 220, bit: 6 

[  167.211517] Correcting single bit ECC error at offset: 228, bit: 6 

[  167.218353] Correcting single bit ECC error at offset: 252, bit: 6 

[  167.224578] Correcting single bit ECC error at offset: 260, bit: 6 

[  167.231445] Correcting single bit ECC error at offset: 284, bit: 6 

[  167.237670] Correcting single bit ECC error at offset: 292, bit: 6 

[  167.244537] Correcting single bit ECC error at offset: 316, bit: 6 

[  167.250762] Correcting single bit ECC error at offset: 324, bit: 6 

[  167.256988] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 22528 bytes from PEB 0:2048, read 22528 bytes
[  167.267700] [<c0034d5c>] (unwind_backtrace+0x0/0xf4) from 
[<c01db4dc>] (ubi_io_read+0x1b0/0x340)
[  167.276580] [<c01db4dc>] (ubi_io_read+0x1b0/0x340) from [<c01d1728>] 
(ubi_read_volume_table+0xbc/0xa44)
[  167.286071] [<c01d1728>] (ubi_read_volume_table+0xbc/0xa44) from 
[<c01d537c>] (ubi_attach_mtd_dev+0x674/0xcd0)
[  167.296173] [<c01d537c>] (ubi_attach_mtd_dev+0x674/0xcd0) from 
[<c01d5b80>] (ctrl_cdev_ioctl+0xec/0x164)
[  167.305725] [<c01d5b80>] (ctrl_cdev_ioctl+0xec/0x164) from 
[<c00d63d0>] (do_vfs_ioctl+0x7c/0x5f8)
[  167.314697] [<c00d63d0>] (do_vfs_ioctl+0x7c/0x5f8) from [<c00d6984>] 
(sys_ioctl+0x38/0x60)
[  167.323028] [<c00d6984>] (sys_ioctl+0x38/0x60) from [<c00300c0>] 
(ret_fast_syscall+0x0/0x30)
[  167.332214] Correcting single bit ECC error at offset: 340, bit: 6 

[  167.338470] ecc failure 

[  167.340942] Correcting single bit ECC error at offset: 12, bit: 6 

[  167.347686] ecc failure 

[  167.350158] ecc failure 

[  167.352630] Correcting single bit ECC error at offset: 44, bit: 6 

[  167.359375] ecc failure 

[  167.361846] ecc failure 

[  167.364929] ecc failure 

[  167.367401] ecc failure 

[  167.370452] ecc failure 

[  167.372955] ecc failure 

[  167.376007] ecc failure 

[  167.378479] ecc failure 

[  167.381561] Correcting single bit ECC error at offset: 188, bit: 6 

[  167.387786] Correcting single bit ECC error at offset: 196, bit: 6 

[  167.394653] Correcting single bit ECC error at offset: 220, bit: 6 

[  167.400848] Correcting single bit ECC error at offset: 228, bit: 6 

[  167.407714] Correcting single bit ECC error at offset: 252, bit: 6 

[  167.413940] Correcting single bit ECC error at offset: 260, bit: 6 

[  167.420806] Correcting single bit ECC error at offset: 284, bit: 6 

[  167.427032] Correcting single bit ECC error at offset: 292, bit: 6 

[  167.433868] Correcting single bit ECC error at offset: 316, bit: 6 

[  167.440124] Correcting single bit ECC error at offset: 324, bit: 6 

[  167.446350] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 22528 bytes from PEB 1:2048, read 22528 bytes
[  167.457031] [<c0034d5c>] (unwind_backtrace+0x0/0xf4) from 
[<c01db4dc>] (ubi_io_read+0x1b0/0x340)
[  167.465911] [<c01db4dc>] (ubi_io_read+0x1b0/0x340) from [<c01d1728>] 
(ubi_read_volume_table+0xbc/0xa44)
[  167.475402] [<c01d1728>] (ubi_read_volume_table+0xbc/0xa44) from 
[<c01d537c>] (ubi_attach_mtd_dev+0x674/0xcd0)
[  167.485473] [<c01d537c>] (ubi_attach_mtd_dev+0x674/0xcd0) from 
[<c01d5b80>] (ctrl_cdev_ioctl+0xec/0x164)
[  167.495056] [<c01d5b80>] (ctrl_cdev_ioctl+0xec/0x164) from 
[<c00d63d0>] (do_vfs_ioctl+0x7c/0x5f8)
[  167.503997] [<c00d63d0>] (do_vfs_ioctl+0x7c/0x5f8) from [<c00d6984>] 
(sys_ioctl+0x38/0x60)
[  167.512329] [<c00d6984>] (sys_ioctl+0x38/0x60) from [<c00300c0>] 
(ret_fast_syscall+0x0/0x30)
[  167.520874] UBI error: vtbl_check: bad CRC at record 1: 0xf116c36b, 
not 0xb116c36b
[  167.528594] UBI error: vtbl_check: bad CRC at record 1: 0xf116c36b, 
not 0xb116c36b
[  167.536285] UBI error: process_lvol: both volume tables are corrupted 

[  167.542877] UBI error: ubi_attach_mtd_dev: failed to attach by 
scanning, error -22
ubiattach: error!: cannot attach mtd3 

            error 22 (Invalid argument)
