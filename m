Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmtFx-00009D-VM
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 09:39:29 -0500
Received: by ug-out-1314.google.com with SMTP id m2so166029uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Nov 2006 06:39:19 -0800 (PST)
Message-ID: <79ac09b60611220639g22bfb1b7k8bdbde80f96e6de3@mail.gmail.com>
Date: Wed, 22 Nov 2006 08:39:18 -0600
From: Duke <ezbonites@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: mtd_debug usage
In-Reply-To: <79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
	<Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
	<79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/22/06, Duke <ezbonites@gmail.com> wrote:
> On 11/22/06, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> > mtdblock devices are normally only used with the mount/umount commands.
> > For erase /dev/mtdX is required - the mtdblock devices don't support the
> > required ioctls. Actually, since a while back, it's not necessary to use
> > /dev/mtdblockX devices for mount/umount either since they understand
> > 'mtdX' directly as in  mount -t cramfs mtd1 /mnt/mountpoint .
> >
> > mtdblock devices do support an automatic erase-before-write functionality
> > when writing. This used to be buggy, don't know the status of this. As far
> > as I'm concerned, it's of little use anyway, because if the image you are
> > writing is smaller than the partition, using this feature will leave the
> > end of the partition unerased which is probably not what you want. Doing
> > separate erase and write operations is thus preferable IMHO.
> >
> > > Creating 3 MTD partitions on "physmap-flash.0":
> > > 0x00000000-0x00040000 : "boot"
> > > 0x00040000-0x00200000 : "kernel"
> > > 0x00200000-0x00800000 : "cramfs"
> > >
> > > When I ran mtd_debug I get the following from the above mapping:
> > >
> > > # mtd_debug info /dev/mtd2
> > > mtd.size = 1835008 (1M)
> > >
> > > # mtd_debug info /dev/mtd1
> > > mtd.size = 262144 (256K)
> > >
> > > # mtd_debug info /dev/mtd0
> > > mtd.size = 262144 (256K)
> > >
> > > # mtd_debug info /dev/mtd3
> > > mtd.size = 1835008 (1M)
> >
> > Looks like your minor numbers are screwed up for the /dev/mtd devices. 0
> > and 1 seem to have the same size, as to 2 and 3. Normally mtd0 is the
> > whole flash, with the first partition being in mtd1 (someone please
> > correct me if I'm wrong here). mtd0/1 seems to refer to the first 256k
> > boot partition, with mtd2/3 referring to the kernel partition with the
> > size of 0x1c0000 = 1835008.
> >
> > What does  ls -l /dev/mtd*  (and ls -l /dev/mtdblock*) say?
>
> It looks like this:
>
> crw-r--r--    1 root     root      90,   0 Mar 22  2005 /dev/mtd0
> crw-r--r--    1 root     root      90,   1 Mar 22  2005 /dev/mtd1
> crw-r--r--    1 root     root      90,   2 Mar 22  2005 /dev/mtd2
> crw-r--r--    1 root     root      90,   3 Mar 22  2005 /dev/mtd3
> crw-r--r--    1 root     root      90,   4 Nov 22  2006 /dev/mtd4
> brw-r--r--    1 root     root      31,   0 Mar 22  2005 /dev/mtdblock0
> brw-r--r--    1 root     root      31,   1 Mar 22  2005 /dev/mtdblock1
> brw-r--r--    1 root     root      31,   2 Mar 22  2005 /dev/mtdblock2
> brw-r--r--    1 root     root      31,   3 Mar 22  2005 /dev/mtdblock3
> brw-r--r--    1 root     root      31,   4 Nov 22  2006 /dev/mtdblock4
>
> I've added the fourth block but that looks the same as the 0 and 1 blocks.

This is what it looks like for the following partitions (this looks
wierd to me):

cfi_cmdset_0001: Erase suspend on write enabled
4 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 4 MTD partitions on "physmap-flash.0":
0x00000000-0x00040000 : "boot"
0x00040000-0x00200000 : "kernel"
0x00200000-0x00800000 : "cramfs"
0x00800000-0x01000000 : "jffs2"

#mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 262144 (256K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

# mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 262144 (256K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

#  mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 1835008 (1M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

#  mtd_debug info /dev/mtd3
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 1835008 (1M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

#  mtd_debug info /dev/mtd4
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 6291456 (6M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

#  mtd_debug info /dev/mtd5
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 6291456 (6M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

#  mtd_debug info /dev/mtd6
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 8388608 (8M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0
