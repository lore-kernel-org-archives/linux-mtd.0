Received: from fmr17.intel.com ([134.134.136.16] helo=orsfmr002.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EoJ13-0001en-KU
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2005 06:17:26 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: Christian Lehne <christian_lehne@gmx.de>
In-Reply-To: <43A690EA.5050903@gmx.de>
References: <20051216122331.GA801@angel.research.nokia.com>
	<43A690EA.5050903@gmx.de>
Content-Type: text/plain
Date: Mon, 19 Dec 2005 19:07:17 +0800
Message-Id: <1134990437.31513.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de,
	Jarkko Lavinen <jarkko.lavinen@nokia.com>, priewasser@gmail.com
Subject: Re: EBH with OneNAND doesn't work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-12-19 at 11:52 +0100, Christian Lehne wrote:
> Jarkko Lavinen wrote:
> > I am trying to use JFFS2 (JFFS2 from cvs -D 'Nov 12, 2005' with the
> > mtd driver part from CVS head) on OneNAND simulator and real OneNAND
> > device.
> >
> > I erased the test partition with "flash_eraseall /dev/mtd0". I mount the
> > partition and no other fs operation is done.  When I just unmount and 
> mount
> > again, I get
> >
> >   # mount -t jffs2 /dev/mtdblock0 /mnt
> >   ...
> >   Dec 16 12:35:11 slayer kernel: jffs2_scan_eraseblock(): Scanning 
> block at 0x0
> >   Dec 16 12:35:11 slayer kernel: JFFS2: Erase block at 0x00000000 is 
> not formatted. It will be erased
> >   Dec 16 12:35:11 slayer kernel: jffs2_scan_eraseblock(): Scanning 
> block at 0x10000
> >   Dec 16 12:35:11 slayer kernel: JFFS2: Erase block at 0x00010000 is 
> not formatted. It will be erased
> >   ...
> >   Dec 16 12:35:11 slayer kernel: Cowardly refusing to erase blocks on 
> filesystem with no valid JFFS2 nodes
> >   Dec 16 12:35:11 slayer kernel: empty_blocks 0, bad_blocks 0, 
> c->nr_blocks 256
> >   Dec 16 12:35:11 slayer kernel: c->used_size: 0
> >   Dec 16 12:35:11 slayer kernel: c->nr_free_blocks 0
> >   Dec 16 12:35:11 slayer kernel: 
> (c->nr_free_blocks+empty_blocks+bad_blocks): 0
> >   Dec 16 12:35:11 slayer kernel: [JFFS2 DBG] (3779) 
> jffs2_do_mount_fs: build_fs failed
> >
> >
> > JFFS2 is complaining about many pages being unformatted. It shouldn't
> > do this, since the pages should be properly formatted after the first
> > mount within a second when using a fast machine. At least on Nandsim and
> > Ramtd they are.
> >
> > Also, no pages are used so pages shold be either free or empty but the
> > number of free or empty pages is zero. This triggers the Cowardly
> > message,
> >
> > I am seeing the same problem on both real OneNAND and OneNand
> > simulator.  On Nandsim or Ramtd everything seems to work ok.
> >
> > The problem might be related to the free OOB bytes being scattered in
> > OneNand. The first free OOB region start at offset 2 and with length 3
> > bytes with autoplacement.
> 
> Hi,
> 
> as my colleague announced we had the same problem with a
> OneNAND512(KFG1216x2A) Chip.
> We had two problems: the one with the oob-handling which is discussed in
> another thread and the low-level read/write routine for onenand
> So here are two patches which will work for us but which is 
> unfortunately not generic.
> 
> In onenand_base.c I changed the bitmask for oobfree. as i can see with
> our chip i am not allowed to use (2,3) (reserved for crc), thats why i
> toggled (14,2) (which is free) and (2,3).
> the main problem i had is in
> onenand_read_bufferram/onenand_write_bufferram.
> as i understand bufferram-hardware accesses, i am not allowed to use
> memcpy for this, instead i use a (slow!!) copy routine with
> onenand_readw/onenand_writew. with that it works fine.
> (interestingly i only got read/write errors in OOB-Area not in data-Area
> when using memcpy.)
> 
> Note that i am working with 16Bit data. onenand_write_bufferram() will
> fail if someone wrote an odd number of data!!!
> can someone tell me if there are cases where this function is called
> with an odd number of data?
> in my target i can't see this.
> 
> 
> In flash_eraseall.c there is a JFFS2_NODETYPE_ERASEBLOCK_HEADER-marker
> written but i couldn't find such a marker in the kernel-sources, so i
> replaced it with a cleanmarker which worked fine by us. but i miss the
> whole to understand the effects of this, so maybe someone with more
> experience can have a lock at this.
> Also the size of the structures (jffs2_raw_ebh) in flash_eraseall and
> kernel seems to differ, so we just use 8 Bytes instead.
> Last we wrote only ebhlen Data to OOB-Area (ebhlen with our chip is 2
> Bytes so we finally use only 2 bytes for OOB-Data, don't know if this is
> enough but it works fine, think we will have to wait for a generic
> solution with oob-handling)
> 
> 
> sorry for my poor solution but i am currently under pressure of time (as 
> probably all of you.. ).
> 
> Regards,
> Christian
> 
> 
> 
> diff -uN util/flash_eraseall.c a/util/flash_eraseall.c
> --- util/flash_eraseall.c       2005-12-19 10:38:20.000000000 +0100
> +++ util/flash_eraseall.c       2005-11-08 02:02:20.000000000 +0100
> @@ -83,8 +83,8 @@
> 
>          if (jffs2) {
>                  ebh.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
> +               ebh.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
> +               ebh.totlen = cpu_to_je32(8);
> -               ebh.nodetype = cpu_to_je16
> (JFFS2_NODETYPE_ERASEBLOCK_HEADER);
> -               ebh.totlen = cpu_to_je32(sizeof(struct jffs2_raw_ebh));
>                  ebh.hdr_crc = cpu_to_je32 (crc32 (0, &ebh,  sizeof
> (struct jffs2_unknown_node) - 4));
>                  ebh.reserved = 0;
>                  ebh.compat_fset = JFFS2_EBH_COMPAT_FSET;
> @@ -92,7 +92,7 @@
>                  ebh.rocompat_fset = JFFS2_EBH_ROCOMPAT_FSET;
>                  ebh.erase_count = cpu_to_je32(0);
>                  ebh.node_crc = cpu_to_je32(crc32(0, (unsigned char
> *)&ebh + sizeof(struct jffs2_unknown_node) + 4,
> +                                        8 - sizeof(struct
> jffs2_unknown_node) - 4));
> -                                        sizeof(struct jffs2_raw_ebh) -
> sizeof(struct jffs2_unknown_node) - 4));
> 
>                  if (isNAND) {
>                          struct nand_oobinfo oobinfo;
> @@ -182,11 +182,10 @@
>                          struct mtd_oob_buf oob;
>                          uint32_t i = 0, written = 0;
> 
> +                       while (written < ebhlen) {
> -                       while (written < sizeof(struct jffs2_raw_ebh)) {
>                                  oob.ptr = (unsigned char *) &ebh + written;
>                                  oob.start = erase.start +
> meminfo.oobblock*i + ebhpos;
>                                  oob.length = (sizeof(struct
> jffs2_raw_ebh) - written) < ebhlen ? (sizeof(struct jffs2_raw_ebh) -
> written) : ebhlen;
> +
>                                  if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
>                                          fprintf(stderr, "\n%s: %s: MTD
> writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
>                                          break;
> 
> 
> 
> 
> 
> 
> 
> 
> diff -uN ..
> --- linux/drivers/mtd/onenand/onenand_base.c    2005-12-19
> 10:46:37.000000000 +0100
> +++ linux/drivers/mtd/onenand/onenand_base.c    2005-12-16
> 02:02:11.000000000 +0100
> @@ -33,8 +33,8 @@
>                  56, 57, 58, 59, 60,
>                  },
>          .oobfree        = {
> +               {14, 2}, { 2, 3}, {18, 3}, {30, 2},
> +               {34, 3}, {46, 2}, {50, 3}, {62, 2} }
> -               {2, 3}, {14, 2}, {18, 3}, {30, 2},
> -               {24, 3}, {46, 2}, {40, 3}, {62, 2} }
>   };
> 
>   /**
> @@ -367,33 +367,12 @@
>   {
>          struct onenand_chip *this = mtd->priv;
>          void __iomem *bufferram;
> +       unsigned short *p;
> +       int i;
> 
>          bufferram = this->base + area;
> 
>          bufferram += onenand_bufferram_offset(mtd, area);
> 
> +       p = (unsigned short *)buffer;
> +       for (i=0; i< (count >> 1 ); i++)
> +        p[i] = onenand_readw(bufferram + offset + 2*i);
> +       if(count%2)
> +               buffer[count-1] = (unsigned char) (0xff &
> onenand_readw(bufferram + offset + count - 1));
> +
> -       memcpy(buffer, bufferram + offset, count);
> 
>          return 0;
>   }
> @@ -442,40 +421,12 @@
>   {
>          struct onenand_chip *this = mtd->priv;
>          void __iomem *bufferram;
> +       unsigned short *p;
> +       int i;
> 
>          bufferram = this->base + area;
> 
>          bufferram += onenand_bufferram_offset(mtd, area);
> 
> +       p = (unsigned short *)buffer;
> +       for (i=0; i< (count >> 1 ); i++){
> +        onenand_writew(*p, bufferram + offset + 2 * i);
> +        p++;
> +       }
> +       if(count%2)
> +               printk("FATAL ERROR: onenand_write_bufferram count is
> odd : %x\n", count);
> +       if(offset%2)
> +               printk("FATAL ERROR: onenand_write_bufferram offset is
> odd : %x\n", offset);
> +
> -       memcpy(bufferram + offset, buffer, count);
> 
>          return 0;
>   }
> 

Please report bug to me if EBH still can work together with patched
OneNAND.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
