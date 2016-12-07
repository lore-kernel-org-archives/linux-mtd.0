Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEeT7-00089C-NK
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 15:49:21 +0000
Date: Wed, 7 Dec 2016 16:48:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Retrieving number of free unused eraseblocks in a UBI filesystem
Message-ID: <20161207164856.41d0e05b@bbrezillon>
In-Reply-To: <CABatt_wM-1ZRX2GYm0SZ76OwrLZyHP8m8Ac8JzytZ1gyqYb7=A@mail.gmail.com>
References: <CABatt_wrGTdp9Waw=1ysEUsDFtgT1zoq8YgFZSmkvpzUgov3Rw@mail.gmail.com>
 <20161207133938.39f2dd87@bbrezillon>
 <CABatt_w8YsCXiCVHVCsr3QHydcaoZgayQ7a10akPJZjPZS_uMA@mail.gmail.com>
 <20161207141447.1ef95a82@bbrezillon>
 <CABatt_wZTXA5u_FXFGMQ1ojJvhcESAFR=VB+NVW2LGi8Ya=Mag@mail.gmail.com>
 <20161207151730.718122f6@bbrezillon>
 <CABatt_xnY6BEjnG-SbxdF8h-TuYqqy8hOa8i7nZk9v=avW9k1A@mail.gmail.com>
 <20161207160048.5cf7b52d@bbrezillon>
 <CABatt_wM-1ZRX2GYm0SZ76OwrLZyHP8m8Ac8JzytZ1gyqYb7=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Dec 2016 15:33:04 +0000
Martin Townsend <mtownsend1973@gmail.com> wrote:

> On Wed, Dec 7, 2016 at 3:00 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Wed, 7 Dec 2016 14:47:13 +0000
> > Martin Townsend <mtownsend1973@gmail.com> wrote:
> >  
> >> On Wed, Dec 7, 2016 at 2:17 PM, Boris Brezillon
> >> <boris.brezillon@free-electrons.com> wrote:  
> >> > On Wed, 7 Dec 2016 13:55:42 +0000
> >> > Martin Townsend <mtownsend1973@gmail.com> wrote:
> >> >  
> >> >> On Wed, Dec 7, 2016 at 1:14 PM, Boris Brezillon
> >> >> <boris.brezillon@free-electrons.com> wrote:  
> >> >> > On Wed, 7 Dec 2016 13:07:25 +0000
> >> >> > Martin Townsend <mtownsend1973@gmail.com> wrote:
> >> >> >  
> >> >> >> On Wed, Dec 7, 2016 at 12:39 PM, Boris Brezillon
> >> >> >> <boris.brezillon@free-electrons.com> wrote:  
> >> >> >> > On Wed, 7 Dec 2016 11:59:13 +0000
> >> >> >> > Martin Townsend <mtownsend1973@gmail.com> wrote:
> >> >> >> >  
> >> >> >> >> Hi,
> >> >> >> >>
> >> >> >> >> I'm running a 4.1 Kernel and have a UBI Filesystem with 2 volumes
> >> >> >> >> taking up all the NAND.
> >> >> >> >> ubinfo -d 0
> >> >> >> >> ubi0
> >> >> >> >> Volumes count:                           2
> >> >> >> >> Logical eraseblock size:                 126976 bytes, 124.0 KiB
> >> >> >> >> Total amount of logical eraseblocks:     4016 (509935616 bytes, 486.3 MiB)
> >> >> >> >> Amount of available logical eraseblocks: 0 (0 bytes)
> >> >> >> >> Maximum count of volumes                 128
> >> >> >> >> Count of bad physical eraseblocks:       56
> >> >> >> >> Count of reserved physical eraseblocks:  24
> >> >> >> >> Current maximum erase counter value:     15
> >> >> >> >> Minimum input/output unit size:          2048 bytes
> >> >> >> >> Character device major/minor:            249:0
> >> >> >> >> Present volumes:                         0, 1
> >> >> >> >>
> >> >> >> >> So I'm guessing that the Total amount of logical erase blocks is 0 as
> >> >> >> >> this is because I have 2 volumes of a fixed size that take up all the
> >> >> >> >> available eraseblocks of the /dev/ubi0 device.
> >> >> >> >>
> >> >> >> >> Is there a way of getting, per volume preferably, the number of
> >> >> >> >> eraseblocks that aren't being used? Or conversely get the number of
> >> >> >> >> eraseblocks that are used as I can work it out from the total amount
> >> >> >> >> of logical eraseblocks.  
> >> >> >> >
> >> >> >> > cat /sys/class/ubi/ubiX_Y/reserved_ebs
> >> >> >> >
> >> >> >> > where X is the UBI device id and Y is the volume id.
> >> >> >> >  
> >> >> >>
> >> >> >> Thanks for the swift reply, this seems to give me the total number of
> >> >> >> eraseblocks:
> >> >> >>
> >> >> >> # cat /sys/class/ubi/ubi0_1/reserved_ebs
> >> >> >> 3196
> >> >> >>
> >> >> >> # ubinfo -d0 -n1
> >> >> >> Volume ID:   1 (on ubi0)
> >> >> >> Type:        dynamic
> >> >> >> Alignment:   1
> >> >> >> Size:        3196 LEBs (405815296 bytes, 387.0 MiB)
> >> >> >> State:       OK
> >> >> >> Name:        rootfs
> >> >> >>
> >> >> >> # df -h .
> >> >> >> Filesystem      Size  Used Avail Use% Mounted on
> >> >> >> ubi0:rootfs     357M  135M  222M  38% /
> >> >> >>
> >> >> >> What I would like to know is how many of them are being used and how
> >> >> >> many are not.  
> >> >> >
> >> >> > Well, for static volumes, you could extract this information from the
> >> >> > data_bytes sysfs file. It doesn't work for dynamic volumes though, but
> >> >> > even if you could extract this information from the number of mapped
> >> >> > LEBs, not sure it would have any meaning, because unmapped LEBs can
> >> >> > still be reserved by the upper layer, and just because you have a lot
> >> >> > of unmapped LEBs does not mean you can shrink the volume (which I guess
> >> >> > is your ultimate goal).
> >> >> >  
> >> >>
> >> >> My goal is for failover, the SOM we use has 2 flash devices, the
> >> >> primary is UBI on NAND, which we keep in sync with the other flash
> >> >> device which is eMMC.  I'm basically monitoring both erase counts
> >> >> using Richard's ubihealthd patch and bad blocks as an indication of
> >> >> when to failover.  Maybe naively I'm thinking if I use the number of
> >> >> unused eraseblocks it could serve 2 purposes failover due to badblocks
> >> >> which will decrease available blocks naturally and also fail over to
> >> >> the larger secondary flash device if it becomes near full.
> >> >>
> >> >> If I stick to using bad blocks as a metric can I safely assume that
> >> >> every time a block is marked bad it will decrease the overall size of
> >> >> the filesystem as seen by utilities such as 'df'?  
> >> >
> >> > That's not the case. UBI reserves some amount of blocks to deal with
> >> > bad blocks, which means your FS available size will not decrease, or at
> >> > least, not until you are in a situation where you run out of erase
> >> > blocks reserved for bad block handling. And even in that case, assuming
> >> > the UBI device still has some blocks available (i.e. not reserved for a
> >> > volume or for internal UBI usage),  those blocks will be used when a
> >> > new bad block is discovered.  
> >>
> >> Thanks for this it clears up a misconception I had, I was assuming it
> >> would take blocks from those allocated to the volumes which is not the
> >> case.  So if I reserve say 50 blocks for bad block management and then
> >> split the remaining blocks between the 2 volumes and then once 50
> >> blocks have gone bad, the next bad block will result in a corrupt
> >> filesystem?  
> >
> > Hm, I'm not sure it will directly result in a FS corruption, since some
> > blocks might actually be available at the time the FS tries to map a
> > LEB. But it's likely to result in a UBI/UBIFS error at some point (when
> > your FS is full and UBI fails to pick a PEB for a new LEB).
> >  
> >>  
> >> >  
> >> >> If so maybe it's
> >> >> best if I stick to a combination of number of bad blocks from MTD in
> >> >> sysfs and free space in filesystem.  
> >> >
> >> > Not sure free FS space is a good metric either. Maybe you should just
> >> > monitor the number of available blocks and the number of blocks
> >> > reserved for bad block handling at the UBI level (not sure those
> >> > numbers are exposed through sysfs though). When these numbers are too
> >> > low, you should consider switching to the other storage.  
> >>
> >> I'm having a dig through the code and if I expose used_ebs from struct
> >> ubi_volume to sysfs would this give me what I want, the comment say
> >> "how many logical eraseblocks in this volume contain data" which looks
> >> like exactly what I want.  
> >  
> > ->used_ebs is always set to ->reserved_pebs for dynamic volumes, so no.  
> >  
> >> I could then monitor the bad blocks and if
> >> they get to the reserved bad block amount fail over and then use
> >> used_ebs to see if it gets within a % of the "reserved_ebs" value from
> >> sysfs?  
> >
> > IMO, you should just rely on information exposed at the UBI device
> > level (/sys/class/ubi/ubiX/).
> >
> > You already have 'reserved_for_bad' and 'avail_eraseblocks' exposed,
> > and this should be enough. When reserved_for_bad approaches 0, then you
> > should be near the EOL of your UBI device.  
> 
> Thanks for the info. I get the bad blocks now, and can see that
> monitoring 'reserved_for_bad' for 0 or close to 0 is one trigger.
> The 'avail_eraseblocks' is always 0 on my board and it has around 60%
> free space, I suppose this means that every block contains some
> filesystem data, ie with lots of small files the erase blocks get used
> up?

No, it means that all blocks are reserved, not necessarily filled with
data, but you shouldn't care, because a reserved block can be used at
any time, and if you don't have enough blocks to fulfill the UBI users
need, then it's likely to fail at some point.

So in the end, it comes down to monitoring the 'reserved_for_bad'
number. Note that you can tweak this number through a command line
parameter(ubi.mtd= and the max_beb_per1024 field [1])
or a Kconfig option (CONFIG_MTD_UBI_BEB_LIMIT) if you want to reserve
more and prevent UBI from picking all the available blocks when
resizing a volume.

[1]http://lxr.free-electrons.com/source/drivers/mtd/ubi/build.c#L1478
