Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akSHn-0002qA-Cj
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 08:12:32 +0000
Received: by mail-lf0-x242.google.com with SMTP id y184so3422777lfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2016 01:12:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160325095120.640afc2c@bbrezillon>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-6-git-send-email-peterpandong@micron.com>
 <20160325095120.640afc2c@bbrezillon>
Date: Mon, 28 Mar 2016 16:12:08 +0800
Message-ID: <CAAyFORL_=y3Ea2j0YTFGmoMrFfcC+DkQ94XnBHwnkryREGSZvA@mail.gmail.com>
Subject: Re: [PATCH 05/11] mtd: nand: use new BBT API instead of old ones
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

On Fri, Mar 25, 2016 at 4:51 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 14 Mar 2016 02:47:58 +0000
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> Use new BBT APIs (nand_bbt_*()) in NAND. Keep old APIs (nand_*_bbt())
>> exist temporarily.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/docg4.c     |   7 +-
>>  drivers/mtd/nand/nand_base.c | 151 ++++++++++++++++++++++++++++++++++++++++---
>>  include/linux/mtd/nand.h     |  15 ++++-
>>  3 files changed, 160 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index b6facac..6f0e3b9 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>
> [...]
>
>> +static int nand_default_bbt(struct mtd_info *mtd)
>> +{
>> +     struct nand_chip *chip = mtd_to_nand(mtd);
>> +     struct nand_bbt *nand_bbt = NULL;
>> +     struct nand_chip_layout_info *info =
>> +             kzalloc(sizeof(struct nand_chip_layout_info), GFP_KERNEL);
>
> No, this should be directly embedded in nand_chip, and should replace
> the numchips/chipsize/... fields declared in there.

As I said in patch 2, I keep it like this temporarily. Will embedded it in
struct nand_chip later.

Thanks,
Peter Pan
