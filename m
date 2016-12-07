Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEchZ-0006wA-Ti
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 13:56:07 +0000
Received: by mail-wm0-x231.google.com with SMTP id f82so168293859wmf.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2016 05:55:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161207141447.1ef95a82@bbrezillon>
References: <CABatt_wrGTdp9Waw=1ysEUsDFtgT1zoq8YgFZSmkvpzUgov3Rw@mail.gmail.com>
 <20161207133938.39f2dd87@bbrezillon>
 <CABatt_w8YsCXiCVHVCsr3QHydcaoZgayQ7a10akPJZjPZS_uMA@mail.gmail.com>
 <20161207141447.1ef95a82@bbrezillon>
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Wed, 7 Dec 2016 13:55:42 +0000
Message-ID: <CABatt_wZTXA5u_FXFGMQ1ojJvhcESAFR=VB+NVW2LGi8Ya=Mag@mail.gmail.com>
Subject: Re: Retrieving number of free unused eraseblocks in a UBI filesystem
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 7, 2016 at 1:14 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 7 Dec 2016 13:07:25 +0000
> Martin Townsend <mtownsend1973@gmail.com> wrote:
>
>> On Wed, Dec 7, 2016 at 12:39 PM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > On Wed, 7 Dec 2016 11:59:13 +0000
>> > Martin Townsend <mtownsend1973@gmail.com> wrote:
>> >
>> >> Hi,
>> >>
>> >> I'm running a 4.1 Kernel and have a UBI Filesystem with 2 volumes
>> >> taking up all the NAND.
>> >> ubinfo -d 0
>> >> ubi0
>> >> Volumes count:                           2
>> >> Logical eraseblock size:                 126976 bytes, 124.0 KiB
>> >> Total amount of logical eraseblocks:     4016 (509935616 bytes, 486.3 MiB)
>> >> Amount of available logical eraseblocks: 0 (0 bytes)
>> >> Maximum count of volumes                 128
>> >> Count of bad physical eraseblocks:       56
>> >> Count of reserved physical eraseblocks:  24
>> >> Current maximum erase counter value:     15
>> >> Minimum input/output unit size:          2048 bytes
>> >> Character device major/minor:            249:0
>> >> Present volumes:                         0, 1
>> >>
>> >> So I'm guessing that the Total amount of logical erase blocks is 0 as
>> >> this is because I have 2 volumes of a fixed size that take up all the
>> >> available eraseblocks of the /dev/ubi0 device.
>> >>
>> >> Is there a way of getting, per volume preferably, the number of
>> >> eraseblocks that aren't being used? Or conversely get the number of
>> >> eraseblocks that are used as I can work it out from the total amount
>> >> of logical eraseblocks.
>> >
>> > cat /sys/class/ubi/ubiX_Y/reserved_ebs
>> >
>> > where X is the UBI device id and Y is the volume id.
>> >
>>
>> Thanks for the swift reply, this seems to give me the total number of
>> eraseblocks:
>>
>> # cat /sys/class/ubi/ubi0_1/reserved_ebs
>> 3196
>>
>> # ubinfo -d0 -n1
>> Volume ID:   1 (on ubi0)
>> Type:        dynamic
>> Alignment:   1
>> Size:        3196 LEBs (405815296 bytes, 387.0 MiB)
>> State:       OK
>> Name:        rootfs
>>
>> # df -h .
>> Filesystem      Size  Used Avail Use% Mounted on
>> ubi0:rootfs     357M  135M  222M  38% /
>>
>> What I would like to know is how many of them are being used and how
>> many are not.
>
> Well, for static volumes, you could extract this information from the
> data_bytes sysfs file. It doesn't work for dynamic volumes though, but
> even if you could extract this information from the number of mapped
> LEBs, not sure it would have any meaning, because unmapped LEBs can
> still be reserved by the upper layer, and just because you have a lot
> of unmapped LEBs does not mean you can shrink the volume (which I guess
> is your ultimate goal).
>

My goal is for failover, the SOM we use has 2 flash devices, the
primary is UBI on NAND, which we keep in sync with the other flash
device which is eMMC.  I'm basically monitoring both erase counts
using Richard's ubihealthd patch and bad blocks as an indication of
when to failover.  Maybe naively I'm thinking if I use the number of
unused eraseblocks it could serve 2 purposes failover due to badblocks
which will decrease available blocks naturally and also fail over to
the larger secondary flash device if it becomes near full.

If I stick to using bad blocks as a metric can I safely assume that
every time a block is marked bad it will decrease the overall size of
the filesystem as seen by utilities such as 'df'?  If so maybe it's
best if I stick to a combination of number of bad blocks from MTD in
sysfs and free space in filesystem.

>>
>> >>
>> >> Many Thanks,
>> >> Martin.
>> >>
>> >> ______________________________________________________
>> >> Linux MTD discussion mailing list
>> >> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> >
>
