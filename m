Received: from mo1501.tsb.2iij.net ([210.149.48.173] helo=mo.tsb.2iij.net)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRGbI-0001Zh-In
 for linux-mtd@lists.infradead.org; Tue, 19 Dec 2017 12:02:27 +0000
Subject: Re: [PATCH -next v3 2/2] mtd: nand: toshiba: Add support for Toshiba
 Memory BENAND (Built-in ECC NAND)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1512569098-30038-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <1512569098-30038-3-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20171206162404.3a1d83b9@bbrezillon>
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Message-ID: <dc554f2d-f72f-70b5-d6fa-d1a94bd0e148@toshiba.co.jp>
Date: Tue, 19 Dec 2017 21:01:47 +0900
MIME-Version: 1.0
In-Reply-To: <20171206162404.3a1d83b9@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for reviewing the patches and taht is a good news for me about nand_exec_op().
I'll change this patch as you suggested.
I would like to make sure the following one.

>> @@ -70,6 +155,10 @@ static int toshiba_nand_init(struct nand_chip *chip)
>>  	if (nand_is_slc(chip))
>>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>>  
>> +	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80) /* BENAND */ &&
>> +	    (chip->ecc.mode == NAND_ECC_ON_DIE))
>> +		toshiba_nand_benand_init(chip);
>> +
> 
> Please move this block to toshiba_nand_init().

I think it's already in toshiba_nand_init().

-- YOSHI


On 2017/12/07 0:24, Boris Brezillon wrote:
> On Wed,  6 Dec 2017 23:04:58 +0900
> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> 
>> This patch enables support for Toshiba Memory BENAND. This checks
>> internal ECC status in read operation when using BENAND and selecting
>> ECC mode as on-die.
>>
>> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
>> ---
>>  drivers/mtd/nand/nand_toshiba.c | 89 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 89 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
>> index c2c141b..35c0ddf 100644
>> --- a/drivers/mtd/nand/nand_toshiba.c
>> +++ b/drivers/mtd/nand/nand_toshiba.c
>> @@ -17,6 +17,91 @@
>>  
>>  #include <linux/mtd/rawnand.h>
>>  
>> +/* ECC Status Read Command for BENAND */
>> +#define TOSHIBA_NAND_CMD_ECC_STATUS	0x7A
>> +
>> +/* Recommended to rewrite for BENAND */
>> +#define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
>> +
>> +static int toshiba_nand_benand_status_chk(struct mtd_info *mtd,
>> +					  struct nand_chip *chip)
>> +{
>> +	unsigned int max_bitflips = 0;
>> +	u8 status;
>> +
>> +	/* Check Read Status */
>> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>> +	status = chip->read_byte(mtd);
> 
> Please use the recently introduced nand_status_op() helper.
> 
>> +
>> +	/*
>> +	 * TOSHIBA_NAND_CMD_ECC_STATUS is vendor specific command.
>> +	 * Currently we have no way to send arbitrary sequences of
>> +	 * CMD+ADDR+DATA cycles and thus cannot support this custom
>> +	 * TOSHIBA_NAND_CMD_ECC_STATUS operation.
> 
> That's about to change :-), if everything goes well, nand_exec_op()
> should be available in 4.16.
> 
>> +	 * For now, we set max_bitflips mtd->bitflip_threshold.
>> +	 */
>> +	if (status & NAND_STATUS_FAIL) {
>> +		/* uncorrectable */
>> +		mtd->ecc_stats.failed++;
>> +	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
>> +		/* correctable */
>> +		max_bitflips = mtd->bitflip_threshold;
>> +		mtd->ecc_stats.corrected += max_bitflips;
>> +	}
>> +
>> +	return max_bitflips;
>> +}
>> +
>> +static int
>> +toshiba_nand_read_page_benand(struct mtd_info *mtd,
>> +			      struct nand_chip *chip, uint8_t *buf,
>> +			      int oob_required, int page)
>> +{
>> +	nand_read_page_raw(mtd, chip, buf, oob_required, page);
> 
> Please check the return code of nand_read_page_raw().
> 
>> +
>> +	return toshiba_nand_benand_status_chk(mtd, chip);
>> +}
>> +
>> +static int
>> +toshiba_nand_read_subpage_benand(struct mtd_info *mtd,
>> +				 struct nand_chip *chip, uint32_t data_offs,
>> +				 uint32_t readlen, uint8_t *bufpoi, int page)
>> +{
>> +	uint8_t *p;
>> +
>> +	if (data_offs != 0)
>> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
>> +
>> +	p = bufpoi + data_offs;
>> +	chip->read_buf(mtd, p, readlen);
> 
> The core is no longer sending the initial READ0 command, so this should
> be turned into:
> 
> 	ret = nand_read_page_op(chip, data_offs, bufpoi + data_offs,
> 				readlen);
> 	if (ret)
> 		return ret;
> 		
> 
>> +
>> +	return toshiba_nand_benand_status_chk(mtd, chip);
>> +}
>> +
>> +static void toshiba_nand_benand_init(struct nand_chip *chip)
>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +
>> +	/*
>> +	 * On BENAND, the entire OOB region can be used by the MTD user.
>> +	 * The calculated ECC bytes are stored into other isolated
>> +	 * area which is not accessible to users.
>> +	 * This is why chip->ecc.bytes = 0.
>> +	 */
>> +	chip->ecc.bytes = 0;
>> +	chip->ecc.size = 512;
>> +	chip->ecc.strength = 8;
>> +	chip->ecc.read_page = toshiba_nand_read_page_benand;
>> +	chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
>> +	chip->ecc.write_page = nand_write_page_raw;
>> +	chip->ecc.read_page_raw = nand_read_page_raw;
>> +	chip->ecc.write_page_raw = nand_write_page_raw;
>> +
>> +	chip->options |= NAND_SUBPAGE_READ;
>> +
>> +	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
>> +}
>> +
>>  static void toshiba_nand_decode_id(struct nand_chip *chip)
>>  {
>>  	struct mtd_info *mtd = nand_to_mtd(chip);
>> @@ -70,6 +155,10 @@ static int toshiba_nand_init(struct nand_chip *chip)
>>  	if (nand_is_slc(chip))
>>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>>  
>> +	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80) /* BENAND */ &&
>> +	    (chip->ecc.mode == NAND_ECC_ON_DIE))
>> +		toshiba_nand_benand_init(chip);
>> +
> 
> Please move this block to toshiba_nand_init().
> 
>>  	return 0;
>>  }
>>  
> 
> 
> 
