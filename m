Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MlkXd-0007vD-Vh
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 14:22:33 +0000
Message-ID: <4AA90BA0.2010000@maxim-ic.com>
Date: Thu, 10 Sep 2009 19:52:24 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>
In-Reply-To: <4AA90351.3050000@nokia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, we still have many UBI/UBIFS patches in the ubifs-v2.6.30
tree and you are always encouraged to update:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

>>> Thanks for the update,I Will update my repository with the new patches.
>>>And run the test with new patches.

However, it does not look like we have any thing which would be
related to your problem.

Also, please, describe your flash. It looks like you have a
large NAND flash, is it SLC?

>>> Yes it is SLC and the part number is NAND08gw3b2a(ST Micro electronics).

>>>Size of the Nand Flash is 1GiB

root@mg3500evp323 # cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 000c0000 00020000 "uboot1"
mtd1: 00320000 00020000 "kernel1"
mtd2: 00320000 00020000 "kernel2"
mtd3: 00220000 00020000 "initrd1"
mtd4: 00220000 00020000 "initrd2"
mtd5: 02880000 00020000 "rootfs"
mtd6: 3cc40000 00020000 "data"

root@mg3500evp323 # mtdinfo /dev/mtd6
mtd6
Name:                           data
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          7778 (1019478016 bytes, 972.3 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:12
Bad blocks are allowed:         true
Device is writable:             true

root@evp323 # modprobe ubi mtd=6 ; modprobe ubifs
UBI: attaching mtd6 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd6 to ubi0
UBI: MTD device name:            "data"
UBI: MTD device size:            972 MiB
UBI: number of good PEBs:        7763
UBI: number of bad PEBs:         15
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     2
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 7763
UBI: number of PEBs reserved for bad PEB handling: 77
UBI: max/mean erase counter: 26/25
UBI: background thread "ubi_bgt0d" started, PID 1163


root@evp323 # mount -t ubifs ubi0:rootfs /ubifs_rootfs
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 1, name "rootfs"
UBIFS: file system size:   832333824 bytes (812826 KiB, 793 MiB, 6451 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  0 bytes (0 KiB)


root@evp323 # ubinfo 
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:60
Present UBI devices:            ubi0

>>>Nand data sheet can be downloaded from "http://www.alldatasheet.com/datasheet-pdf/pdf/164787/STMICROELECTRONICS/NAND08GW3B2A.html"



And finally, could you please try to reproduce this problem with
nandsim:
http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim

>>> I haven't tried yet.I Will try and update the result.




Artem Bityutskiy wrote:
> On 09/10/2009 03:53 PM, ext JerinJacob wrote:
>   
>> Hi Artem,
>>
>> Thanks for the support.
>> We are using 2.6.30.
>>     
>
> Well, we still have many UBI/UBIFS patches in the ubifs-v2.6.30
> tree and you are always encouraged to update:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source
>
> However, it does not look like we have any thing which would be
> related to your problem.
>
> Also, please, describe your flash. It looks like you have a
> large NAND flash, is it SLC?
>
> And finally, could you please try to reproduce this problem with
> nandsim:
> http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim
>
>   
