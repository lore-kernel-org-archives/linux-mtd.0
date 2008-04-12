Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JkdoQ-0003uR-Ek
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 11:22:27 +0000
Message-ID: <48009B6D.2060802@gmx.net>
Date: Sat, 12 Apr 2008 13:22:21 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: Confused about how to make a UBIFS root filesystem
References: <OF3C0A65DB.1AE994C5-ON88257428.00773679-88257428.00796BFD@selinc.com>
	<1207990805.5965.93.camel@sauron>
In-Reply-To: <1207990805.5965.93.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 12.04.2008 11:00, Artem Bityutskiy wrote:
> Well, it seems I did not explain things too at the MTD web site.
>
> As you know, UBIFS works on top of UBI, which works on top of MTD. So
> this is kind of a stack. You have your mtd device (e.g., /dev/mtd0),
> which is basically bare NAND flash. It may has eraseblocks, it may have
> bad blocks, etc.
>
> First lets talk about JFFS2, to make a better picture of what is going
> on. JFFS2 works on top of MTD devices. When you prepare JFFS2 images,
> you use mkfs.jffs2, and then put them to MTD devices with help of
> "nandwrite" utility (you cannot use "dd" because it is unable to skip
> bad eraseblocks). Also, JFFS2 does not _require_ you to prepare any
> image, you may just erase your flash using flash_eraseall, and mount it,
> using an "mount -t jffs2 mtd0 /mnt/jffs2" command. In this case JFFS2
> automatically detects that the flash is empty, and automatically formats
> it. So when you mount it, you end up with an empty file-system. Just
> note, UBI/UBIFS can do the same. So far so good and simple, right?
>
> Now let's talk a bit about UBI/UBIFS. As I said, UBI works on top of
> MTD. When you load UBI and attach an MTD device to it, you end up with
> an UBI device, e.g. /dev/ubi0. For example, if you have /dev/mtd0, you
> may attach it to UBI using "ubiattach" utility, and /dev/ubi0 will be
> created (if you have udev in your system). There is no much you can do
> with UBI device (/dev/ubi0), though. Most interesting things may be done
> with UBI _volumes_. You may create UBI volumes on your UBI device using
> the "ubimkvol" tool. For example, you may create a /dev/ubi0_0 volume.
> You may create many volume on one UBI device. Then you may delete them
> or re-size. There are tools for this.
>
> And of course you could have 2 flashes on your board, say NOR and NAND,
> so you would have 2 MTD devices (e.g., /dev/mtd0 and /dev/mtd1). You
> could attach them to UBI, which would and result give you /dev/ubi0
> and /dev/ubi1. You could create volumes on these UBI devices,
> e.g. /dev/ubi0_0, /dev/ubi0_1, /dev/ubi0_2,
> or /deve/ubi1_0, /dev/ubi1_1, etc. The first number id the UBI device
> number, the second one is volume number within this UBI device.
>
> So /dev/ubi0 sits on top of /dev/mtd0 and actually uses whole /dev/mtd0.
> You should never write anything directly to /dev/mtd0 if you have UBI on
> top of it. But reading it is harmless, although it might only be needed
> when debugging or doing something hacky. UBI has its internal
> data-structures which is stores on flash, for example erase counters and
> volume table. So if you read /dev/mtd0, you will read those internal
> data structures as well.
>
> Now UBIFS. It works on top of UBI volumes, like /dev/ubi0_0. You may
> mount /dev/ubi0_0 using "mount -t ubifs ubi0_0 /mnt/ubifs". Well, UBI
> volumes may have names, which you may specify when you create them, so
> you may also mount volumes by their names, e.g.: "mount -t ubifs
> ubi0:i_like_free_beer /mnt/ubifs". UBIFS of course has its own internal
> data structures which it stores at the UBI volume, for example the
> superblock, the file-system indexing B-tree, etc.
>
> Now tools. So you have your bare flash, your poor /dev/mtd0, which only
> gives you read/write/erase operations, which have bad eraseblocks, which
> requires you to spread all I/O load evenly, and which have other
> restrictions (horrible thing, isn't it?). And you want to have a normal
> file-system on top of it, which is doing all difficult job for you, and
> you just store your data precious files and do not even want to know
> about the complex things which being done inside. :-)
>
> Sou have your "/home/bruce/root_img/" directory, where you store the
> root file-system for your device, and you want to create a raw image,
> which you will send to the factory, and they would simply put this raw
> image to flash of the newly produced cool devices which will conquer the
> whole target market segment.
>
> To do this, you first create an UBIFS image (step 1) using the
> "mkfs.ubifs" utility (see FAQ for options). It gives you, say,
> "ubifs.img" file. This file is basically the contents of the _UBI
> volume_, _not_ contents of the raw flash. I mean, if you put "ubifs.img"
> to a /dev/ubi0_0 (which exactly is what "ubiupdatevol" does), you may
> then mount this /dev/ubi0_0 and see exactly the same as in
> "/home/bruce/root_img/". But you _cannot_ put this image to
> your /dev/mtd0 device. It simply won't work - you have to turn ubifs.img
> to an UBI image first!. And this is where you use the "ubinize" utility.
> This utility creates UBI images. It requires a configuration file (which
> you found confusing), where you describe the parameters of your NAND
> flash, the volumes which "ubinize" has to create, the images which it
> should put to these volumes, etc. So, if you use "ubinize", you'll get,
> say, ubi.img file (see FAQ for details and examples), which now you may
> send to the factory. If you wipe out your /dev/mtd0, then put ubi.img on
> it, then attach it to UBI - you'll see a volume on it. This is the
> volume which you described in the configuration file of "ubinize". If
> you mount that volume, you'll find your "/home/bruce/root_img/", because
> you said "ubinize" to put ubifs.img to the created volume.
>
> Why "ubinize" need a config file? Because you may want to create an UBI
> image with _many_ volumes, and put different contents to each of them.
> E.g., have "/home" and "/" on separate UBI volumes. Each volume may have
> different characteristics. It is difficult to pass all the needed
> parameters for complex configurations via command line, so we just use a
> configuration file.
>
> And finally, similarly to JFFS2, UBI/UBIFS do not require you to prepare
> any images. You may start with an empty flash, attach it to UBI, in
> which case UBI will format it automatically, then create a volume, which
> will be empty (i.e., dd if=/dev/ubi0_0 of=file will give you only 0xFF
> bytes). Then you may mount empty this volume, and UBIFS will
> automatically format it, and you will end up with an empty FS.
>
> I think, after reading this, and re-reading
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs, you'll
> have complete picture. Sorry if I put made the mail too long, instead of
> just answer your questions with short answers.
>
> I know that my English is far from perfect, so you could help and
> contribute to the project by creating few FAQ entries for us. I'd put
> them to the MTD web site. I mean, just describe the things you found
> confusing and difficult to grasp, give them a title (e.g., "What is this
> <name_of_the_confusing_thing> about?") and send it to us. That would be
> great.
>   

That's a great writeup! Can you put that online at the MTD web site? You
might even want to consider sending it in to LWN as a featured article
because it explains the concept really well even for people who know
hardly anything about MTD/UBI/UBIFS.


Regards,
Carl-Daniel
