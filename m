Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JljXi-0002B1-TX
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 11:41:43 +0000
Date: Tue, 15 Apr 2008 12:41:36 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
Message-ID: <20080415114135.GA3556@shareable.org>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron>
	<1207995042.5965.136.camel@sauron>
	<bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
	<1208163958.5965.158.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1208163958.5965.158.camel@sauron>
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> > # flash_eraseall /dev/mtd5
> 
> I guess you know that UBIFS stores erase-counter at the beginning of the
> eraseblock. What you do with this command you just wipe the flash out
> and loose the erase-counters. This is not good.
> 
> Partially it is our fault that we did not tell about this loudly at the
> web site. I also put examples which use flash_eraseall, but that was for
> nandsim. I really did not think about this scenario. We use our own
> flasher for flashing images which does preserve erase-counters.
> 
> If you do like this often, you are risking to wear-out some eraseblocks
> of your flash which is bad.
> 
> We have create a separate utility for erasing the flash and preserving
> erase-counters (well, actually incrementing them). We will do this ASAP,
> may be next week. We will also fix the web site to inform people about
> possible consequences of using flash_eraseall for MTD devices which are
> used for UBI.

I'm not sure if UBI stores erase counters for blocks in _other_ blocks.

If erase counters are stored at the start of each block, for the block
itself, what happens in this sequence?

    1. Begin erase block.
    2. Erase succeeds.
    3. Power failure / system reset / watchdog / etc.
    4. ....?

Is the erase counter zeroed as a result of this?

One of the nicest features of JFFS2 and UBIFS is that they are robust
against power failures and other unexpected reboot scenarios.

Some devices use this by not having a shutdown sequence: the normal
method of shutdown is to turn off the power.  It's fast.

It would be unfortunate if UBI's erase levelling info were lost by
doing this.

-- Jamie









> 
> For now, try to avoid using flash_eraseall and use ubiupdatevol for
> updating.
> 
> > # nandwrite -a -m -q /dev/mtd5 ubi0414
> 
> Similarly, here you copy the image which sets all erase-counters to 0.
> We will create a utility which you will be able to use instead of
> nandwrite soon. Try to use ubiupdatevol so far.
> 
> 
> > # modprobe ubi mtd=5
> > UBI: attached mtd5 to ubi0
> > UBI: MTD device name:            "NAND VFAT partition"
> > UBI: MTD device size:            512 MiB
> > UBI: physical eraseblock size:   262144 bytes (256 KiB)
> > UBI: logical eraseblock size:    258048 bytes
> > UBI: number of good PEBs:        2048
> > UBI: number of bad PEBs:         0
> > UBI: smallest flash I/O unit:    2048
> > UBI: VID header offset:          2048 (aligned 2048)
> > UBI: data offset:                4096
> > UBI: max. allowed volumes:       128
> > UBI: wear-leveling threshold:    4096
> > UBI: number of internal volumes: 1
> > UBI: number of user volumes:     2
> > UBI: available PEBs:             398
> > UBI: total number of reserved PEBs: 1650
> > UBI: number of PEBs reserved for bad PEB handling: 20
> > UBI: max/mean erase counter: 1/0
> > UBI: background thread "ubi_bgt0d" started, PID 328
> 
> I suspect you have MLC NAND, do you? Could you please tell how many
> erase-cycles the eraseblock may survive on your flash.
> 
> 
> > # mount -t ubifs ubi0:ubifs /mnt/1
> > NAND: Uncorrectable ECC error
> > NAND: Uncorrectable ECC error
> > NAND: Uncorrectable ECC error
> > NAND: Uncorrectable ECC error
> 
> This looks like a bad eraseblock. Try to figure out what is this,
> may be putting more information.
> 
> > UBI error: ubi_io_read: error -77 while reading 258048 bytes from PEB
> > 3:4096, read 258048 bytes
> > UBIFS error (pid 375): ubifs_scan: corrupt empty space at LEB 1:4096
> > UBIFS error (pid 375): ubifs_scanned_corruption: corrupted data at LEB 1:4096
> > UBIFS error (pid 375): ubifs_scanned_corruption: first 4096 bytes from
> > LEB 1:4096
> > UBIFS error (pid 375): ubifs_scan: LEB 1 scanning failed
> 
> Could you please enable UBIFS debugging. Also, please enable UBI
> debugging and enable UBI extra self-checks (not messages, just the
> checks). This will make it very slow, but it may help to identify the
> problem. Please,do this and send us the dmesg output.
> 
> Also, attach your .config next time please.
> 
> > NAND: Uncorrectable ECC error
> > NAND: Uncorrectable ECC error
> > NAND: Uncorrectable ECC error
> > NAND: Uncorrectable ECC error
> > UBI error: ubi_io_read: error -77 while reading 258048 bytes from PEB
> > 3:4096, read 258048 bytes
> > UBIFS error (pid 375): ubifs_recover_master_node: failed to recover master node
> > UBIFS error (pid 375): ubifs_recover_master_node: dumping first master node
> > CPU 0 Unable to handle kernel paging request at virtual address
> > c021e003, epc == c014a9e0, ra == c01467d0
> > Oops[#1]:
> > Cpu 0
> > $ 0   : 00000000 10000400 c014a9b4 00000000
> > $ 4   : 83fb8800 c021e000 00000001 00000000
> > $ 8   : 8043e280 00000002 00004001 80490000
> > $12   : 80490000 80490000 000000a0 00000038
> > $16   : 8003e3a0 c0150000 ffffffea 83fb8800
> > $20   : 83fb8b70 c0130000 c015c380 c0160000
> > $24   : 00000002 8009a3d0
> > $28   : 83efc000 83efdbe0 83fb8800 c01467d0
> > Hi    : 000000a7
> > Lo    : 86c91000
> > epc   : c014a9e0 dbg_dump_node+0x2c/0xd20 [ubifs]     Not tainted
> 
> This oops looks like a bug in the dump function, we'll look at this.
> But anyway, the root of the error is somewhere at the low level. Those
> unrecoverable ECC errors tell about this. Probably you worn out few
> eraseblocks.
> 
> > ra    : c01467d0 ubifs_recover_master_node+0xe4/0x2f4 [ubifs]
> Yeah, the problem is somewhere at master node. This makes my theory that
> you worn out an eraseblock more probable. The reason is that you wiped
> out your flash all the time and lost erasecounters. And if you have MLC,
> this should be very easy to do.
> 
> > [yrtan@st new-utils]$ cat ubinize.cfg
> > [ubifs]
> > mode=ubi
> > image=root26.img
> > vol_id=0
> > vol_size=200MiB
> > vol_type=dynamic
> > vol_name=ubifs
> > vol_alignment=1
> > vol_flag=autoresize
> > 
> > [vfat]
> > mode=ubi
> > image=vfat.img
> > vol_id=1
> > vol_size=298MiB
> > vol_type=dynamic
> > vol_name=vfat
> > vol_alignment=1
> > vol_flag=autoresize
> 
> Hmm, you mark 2 volumes as auto-resize, which is wrong. Only one may
> have this flag. I will fix the utility and make it complain about this.
> Also, it is strange I do not see UBI messages saying it was doing
> auto-resize.
> 
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
