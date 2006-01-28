Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3RoX-00024J-0c
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2006 00:43:02 -0500
Message-ID: <43DB3645.9040804@ru.mvista.com>
Date: Sat, 28 Jan 2006 12:15:49 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: yuri.golovach@mindspeed.com
References: <OF1F9E1072.64E03318-ON88257102.0060A9BE-C2257102.0060ED3A@mindspeed.com>
In-Reply-To: <OF1F9E1072.64E03318-ON88257102.0060A9BE-C2257102.0060ED3A@mindspeed.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yuri,

can you please supply the patch for the yaffs_mtdif2.c you've done?
Please keep in mind that you have to consider how many spare bytes to 
read from an OOB area.

Best regards,
   Vitaly

yuri.golovach@mindspeed.com wrote:

>
> Hi Vitaly!
>  
> I've successfully applied your patch without any issues, changed 
> read_oob and write_oob on read_oobfree and write_oobfree.
>  
> No "Bad block" at the booting procedure, but here is result which I've 
> resived:
>  
> comcerto:/# mount -t yaffs2 /dev/mtdblock3 /mnt/y
>  
> Unable to handle kernel NULL pointer dereference at virtual address 
> 00000000
> pgd = c2490000
> [00000000] *pgd=03ac3031, *pte=00000000, *ppte=00000000
> Internal error: Oops: 0 [#1]
> Modules linked in:
> CPU: 0
> PC is at 0x0
> LR is at nand_read_oobfree+0x3a0/0x49c
> pc : [<00000000>]    lr : [<c010e168>]    Not tainted
> sp : c286fbf8  ip : c286fbd4  fp : c286fc44
> r10: c02ffc00  r9 : 00000002  r8 : 00000000
> r7 : 00000000  r6 : 00000000  r5 : c02ffd88  r4 : 00000010
> r3 : c2e94870  r2 : 00000002  r1 : 00000004  r0 : c02ffc00
> Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment user
> Control: C000717F  Table: 03490000  DAC: 00000015
> Process mount (pid: 952, stack limit = 0xc286e194)
> Stack: (0xc286fbf8 to 0xc2870000)
> fbe0:                                                       0000003f 
> c291e420
> fc00: 00000000 00000802 00000000 00000000 00006c00 00006c00 00000040 
> 00000000
> fc20: 00000000 00000040 03200000 00000000 c286fcd0 00000000 c286fc70 
> c286fc48
> fc40: c0100434 c010ddd8 c286fc84 c291e420 c2451000 00000000 c2e00000 
> 00000000
> fc60: 00000000 c286fccc c286fc74 c00ce98c c01003cc c286fc84 c291e420 
> 03600000
> fc80: 00000000 c286fcb4 c286fc94 c010fc48 c01124c4 00000000 03600000 
> 00000000
> fca0: 00000000 c2451000 00000000 00000000 c286fd50 c286fd54 c0326000 
> c01af9c8
> fcc0: c286fd3c c286fcd0 c00ceae0 c00ce890 c00556c0 c00554d8 c027d120 
> c02059ac
> fce0: c02059a0 c027f400 c01af9c8 c02059b4 c286fd28 c286fd00 c0055904 
> c00555e4
> fd00: 40000013 c2451000 c2451000 00000000 c01af9c8 00000000 00000190 
> c286fd50
> fd20: c2451000 00000000 00000001 c286fd54 c286fdc8 c286fd40 c00cbe28 
> c00cea20
> fd40: c248e000 c0013000 00000000 c00c7800 c0055b1c c2451000 00000000 
> 00000003
> fd60: c2451000 c286fd88 c286fd74 c00c7898 c00c78c8 c24ac174 00000002 
> c286fdb0
> fd80: c286fd8c c00c7d80 c0036d5c 0000003d 07270e00 c2451000 000041b6 
> c01af9c8
> fda0: c03122fc c2451000 c01af9c8 00000118 0000000a 00000000 00000000 
> c286fdf0
> fdc0: c286fdcc c00cd4d0 c00cbcb4 c2e00000 c0312a00 c01af9c8 c2451000 
> 00000000
> fde0: 00000000 c286fe44 c286fdf4 c00c5bd0 c00cd0b8 c2e9436c 6264746d 
> 6b636f6c
> fe00: c2460033 00000000 c286fe24 c0312b40 00000009 00000009 c286fe58 
> c028205c
> fe20: c0282040 c0312a00 00000000 00000000 c2461000 00000000 c286fe54 
> c286fe48
> fe40: c00c60f4 c00c5974 c286fe98 c286fe58 c007004c c00c60e0 6264746d 
> 6b636f6c
> fe60: 00000033 c0011de0 0000000f c0275c60 c0011de0 c248c000 c0275c60 
> fffffff4
> fe80: c01afc3c c248c000 00000000 c286feac c286fe9c c00c6120 c006ff2c 
> c00c60d0
> fea0: c286fed4 c286feb0 c007028c c00c6114 ffffffff c248c000 00000000 
> 00000000
> fec0: c286ff08 00000000 c286fefc c286fed8 c0085e68 c0070240 00000000 
> c2457000
> fee0: 00000000 c248c000 00000000 00000000 c286ff70 c286ff00 c0086520 
> c0085df0
> ff00: c248c000 00000000 c2cdd4cc c0275240 00000000 000211d0 c2457000 
> 00000001
> ff20: 00000001 00000000 c286e000 befffc54 c286ff4c c286ff40 c0051d14 
> 000211d0
> ff40: c286ff70 c286ff50 00000000 00000000 000211d0 c0ed0000 c2457000 
> c286e000
> ff60: befffc54 c286ffa4 c286ff74 c0086988 c0086400 00000000 00000000 
> c248c000
> ff80: c2461000 00000000 000211d0 befffcc8 00000015 c001c9a4 00000000 
> c286ffa8
> ffa0: c001c820 c00868f4 00000000 c00237ec 000211d0 000211e8 000211f8 
> c0ed0000
> ffc0: 00000000 000211d0 befffcc8 00000000 00000000 befffee8 befffc54 
> 00000000
> ffe0: 40104990 befffc48 0000a848 4010499c 60000010 000211d0 00000000 
> 00000000
> Backtrace:
> [<c010ddc8>] (nand_read_oobfree+0x0/0x49c) from [<c0100434>] 
> (part_read_oobfree)
> [<c01003bc>] (part_read_oobfree+0x0/0xa0) from [<c00ce98c>] 
> (nandmtd2_ReadChunk)
>  r8 = 00000000  r7 = 00000000  r6 = C2E00000  r5 = 00000000
>  r4 = C2451000
> [<c00ce880>] (nandmtd2_ReadChunkWithTagsFromNAND+0x0/0x124) from 
> [<c00ceae0>] ()
> [<c00cea10>] (nandmtd2_QueryNANDBlock+0x0/0x114) from [<c00cbe28>] 
> (yaffs_ScanB)
> [<c00cbca4>] (yaffs_ScanBackwards+0x0/0xc7c) from [<c00cd4d0>] 
> (yaffs_GutsIniti)
> [<c00cd0a8>] (yaffs_GutsInitialise+0x0/0x4e8) from [<c00c5bd0>] 
> (yaffs_internal)
> [<c00c5964>] (yaffs_internal_read_super+0x0/0x714) from [<c00c60f4>] 
> (yaffs2_in)
> [<c00c60d0>] (yaffs2_internal_read_super_mtd+0x0/0x34) from 
> [<c007004c>] (get_s)
> [<c006ff1c>] (get_sb_bdev+0x0/0x17c) from [<c00c6120>] 
> (yaffs2_read_super+0x1c/)
>  r8 = 00000000  r7 = C248C000  r6 = C01AFC3C  r5 = FFFFFFF4
>  r4 = C0275C60
> [<c00c6104>] (yaffs2_read_super+0x0/0x24) from [<c007028c>] 
> (do_kern_mount+0x5c)
> [<c0070230>] (do_kern_mount+0x0/0xf4) from [<c0085e68>] 
> (do_new_mount+0x88/0xb0)
> [<c0085de0>] (do_new_mount+0x0/0xb0) from [<c0086520>] 
> (do_mount+0x130/0x168)
> [<c00863f0>] (do_mount+0x0/0x168) from [<c0086988>] (sys_mount+0xa4/0xe8)
> [<c00868e4>] (sys_mount+0x0/0xe8) from [<c001c820>] 
> (ret_fast_syscall+0x0/0x2c)
>  r8 = C001C9A4  r7 = 00000015  r6 = BEFFFCC8  r5 = 000211D0
>  r4 = 00000000
> Code: bad PC value.
>  Segmentation fault
>  
> Also I've try not mount but simply call 
> ioctl(fd,MEMWRITEOOBFREE,&oob); - result was totlay same.
>
> So, can you help me and provide your opinion about?
>  
> Thank you,
>             Yuri Golovach
>
>
> *Vitaly Wool <vwool@ru.mvista.com>*
>
> 26.01.2006 14:51
>
> 	
> To
> 	yuri.golovach@mindspeed.com
> cc
> 	linux-mtd@lists.infradead.org, manningc2@actrix.gen.nz
> Subject
> 	Re: [PATCH] treat OOB as a single chunk of oobavail bytes
>
>
>
> 	
>
>
>
>
>
> Hi Yuri,
>
> well, lemme just summarize what you hafta do in order to make YAFFS2
> work with my patches.
>
> 1. Apply the following patch to the mtd code:
> http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.html
> (yes, it's a single patch!)
> 2. Modify the fs/yaffs2/yaffs_mtdif2.c to use read_oobfree/write_oobfree
> where appropriate.
>
> Hope that helps,
>
>   Vitaly
>
> yuri.golovach@mindspeed.com wrote:
>
> >
> > Hi Vitaly,
> >
> > Sure:
> >
> > flash device Samsung K9F1G08UOM
> >
> > patches:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2005-November/014494.html
> > http://lists.infradead.org/pipermail/linux-mtd/2005-December/014522.html
> > http://lists.infradead.org/pipermail/linux-mtd/2005-December/014523.html
> > http://lists.infradead.org/pipermail/linux-mtd/2005-November/014496.html
> > http://lists.infradead.org/pipermail/linux-mtd/2005-December/014521.html
> >
> >
> >
> > P.S: I've also downloaded ithe mtd version from 24th of November,
> > implements it in my kernel and patched with the same results. Is it
> > possible for you to say me where can I find your mtd version?
> >
> > Thank you,
> >         Yuri Golovach
> >
> >
> >
> > *Vitaly Wool <vwool@ru.mvista.com>*
> >
> > 24.01.2006 15:02
> >
> >                  
> > To
> >                  yuri.golovach@mindspeed.com
> > cc
> >                  linux-mtd@lists.infradead.org
> > Subject
> >                  Re: [PATCH] treat OOB as a single chunk of oobavail 
> bytes
> >
> >
> >
> >                  
> >
> >
> >
> >
> >
> > Hello Yuri,
> >
> > can you please specify what patches you did apply and what flash you're
> > using. Thanks!
> >
> > Vitaly
> >
> > yuri.golovach@mindspeed.com wrote:
> >
> > >Good day Vitaly.
> > >
> > >I've tried your patches which modifies nand_base.c, other mtdfiles and
> > >mtdutils to be compatible with yaffs2.
> > >
> > >Unfortunately, I've some issues with them.
> > >
> > >1)
> > >        my version of mtd is newer then your and I was unable to patch
> > >nand_base.c with your patch. So, I add this patch manually (but I'm not
> > >sure - have I done some mistakes or             not).
> > >
> > >2)       After the kernel compiling with your patches I've started it
> > and
> > >receive a long list of
> > >                Bad eraseblock1 ... at ...x..................
> > >
> > >        After "mount" and "df" commands I saw that there is no free
> > space
> > >on flash because all bloks were marked as "bad block" .
> > >        Than I've tried patched version of flash_eraseall but it 
> was not
> > >able to see blocks also.
> > >
> > >
> > >3) I've changed nand_bbt.c file (in the patched kernel) where simply
> > >comment the bad blocks checking. Have booted from it and _successfully_
> > >used patched flash_eraseall.
> > >
> > >4) Than I've start the patched kernel _with bad blocks checking_ but
> > these
> > >(previously erased blocks) were marked like "bad blocks" again (in a
> > >kernel booting procedure).
> > >
> > >
> > >So, can you, please, provide your vision what should I do to run your
> > >patch. Or you can send the link on the mtd line which supports yaffs2,
> > >because I was unable to find your updates in CVS mainline :(
> > >
> > >Thank you,
> > >        Yuri Golovach
> > >
> > >
> > >  
> > >
> >
> >
> >
>
>
>
