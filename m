Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm3k0-00027Y-Do
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 17:52:00 +0000
Received: by padhy16 with SMTP id hy16so27583485pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 10:51:38 -0700 (PDT)
Date: Tue, 13 Oct 2015 10:51:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Yanjiantao <yanjiantao@hisilicon.com>
Cc: "dmw2@infradead.org" <dmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Caizhiyong <caizhiyong@hisilicon.com>,
 pengjiancheng <pengjiancheng@huawei.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= mtd:
 cmdlinepart: allow fill-up partition at any point
Message-ID: <20151013175136.GX107187@google.com>
References: <C3050A4DBA34F345975765E43127F10F62D61353@SZXEMA512-MBX.china.huawei.com>
 <A5C805F07496A54EAFF48B92DEC9C1057AECB167@SZXEMA501-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A5C805F07496A54EAFF48B92DEC9C1057AECB167@SZXEMA501-MBX.china.huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

First of all, I don't know why this message is in reply to the $subject
thread. Bad block markers have nothing to do with cmdlineparts.

On Tue, Oct 13, 2015 at 08:53:04AM +0000, Yanjiantao wrote:
> Hi,
> In linux-3.10 and later kernel versions, block 'markbad' or 'checkbad' method is to mark or check 1st, 2nd/last page, which depends on chip->bbt_options:
> markbad flows is as follows:
>                 /* Write to first/last page(s) if necessary */
>                 if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
>                         wr_ofs += mtd->erasesize - mtd->writesize;
>                 do {
>                         res = nand_do_write_oob(mtd, wr_ofs, &ops);
>                         if (!ret)
>                                 ret = res;
> 
>                         i++;
>                         wr_ofs += mtd->writesize;
>                 } while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
> Check bad flows is the same.
> 
> 1. when NAND_BBT_SCANLASTPAGE is set, markbad and checkbad on the last page only.
> 2. when NAND_BBT_SCAN2NDPAGE is set, markbad and checkbad on the 1st and 2nd page.

Sounds right.

> Questions:
> 1. for some NAND Flash, badblock marker is on 1st or 2nd or last page(spansion), in this case , check badblock my fail.
> 2. for some NAND Flash, bad block marker is on 1st or last page(hynix H27UBG8T2CTR) , in this case, check badblock may fail too.
> 3. set NAND_BBT_SCANLASTPAGE means only mark or check the last page, which is not compliant with SAMSUNG/ TOSHIBA/ HYNIX/MICRON/spansion. they claim bad block marker is on 1st/2nd, or 1st/last, or 1st/2nd/last, or the 1st only. 

We try our best to get the BBM locations correct. But we have
acknowledged that there are corner cases out there that we don't get
right. So far, I guess nobody really cares.

FWIW, in practice it seems that even when the datasheet says something
specific like the descriptions you mention above, the factory process
just fuses all bytes to zero (not just OOB, and not just in certain
pages; but ALL bytes in the factory-marked bad block). Have you seen any
failures as a result of bad BBM scans? Or is the problem just
theoretical?

Also, you can refer to this (old) table of NAND flash [1] that I and a few
others catalogued, and it notes a few flash that are not supported
correctly. It may be a bit out of date.

Brian

[1] http://linux-mtd.infradead.org/nand-data/nanddata.html
