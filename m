Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am7DP-0007qO-1k
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 22:06:51 +0000
Received: by mail-lb0-x22a.google.com with SMTP id bc4so79849497lbc.2
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 15:06:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FEEEE6.40307@nod.at>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <56FEEEE6.40307@nod.at>
Date: Fri, 1 Apr 2016 19:06:28 -0300
Message-ID: <CAAEAJfBanWWCAGrb+-hTZkXwRyqV3LyJHvrtagj=h9_4cYUZfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: Drop mtd.owner requirement in nand_scan
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1 April 2016 at 18:57, Richard Weinberger <richard@nod.at> wrote:
> Am 01.04.2016 um 23:29 schrieb Ezequiel Garcia:
>> Since commit 807f16d4db95 ("mtd: core: set some defaults
>> when dev.parent is set"), it's now legal for drivers
>> to call nand_scan and nand_scan_ident without setting
>> mtd.owner.
>>
>> Drop the check and while at it remove the BUG() abuse.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  drivers/mtd/nand/nand_base.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index c3733a10a6e7..befa04ef4a04 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -4013,7 +4013,6 @@ static int nand_dt_init(struct nand_chip *chip)
>>   * This is the first phase of the normal nand_scan() function. It reads=
 the
>>   * flash ID and sets up MTD fields accordingly.
>>   *
>> - * The mtd->owner field must be set to the module of the caller.
>>   */
>>  int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>>                   struct nand_flash_dev *table)
>> @@ -4433,19 +4432,12 @@ EXPORT_SYMBOL(nand_scan_tail);
>>   *
>>   * This fills out all the uninitialized function pointers with the defa=
ults.
>>   * The flash ID is read and the mtd/chip structures are filled with the
>> - * appropriate values. The mtd->owner field must be set to the module o=
f the
>> - * caller.
>> + * appropriate values.
>>   */
>>  int nand_scan(struct mtd_info *mtd, int maxchips)
>>  {
>>       int ret;
>>
>> -     /* Many callers got this wrong, so check for it for a while... */
>> -     if (!mtd->owner && caller_is_module()) {
>> -             pr_crit("%s called with NULL mtd->owner!\n", __func__);
>> -             BUG();
>> -     }
>
> Look okay to me.
> Do we have an in-kernel user which currently hits this condition?
>

I think that (after the recent mtd.owner swept) all the drivers that
use nand_scan, will hit this condition if built as modules.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
