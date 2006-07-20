Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G3OUN-0004tr-Pn
	for linux-mtd@lists.infradead.org; Wed, 19 Jul 2006 22:42:15 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J2O001GWKU2XR@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 20 Jul 2006 11:42:02 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0J2O00L1QKU1NB@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 20 Jul 2006 11:42:02 +0900 (KST)
Date: Thu, 20 Jul 2006 11:42:01 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: RE: how to use jff2 on UBI layer?
In-reply-to: <1152536472.6066.28.camel@localhost.localdomain>
To: haver@vnet.ibm.com, 'Marteo Tim' <tim.marteo@gmail.com>
Message-id: <004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Is there any easy way?

It's too dificult to mount jffs2 on ubi

As jffs2 mount success on empty mtd. The jffs2 can mount on empty ubi
device.

here's my attempt

/ # insmod /root/ubi.ko mtd_devs=4
Using /root/ubi.ko

UBI: attaching mtd4 to ubi0
UBI: background thread "ubi_bgt0d" started, PID 247
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI: create volume table (copy #2)
UBI: mean erase counter:         0
UBI: MTD device name:            "filesystem00"
UBI: MTD device size:            32 MB
UBI: physical eraseblock size:   131072 bytes (128 KB)
UBI: logical eraseblock size:    126976 bytes
UBI: number of good PEBs:        256
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. allowed volumes:       128
UBI: wear-levelling threshold:   4096
UBI: number of internal volumes: 2
UBI: number of user volumes:     0
UBI: available PEBs:             250
UBI: total number of reserved PEBs: 6
UBI: number of PEBs reserved for bad PEB handling: 2 

Regards
Kyungmin Park

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Frank Haverkamp
> Sent: Monday, July 10, 2006 10:01 PM
> To: Marteo Tim
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: how to use jff2 on UBI layer?
> 
> Hi,
> 
> On Mon, 2006-07-10 at 10:50 +0800, Marteo Tim wrote:
> > I'm interesting in UBI, which is the new flash management layer. I 
> > have also get the newest UBI sources from git.
> > My question is: how can i use jff2 on UBI layer? In UBI's source, i 
> > can not find block device relating codes. After load UBI module, i 
> > found /dev/ubi0, but it is a char device.
> > Thanks.
> 
> the code which enables you to run JFFS2 on a UBI volume is 
> currently under discussion between Joern, Thomas Gleixer and 
> Artem. We have a working prototype, but we think, that it 
> needs some reworks. That is why it is not yet published. I am 
> trying to make the folks hurry up, but they are currently busy.
> 
> I will try to describe what you need to do to run JFFS2 
> although we need to wait for the code still.
> 
> /dev/ubi0 is the UBI device, you cannot run JFFS2 on it. To 
> run JFFS2, you need to create a dynamic UBI volume first. You 
> can do that in three
> ways:
> 
> 1. Use the UBI toolchain to create a binary image containing 
> UBI volumes. mtd-utils.git/ubi-utils/scripts/test.cfg shows a 
> configuration file where you specify the volumes you want to 
> have and the binary input you want to put into them. The 
> JFFS2 volume needs to be a dynamic UBI volume, because you 
> want to write single pages or subpages if mtd allows it. The 
> pfi file is processed by pfi2bin and bin2nand to form an 
> image for your flash. See the example Makefile in that 
> directory too. In bin2nand you might want add your specific 
> ECC layout in the OOB data if the existing one is not valid 
> for your hardware. The resulting data you can flash - bad 
> block aware - into your NAND flash. For NOR you ommit the 
> bin2nand step and take the binary directly. This can be done 
> by a JTAG utility or by nandwrite. The output will contain a 
> UBI volume information table and when you attach your mtd 
> device to UBI, it will generate all the volumes you defined 
> automatically.
> 
> 2. Use the UBI tools on the system itself create, delete and 
> update UBI volumes. ubimkvol creates volumes, ubiupdatevol 
> will push data into them and with ubirmvol you can remove 
> them (use ubiupdatevol ... -t to truncate them, otherwise UBI 
> will not let you delete them).
> 
> 3. Use the pfi file generated by mkpfi and the tool pfiflash 
> on the target system to automatically update your flash. This 
> tool is intended to easily allow UBI volume update. The pfi 
> contains the UBI volume parameters and if the volume is not 
> existing it will be created automatically by the tool.
> 
> Option 2 is good for trying it out. Option 1. is more for a 
> manufacturing kind of process. Option 3. can be used for 
> updating UBI volumes which are not in use (if you have a 
> rootfs, or mounted fs in a UBI volume it is in use and cannot 
> be updated that way of course).
> 
> If you have the dynamic volumes for your JFFS2 created you 
> could mount them like this:
> 
> mount -t jffs2 mtd:rootfs_0 /mnt/
>                     ^
>                     |
>     name of UBI volume (specified in the cfg file or with ubimkvol
> 
> The last step would work if the mtd->ubi translation layer, 
> which we call gluebi (glue/UBI) would be available. I hope 
> that this issue is solved soon.
> 
> Regards, 
> 
> Frank
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
