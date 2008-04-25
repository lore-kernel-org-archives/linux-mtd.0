Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JpLXr-0002t2-Mu
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 10:52:48 +0000
Message-ID: <4811B6BF.9020200@nokia.com>
Date: Fri, 25 Apr 2008 13:47:27 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Nancy <nancydreaming@gmail.com>
Subject: Re: UBI: badblock management confusion!
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>
In-Reply-To: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Nancy wrote:
> Hi all,
>         I don't quite understand the UBI badblock management unit.
> But I think there must be something wrong, or I take a wrong operation.
>         Please follow my test below:
> 
> # ubiformat /dev/mtd5
> ubiformat: mtd5 (NAND), size 536870912 bytes (512.0 MiB), 262144 eraseblocks of
> 262144 bytes (256.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 2047 -- 100 % complete
> ubiformat: 2045 eraseblocks have valid erase counter, mean value is 23
> ubiformat: bad eraseblocks: 10, 40, 84
> ubiformat: formatting eraseblock 2047 -- 100 % complete
> 
> # modprobe ubi mtd=5
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    258048 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "NAND VFAT partition"
> UBI: MTD device size:            512 MiB
> UBI: number of good PEBs:        2045
> UBI: number of bad PEBs:         3
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    256
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     0
> UBI: available PEBs:             2021
> UBI: total number of reserved PEBs: 24
> UBI: number of PEBs reserved for bad PEB handling: 20
> UBI: max/mean erase counter: 38/24
> UBI: background thread "ubi_bgt0d" started, PID 233
> 
> ***************************************************************************
> I'm going to make one big volume which take all available space this ubi
> device has.
> 
> I think the volume size should be equal to
> (total number of PEB this ubi device has - total number of reserved PEBs) \
> * LEB size
> In this case, it should be : (2048-24) * 258048 bytes
> 
> But that is not what UBI count.
> UBI think the volume size
> = (number of good PEBs - total number of reserved PEBs) * LEB size
> 
> Q: Number of bad PEBs at initialization are not included in resered for bad
> PEBs handling. That mean there should never has badblocks overflow issue
> happen. What a good idea! But is there really a possible way to implement this
> idea?

It does work.

>    Suppose there's only one volume take all the ubi device space, there's no
> badblocks at the very beginning. The user does never shut down the device but
> hibernate for a long time. Then, suppose there is 3 badblocks and the volume
> just full of data. No space left. Then reboot the device, beside the 3 badblocks
> which used to be count in reserved PEBs, now be seperate from the reserved PEBs,
> But there's no space, reserved PEB will fail.

No, there will just be a warning - as shown in your test:

	UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling, reserved 19, need 20

There *would* be problem if you marked 21 bad and only 20 were reserved for bad block handling.

> 
>    The following test showes even the volume data is blank, there still comes
> problem.
>    Is it an UBI bug or my wrong operation?

Your wrong operation.

>    Thanks for your notice about it!
> ****************************************************************************
> 
> # ubimkvol /dev/ubi0 -n 0 -N vfat -s 509292KiB
> Volume ID 0, size 2021 LEBs (521515008 bytes, 497.4 MiB), LEB size
> 258048 bytes (252.0 KiB), dynamic, name "vfat", alignment 1
> # rmmod ubi
> UBI: mtd5 is detached from ubi0
> 
> *****************************************************************************
> "markbadblock" is a tool I force to mark a block bad manually, just for test
> *****************************************************************************
> # markbadblock -l 17 /dev/mtd5
> Block size 262144, page size 2048, OOB size 64
> mark block 17 to be badblock done
> 
> # modprobe ubi mtd=5
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    258048 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
> handling, reserved 19, need 20
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "NAND VFAT partition"
> UBI: MTD device size:            512 MiB
> UBI: number of good PEBs:        2044
> UBI: number of bad PEBs:         4
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    256
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 2044
> UBI: number of PEBs reserved for bad PEB handling: 19
> UBI: max/mean erase counter: 39/24
> UBI: background thread "ubi_bgt0d" started, PID 263
> # modprobe ubifs
> 
> # mount -t ubifs ubi0:ubifs /mnt/1
> UBIFS error (pid 293): ubifs_get_sb: cannot open "ubi0:ubifs", error -19

You named the volume "vfat" (-N option of ubimkvol), but you are trying
to mount a volume named "ubifs" i.e. should be:

	mount -t ubifs ubi0:vfat /mnt/1

> mount: mounting ubi0:ubifs on /mnt/1 failed: No such device
> # rmmod ubifs
> # rmmod ubi
> 
> # ubiformat /dev/mtd5
> ubiformat: mtd5 (NAND), size 536870912 bytes (512.0 MiB), 262144 eraseblocks of
> 262144 bytes (256.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 2047 -- 100 % complete
> ubiformat: 2044 eraseblocks have valid erase counter, mean value is 24
> ubiformat: bad eraseblocks: 10, 17, 40, 84
> ubiformat: formatting eraseblock 2047 -- 100 % complete
> 
