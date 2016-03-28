Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akS2N-0005BZ-Uf
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 07:56:37 +0000
Received: by mail-lb0-x242.google.com with SMTP id oa3so8966590lbb.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2016 00:56:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160325094948.136c4501@bbrezillon>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-4-git-send-email-peterpandong@micron.com>
 <20160325094948.136c4501@bbrezillon>
Date: Mon, 28 Mar 2016 15:56:11 +0800
Message-ID: <CAAyFORK4tBB0qAoB7zTktByF3Hwb0v+=RiAw2Zg0u561u_6c5Q@mail.gmail.com>
Subject: Re: [PATCH 03/11] mtd: nand_bbt: add new API definitions
From: Peter Pan <peterpansjtu@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 25, 2016 at 4:49 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 14 Mar 2016 02:47:56 +0000
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> Add new API definitions for nand_bbt to replace old ones without
>> any users. These API includes:
>>       struct nand_bbt_create(struct mtd_info *mtd);
>>       struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
>>                               const struct nand_bbt_ops *ops,
>>                               struct nand_chip_layout_info *info,
>>                               unsigned int options,
>>                               struct nand_bbt_descr *bbt_td,
>>                               struct nand_bbt_descr *bbt_md);
>>       void nand_bbt_destroy(struct nand_bbt *bbt);
>>       int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
>>       int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
>>       int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/nand_bbt.c  | 113 +++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/nand_bbt.h |  11 +++++
>>  2 files changed, 124 insertions(+)
>>
>
>>
>> +struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
>> +             const struct nand_bbt_ops *ops,
>> +             struct nand_chip_layout_info *info,
>
> Should be const struct nand_chip_layout_info *.

Fix this in v4

Thanks,
Peter Pan
