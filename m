Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm3le-0002PX-5W
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 17:53:42 +0000
Received: by pabve7 with SMTP id ve7so28048142pab.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 10:53:21 -0700 (PDT)
Date: Tue, 13 Oct 2015 10:53:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Yanjiantao <yanjiantao@hisilicon.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Caizhiyong <caizhiyong@hisilicon.com>,
 "Wanli (welly)" <welly.wan@hisilicon.com>, Quyaxin <quyaxin@hisilicon.com>
Subject: Re: questions about  [PATCH]mtd: nand: fix SCAN2NDPAGE check for BBM
Message-ID: <20151013175318.GY107187@google.com>
References: <C3050A4DBA34F345975765E43127F10F62D61353@SZXEMA512-MBX.china.huawei.com>
 <A5C805F07496A54EAFF48B92DEC9C1057AECB1A7@SZXEMA501-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A5C805F07496A54EAFF48B92DEC9C1057AECB1A7@SZXEMA501-MBX.china.huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 13, 2015 at 11:33:54AM +0000, Yanjiantao wrote:
> Dear Brian,
> 
> i read the patch:  " mtd: nand: fix SCAN2NDPAGE check for BBM "
> And i am confused about the markbad flows.
> 
> 		xxxxx;
>         if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
>                 ofs += mtd->erasesize - mtd->writesize;
> 
> 		xxxxx;
> 
>         do { 
>                 if (chip->options & NAND_BUSWIDTH_16) {
>                         chip->cmdfunc(mtd, NAND_CMD_READOOB,
>                                         chip->badblockpos & 0xFE, page);
>                         bad = cpu_to_le16(chip->read_word(mtd));
>                         if (chip->badblockpos & 0x1) 
>                                 bad >>= 8;
>                         else 
>                                 bad &= 0xFF;
>                 } else {
>                         chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
>                                         page);
>                         bad = chip->read_byte(mtd);
>                 }    
> 
>                 if (likely(chip->badblockbits == 8))
>                         res = bad != 0xFF;
>                 else 
>                         res = hweight8(bad) < chip->badblockbits;
>                 ofs += mtd->writesize;
>                 page = (int)(ofs >> chip->page_shift) & chip->pagemask;
>                 i++; 
>         } while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE)); 
> mark bad flows is the same.
> 
> If I understand the patch right, then I think that:
> 1. when NAND_BBT_SCANLASTPAGE is set, markbad and checkbad on the last page only.
> 2. when NAND_BBT_SCAN2NDPAGE is set, markbad and checkbad on the 1st and 2nd page.
> 
> I checked some datasheets of different manufacturers(such as SAMSUNG/HYNIX/MICRON/TOSHIBA), they claim that bad block marker is on 1st/2nd, or 1st/last, or 1st/2nd/last(for spansion).
> the checkbad method may check fail in some cases:
> for example,:
> 1. for spansion nand(bad block marker is on 1st or 2nd or last page), set NAND_BBT_SCAN2NDPAGE while badblock marker is on last page or set NAND_BBT_SCANLASTPAGE while badblock marker is on 1st/2nd page may cause badblock chech failed.
> 2. for HYNIX (H27UBG8T2CTR) nand (bad block marker is on 1st or last page), check may failed whether NAND_BBT_SCANLASTPAGE is set or not.

Are you repeating the question from here [1]? The refer to my response
here [2].

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062486.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062509.html
