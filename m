Received: from wr-out-0506.google.com ([64.233.184.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ht59N-0002QS-Rw
	for linux-mtd@lists.infradead.org; Tue, 29 May 2007 13:06:31 -0400
Received: by wr-out-0506.google.com with SMTP id i22so711610wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 May 2007 10:06:17 -0700 (PDT)
Date: Wed, 30 May 2007 02:09:26 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: Re: FAT file system on NAND flash memory
Message-ID: <20070529170925.GA11279@pooky.senux.com>
References: <20070412134137.GA25860@pooky.senux.com>
	<625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
Cc: alex@emcraft.com, Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 12, 2007 at 08:55:23AM -0500, Josh Boyer wrote:
> On 4/12/07, Seongsu Lee <senux@senux.com> wrote:
> > Hi,
> >
> > In my knowledge, mtdblock.c must be used to use
> > FAT filesystem on bare NAND flash memories
> > because NFTL is made only for a specific hardware,
> > DiskOnChip.
> >
> > (Layer 0) VFS
> > (Layer 1) FAT (or EXT2, EXT3)
> > (Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
> > (Layer 3) NAND flash memory driver (vendor specific)
> > (Layer 4) Physical NAND flash memory
> >
> > Please let me know if it is wrong.
> 
> That layering is correct, but your results will be bad.  mtdblock
> doesn't handle bad blocks.  So if you have one in the middle of your
> filesystem, it will break things.  You need some kind of translation
> layer if you're going to use NAND.
> 
> josh

I did not know that ftl.c is can be used also in 'Layer 2' instead
of dummy mtdblock.c. It's working. I confirmed that the ftl.c can 
be used on mtdram. I will test whether it works on a physical 
bare-nand flash memory. (maybe tomorrow)

Follow is what I have tested for a mtdram (64MB).

root@thermopylae:/mnt # modprobe mtdram

root@thermopylae:/mnt # modprobe mtdchar

root@thermopylae:/mnt # ftl_format /dev/mtd0
Partition size = 64 mb, erase unit size = 128 kb, 1 transfer units
Reserved 5%, formatted size = 62883328 bytes
Erasing all blocks...
+++++++*+++++++*+++++++*+++++++*+++++++*+++++++*+++++++*+++++++*
Writing erase unit headers...
format successful.

root@thermopylae:/mnt # modprobe ftl

root@thermopylae:/mnt # lsmod
Module                  Size  Used by
ftl                    11404  0
mtd_blkdevs            10368  1 ftl
mtdchar                 9092  0
mtdram                  3972  0
mtdcore                 7172  6 mtd_blkdevs,mtdchar,mtdram
autofs4                22788  1
3c59x                  43560  0
b44                    27276  0
ext3                  122504  1
jbd                    59048  1 ext3

root@thermopylae:/mnt # mkfs.ext3 /dev/ftla
mke2fs 1.38 (30-Jun-2005)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
15360 inodes, 61408 blocks
3070 blocks (5.00%) reserved for the super user
First data block=1
Maximum filesystem blocks=62914560
8 block groups
8192 blocks per group, 8192 fragments per group
1920 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345

Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 39 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.

root@thermopylae:/mnt # mount /dev/ftla /mnt/data0

root@thermopylae:/mnt # df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1              29G  9.7G   18G  36% /
tmpfs                 507M     0  507M   0% /dev/shm
/dev/hdb1              95G  126M   90G   1% /mnt/data1
/dev/ftla              59M  5.2M   50M  10% /mnt/data0

-- 
Seongsu's personal blog - http://www.senux.com/
lp1 on fire (One of the more obfuscated kernel
messages)
