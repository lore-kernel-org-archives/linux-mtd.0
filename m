From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Andrew Li'" <ALi@evertz.com>
References: <0474A5584072DA1197F50007E90E6B11052998A1@PORTIA>
Subject: RE: OneNand driver
Date: Mon, 5 Mar 2007 09:29:12 +0900
Message-ID: <009101c75ebd$4ea478a0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <0474A5584072DA1197F50007E90E6B11052998A1@PORTIA>
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew, 

> 
> 1.The Davinci Dm644x chip has a serial boot mode. It can 
> receive data from serial port and run it from on-chip SRAM. 
> We first load a small program to SRAM and initialize SDRAM 
> and then use that program to load u-boot to SDRAM and run it. 
> The u-boot now is running on our board. You have done a great 
> job to add the OneNAND driver to u-boot. I don't find it in 
> the latest official u-boot release and I am thinking about to 
> port your Linux version to u-boot. Now you save us a lot of 
> effort. I will study it today and see  how to use it on our 
> board. Thanks a lot! 

The Probing OneNAND is simple. just define OneNAND start address in u-boot

> Why you don't let them put into the official u-boot release?

I tried it but failed. Okay I try it again.

> 
> 2.I have fixed the "can-not-unlock-all" problem.  
> 
> According to datasheet of 
> OneNAND1G(KFG1G16Q2A-DEBx)(ds_kfxxg16q2a_rev12.pdf
> Page73), to unlock all we need do the following sequence.
> 
> All Block Unlock Command Sequence:
> Start block address(000h)+All Block Unlock command (0027h)

Yes I found some chips need it.

> 
> So I add one line to onenand_unlock_all(struct mtd_info *mtd) 
> to write start block address(000h) first, and this has fixed 
> the problem.
> 
> Perhaps other Onenand chips don't need this. But for this 
> one, it seems to be a must. 

It's already fixed.
http://git.infradead.org/?p=users/kmpark/onenand-mtd-
2.6.git;a=commit;h=10b7a2bd6bf3510cbb5977a44d8822f085738729

> 
> 3. I just noticed that in your email this line is already there:
>                 /* Set start block address */
>                 this->write_word(0, this->base + 
> ONENAND_REG_START_BLOCK_ADDRESS);
> 
> But this does not exist in my Linux kernel. It seems I am 
> using a diffirent(perhaps old?) version of OneNAND driver.
> 
> I am using the linux-davinci-2.6.git from here:
> http://source.mvista.com/git/
> 
> I haved checked again inthe tree
> http://source.mvista.com/git/gitweb.cgi?p=linux-davinci-2.6.gi
> t;a=blob;h=2da
> 6bb26353e22c6966c0835cf596cb227ac1883;hb=e7255f318dd91e6ed005f
> 2680a9d798e748
> 4778d;f=drivers/mtd/onenand/onenand_base.c
> 
> This line does not exist.
> 
> Where do you put your latest driver? The linux-omap-2.6.git?

OneNAND git uses this URL.

http://git.infradead.org/?p=users/kmpark/onenand-mtd-2.6.git;a=summary

> 
> 
> Thanks a lot!
> 
> Andrew
> 
> 

> 
> > 1.How to write the x-loader, u-boot, parameter data and 
> other raw data 
> > to OneNAND flash? What kind of tools/utilities do you use?
> 
> Now, there's no hardware tools such as Trace32, BDI2000 to 
> supporting OneNAND directly. So first we load another 
> bootloader, U-Boot using JTAG and then it program the 
> oneboot.bin (x-loader + u-boot) to OneNAND.
> 
> 1. load u-boot.bin using JTAG
> 2. download oneboot.bin
> 3. erase block 0 and program
> 4. reboot
> 
> e.g.,
> U-Boot 1.1.4 (Feb 15 2006 - 12:14:27)
> 
> U-Boot code: 80E80000 -> 80E96FC4  BSS: -> 80E9BB40 
> OMAP2420-GP revision 4 Samsung Apollon SDP Base Board + IP 
> Daughter Board + mDDR RAM Configuration:
> Bank #0: 80000000 128 MB
> Scanning device for bad blocks
> Bad eraseblock 452 at 0x03880000
> OneNAND: 256 MB
> In:    serial
> Out:   serial
> Err:   serial
> Hit any key to stop autoboot:  0
> Apollon # help onenand
> onenand info   - show available OneNAND devices
> onenand read[.oob] addr ofs len - read data at ofs with len 
> to addr onenand write addr ofs len - write data at ofs with 
> len from addr onenand erase block start-end - erase block 
> from start to end onenand erase saddr eaddr - erase block 
> start addr to end addr onenand block[.oob] addr block [page] 
> [len] - read data with (block [,
> page]) tr
> onenand unlock start-end - unlock block from start to end 
> onenand save bootloader addr - save bootloader at addr
> 
> You can find U-boot source for OneNAND at 
> http://linux.omap.com/pub/bootloader/2430sdp/source/
> 
> 
