Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KqUME-0003P2-Vj
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 15:01:48 +0000
Date: Thu, 16 Oct 2008 16:01:35 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Michal Ludvig <mludvig@logix.net.nz>
Subject: Re: nandwrite/ubi memory corruption?
Message-ID: <20081016150135.GA11063@fluff.org.uk>
References: <48F71315.5080707@logix.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48F71315.5080707@logix.net.nz>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 16, 2008 at 11:10:29PM +1300, Michal Ludvig wrote:
> Hi all,
> 
> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
> and am experiencing (probably) memory corruption of UBI/UBIFS on
> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
> 
> These are my logical partitions on NAND:
> 
> S3C24XX NAND Driver, (c) 2004 Simtec Electronics
> s3c2410-nand s3c2410-nand: Tacls=3, 30ns Twrph0=7 70ns, Twrph1=3 30ns
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x00050000 : "boot"
> 0x00050000-0x00220000 : "kernel"
> 0x00220000-0x04000000 : "ubi"
> s3c2410-nand s3c2410-nand: clock idle support enabled

hmm, could you try disabling the clock-idle support?
 
> 
> 
> I use u-boot 1.1.4 as the bootloader and 2.6.27 as the kernel. The
> kernel image size is 1492552 bytes, that should fit into the kernel
> partition as far as I can tell.
> 
> When I load the kernel in u-boot and write into NAND with 'nandw'
> command of u-boot it works fine.
> 
> However when I use nandwrite from linux it does "something" but
> 1) the kernel won't boot
> 2) it probably corrupted the 'ubi' partition:
> 
> ~ # nandwrite -p /dev/mtd1 uimage26
> Writing data to block 0
> Writing data to block 4000
> [...]
> Writing data to block 164000
> Writing data to block 168000
> Writing data to block 16c000
> 
> ~ # ls
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
> 2414:15360, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write data to PEB 2414
> UBI: recover PEB 2414, move data to PEB 2428
> UBI warning: ubi_io_read_vid_hdr: bad magic number at PEB 2414: 00000000
> instead of 55424921
> UBI warning: ubi_ro_mode: switch to read-only mode
> UBIFS error (pid 224): ubifs_wbuf_sync_nolock: cannot write 512 bytes to
> LEB 746:14336
> UBIFS error (pid 224): ubifs_bg_wbufs_sync: cannot sync write-buffer,
> error -5
> UBIFS warning (pid 224): ubifs_ro_mode: switched to read-only mode, error -5
> 
> So it experienced some corruption and switched to read-only mode.
> 
> Auto-completeing commands in shell doesn't work either:
> 
> ~ # nandd<tab>
> UBIFS error (pid 241): ubifs_read_node: bad node type (0 but expected 9)
> UBIFS error (pid 241): ubifs_read_node: bad node at LEB 757:11760
> UBIFS error (pid 241): ubifs_iget: failed to read inode 232, error -22
> UBIFS error (pid 241): ubifs_lookup: dead directory entry 'nanddump',
> error -22
> 
> When I reset the board the just written kernel won't boot:
> 
> NAND Flash Reading
> dst base address          = 0x30100000
> Source start block number = 20
> Source size  (0x4000*n)   = 0x180000
> status 1
> ## Booting image at 30100000 ...
> status 2
> Bad Header Checksum
> status -2
> 
> But after reloading a good kernel into NAND in u-boot and booting it
> everything looks ok and I can run 'ls' and 'nanddump' just fine. I can't
> tell whether the UBIFS volume is corrupted or not (is there some ubifsck
> tool available?) but nothing obvious pops up.
> 
> Nandwrite is ~2 days old one from git, kernel is 2.6.27, both compiled
> with gcc 3.4.6. CPU is Samsung S3C2410 (ARM920T arch), NAND as above.
> 
> So the summary is
> 1) Writing a kernel image with nandwrite into a MTD partition /dev/mtd1,
> where the kernel image is smaller than the partition.
> 2) Ubi/ubifs using MTD partition /dev/mtd2 gets corrupted (memory only?)
> 3) The written kernel won't boot. The same one written from u-boot works
> fine.
> 
> It's all 100% reproducible.
> 
> Do you need any other information?
> 
> Michal
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
