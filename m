Received: from aa011-1msr.fastwebnet.it ([62.101.93.131])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RBnNK-0004Ay-Um
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2011 12:48:35 +0000
Subject: Re: cfi_cmdset_0002.c SST39VF3201B issue
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: angelo <angelo70@gmail.com>
In-Reply-To: <4E8D9F14.4090108@gmail.com>
References: <4E8D9F14.4090108@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 Oct 2011 14:48:33 +0200
Message-ID: <1317905313.4526.9.camel@AURIO02>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	uClinux development list <uclinux-dev@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would try to keep the 4kBi blocks. 


regards



Il giorno gio, 06/10/2011 alle 14.29 +0200, angelo ha scritto:
> Dear all,
> 
> like me some other users had issues with this chip and jffs2.
> 
>  From time to time users asks why they get errors trying to use jffs2 
> with this chip.
> 
> This chip, from the datasheet, allows to erase 4KB "sectors" or 64KB 
> "blocks", replying to cfi queries with a "setcor" erase size and a 
> "block" erase size.
> 
> I can be wrong of course, but this is what i figured out:
> 
> 
> 1) fixup decision
> 
> Someone of you decided to fix up this SST39VF3201 in this way:
> 
> static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
> {
>      struct map_info *map = mtd->priv;
>      struct cfi_private *cfi = map->fldrv_priv;
> 
>      /*
>       * These flashes report two seperate eraseblock regions based on the
>       * sector_erase-size and block_erase-size, although they both 
> operate on the
>       * same memory. This is not allowed according to CFI, so we just 
> pick the
>       * sector_erase-size.
>       */
>      cfi->cfiq->NumEraseRegions = 1;
> }
> 
> Of course, in this way, deciding 0x1000 (sector-size) is the one to use, 
> jffs2 cannot be used safely, since
> minimal data block is 4Kb + some hdr bytes. Wasn't better fixup to 
> "block" size (64K) ?
> 
> 
> 2) after fixup decision, when jffs2 asks to erase a block to 
> cfi_cmdset_0002.c, cfi driver seems to erase wrongly a 64K block.
> This is what happen in detail:
>     jffs erase.c, to erase a block does:  mtd->erase(), with a len  
> mtd->erasesize (4KB).
>     mtd->erase() is calls cfi_amdstd_erase_varsize ...
>       finally, do_erase_oneblock is called, where:
> 
> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, 
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
> cfi->device_type, NULL);
> map_write(map, CMD(0x30), adr);
> 
> but this chip uses 0x30 cmd to erase a 64 KB block, and 0x50 to erase a 
> sector.
> 
> Please let me know if i am in the right direction, so i can think about 
> a patch that allows
> jffs2 to be used with native hw 64KB block erasesize.
> 
> Regards
> Angelo Dureghello
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Fabio Giovagnini

Aurion s.r.l.
P.iva 00885711200
cell. +39.335.8350919
Tel. +39.051.594.78.24
Fax. +39 051.082.14.49
skype: aurion.giovagnini
