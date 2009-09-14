Received: from mail-px0-f189.google.com ([209.85.216.189])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnIZM-00040u-3r
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 20:54:45 +0000
Received: by pxi27 with SMTP id 27so2605599pxi.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Sep 2009 13:54:33 -0700 (PDT)
To: "Narnakaje\, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
	read_page/read_page_raw APIs
References: <1247781570-11021-1-git-send-email-nsnehaprabha@ti.com>
	<7A436F7769CA33409C6B44B358BFFF0C0129FEAE22@dlee02.ent.ti.com>
From: Kevin Hilman <khilman@deeprootsystems.com>
Date: Mon, 14 Sep 2009 13:54:29 -0700
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C0129FEAE22@dlee02.ent.ti.com>
	(Snehaprabha Narnakaje's message of "Mon\,
	14 Sep 2009 14\:40\:28 -0500")
Message-ID: <87bpldz1q2.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Narnakaje, Snehaprabha" <nsnehaprabha@ti.com> writes:

> Kevin,
>
> All the NAND 4-bit ECC patches are approved and now in -mm tree (mmotm) queued up for the MTD tree.
>
> Could you please pick up these patches from -mm tree (with Andrew's signoff) and apply them to linux-davinci?

Sneha,

Yes, I'll pull these into my 'davinci-backports' branch that is then
merged with the master branch.

Thanks,

Kevin

> [PATCH v3 1/3] mtd-nand: Add "page" parameter to all read_page/read_page_raw APIs
> http://userweb.kernel.org/~akpm/mmotm/broken-out/mtd-nand-add-page-parameter-to-all-read_page-read_page_raw-apis.patch
>
> [PATCH v3 2/3] mtd-nand: Add new ECC mode - ECC_HW_OOB_FIRST
> http://userweb.kernel.org/~akpm/mmotm/broken-out/mtd-nand-add-new-ecc-mode-ecc_hw_oob_first.patch
>
> [PATCH v3 and v4 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large page NAND chips
> http://userweb.kernel.org/~akpm/mmotm/broken-out/mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips.patch
> http://userweb.kernel.org/~akpm/mmotm/broken-out/mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips-update.patch
>
> I will send the patch to use this new ECC mode from DM355 and DM365 NAND platform data structures.
>
>
>
>> -----Original Message-----
>> From: Narnakaje, Snehaprabha
>> Sent: Thursday, July 16, 2009 6:00 PM
>> To: linux-mtd@lists.infradead.org; davinci-linux-open-
>> source@linux.davincidsp.com; dwmw2@infradead.org; tglx@linutronix.de;
>> akpm@linux-foundation.org
>> Cc: Narnakaje, Snehaprabha; Paulraj, Sandeep
>> Subject: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
>> read_page/read_page_raw APIs
>> 
>> From: Sneha Narnakaje <nsnehaprabha@ti.com>
>> 
>> This patch new "page" parameter to all NAND read_page/read_page_raw APIs.
>> The read_page API for the new mode ECC_HW_OOB_FIRST requires the page
>> information to send the READOOB command and read the OOB area before the
>> data area.
>> 
>> This patch series applies to linux-mtd next (mmotm) GIT tree.
>> This patch is the same as v2 version of this patch.
>> 
>> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
>> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
>> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
>> ---
>>  drivers/mtd/nand/atmel_nand.c    |    2 +-
>>  drivers/mtd/nand/cafe_nand.c     |    2 +-
>>  drivers/mtd/nand/fsl_elbc_nand.c |    3 ++-
>>  drivers/mtd/nand/nand_base.c     |   18 ++++++++++--------
>>  drivers/mtd/nand/sh_flctl.c      |    2 +-
>>  include/linux/mtd/nand.h         |    4 ++--
>>  6 files changed, 17 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
>> index 20c828b..f8e9975 100644
>> --- a/drivers/mtd/nand/atmel_nand.c
>> +++ b/drivers/mtd/nand/atmel_nand.c
>> @@ -218,7 +218,7 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
>>   * buf:        buffer to store read data
>>   */
>>  static int atmel_nand_read_page(struct mtd_info *mtd,
>> -		struct nand_chip *chip, uint8_t *buf)
>> +		struct nand_chip *chip, uint8_t *buf, int page)
>>  {
>>  	int eccsize = chip->ecc.size;
>>  	int eccbytes = chip->ecc.bytes;
>> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
>> index 1b4690b..c828d9a 100644
>> --- a/drivers/mtd/nand/cafe_nand.c
>> +++ b/drivers/mtd/nand/cafe_nand.c
>> @@ -381,7 +381,7 @@ static int cafe_nand_read_oob(struct mtd_info *mtd,
>> struct nand_chip *chip,
>>   * we need a special oob layout and handling.
>>   */
>>  static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> -			       uint8_t *buf)
>> +			       uint8_t *buf, int page)
>>  {
>>  	struct cafe_priv *cafe = mtd->priv;
>> 
>> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c
>> b/drivers/mtd/nand/fsl_elbc_nand.c
>> index 1f6eb25..ddd37d2 100644
>> --- a/drivers/mtd/nand/fsl_elbc_nand.c
>> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
>> @@ -739,7 +739,8 @@ static int fsl_elbc_chip_init_tail(struct mtd_info
>> *mtd)
>> 
>>  static int fsl_elbc_read_page(struct mtd_info *mtd,
>>                                struct nand_chip *chip,
>> -                              uint8_t *buf)
>> +			      uint8_t *buf,
>> +			      int page)
>>  {
>>  	fsl_elbc_read_buf(mtd, buf, mtd->writesize);
>>  	fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 8c21b89..979988a 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -766,7 +766,7 @@ static int nand_wait(struct mtd_info *mtd, struct
>> nand_chip *chip)
>>   * Not for syndrome calculating ecc controllers, which use a special oob
>> layout
>>   */
>>  static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> -			      uint8_t *buf)
>> +			      uint8_t *buf, int page)
>>  {
>>  	chip->read_buf(mtd, buf, mtd->writesize);
>>  	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> @@ -782,7 +782,7 @@ static int nand_read_page_raw(struct mtd_info *mtd,
>> struct nand_chip *chip,
>>   * We need a special oob layout and handling even when OOB isn't used.
>>   */
>>  static int nand_read_page_raw_syndrome(struct mtd_info *mtd, struct
>> nand_chip *chip,
>> -			      uint8_t *buf)
>> +			      uint8_t *buf, int page)
>>  {
>>  	int eccsize = chip->ecc.size;
>>  	int eccbytes = chip->ecc.bytes;
>> @@ -821,7 +821,7 @@ static int nand_read_page_raw_syndrome(struct mtd_info
>> *mtd, struct nand_chip *c
>>   * @buf:	buffer to store read data
>>   */
>>  static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> -				uint8_t *buf)
>> +				uint8_t *buf, int page)
>>  {
>>  	int i, eccsize = chip->ecc.size;
>>  	int eccbytes = chip->ecc.bytes;
>> @@ -831,7 +831,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd,
>> struct nand_chip *chip,
>>  	uint8_t *ecc_code = chip->buffers->ecccode;
>>  	uint32_t *eccpos = chip->ecc.layout->eccpos;
>> 
>> -	chip->ecc.read_page_raw(mtd, chip, buf);
>> +	chip->ecc.read_page_raw(mtd, chip, buf, page);
>> 
>>  	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
>>  		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
>> @@ -944,7 +944,7 @@ static int nand_read_subpage(struct mtd_info *mtd,
>> struct nand_chip *chip, uint3
>>   * Not for syndrome calculating ecc controllers which need a special oob
>> layout
>>   */
>>  static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> -				uint8_t *buf)
>> +				uint8_t *buf, int page)
>>  {
>>  	int i, eccsize = chip->ecc.size;
>>  	int eccbytes = chip->ecc.bytes;
>> @@ -989,7 +989,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd,
>> struct nand_chip *chip,
>>   * we need a special oob layout and handling.
>>   */
>>  static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> -				   uint8_t *buf)
>> +				   uint8_t *buf, int page)
>>  {
>>  	int i, eccsize = chip->ecc.size;
>>  	int eccbytes = chip->ecc.bytes;
>> @@ -1131,11 +1131,13 @@ static int nand_do_read_ops(struct mtd_info *mtd,
>> loff_t from,
>> 
>>  			/* Now read the page into the buffer */
>>  			if (unlikely(ops->mode == MTD_OOB_RAW))
>> -				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
>> +				ret = chip->ecc.read_page_raw(mtd, chip,
>> +							      bufpoi, page);
>>  			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
>>  				ret = chip->ecc.read_subpage(mtd, chip, col,
>> bytes, bufpoi);
>>  			else
>> -				ret = chip->ecc.read_page(mtd, chip, bufpoi);
>> +				ret = chip->ecc.read_page(mtd, chip, bufpoi,
>> +							  page);
>>  			if (ret < 0)
>>  				break;
>> 
>> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
>> index 2bc8966..c5df285 100644
>> --- a/drivers/mtd/nand/sh_flctl.c
>> +++ b/drivers/mtd/nand/sh_flctl.c
>> @@ -329,7 +329,7 @@ static void set_cmd_regs(struct mtd_info *mtd,
>> uint32_t cmd, uint32_t flcmcdr_va
>>  }
>> 
>>  static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> -				uint8_t *buf)
>> +				uint8_t *buf, int page)
>>  {
>>  	int i, eccsize = chip->ecc.size;
>>  	int eccbytes = chip->ecc.bytes;
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 4030eba..686f370 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -271,13 +271,13 @@ struct nand_ecc_ctrl {
>>  					   uint8_t *calc_ecc);
>>  	int			(*read_page_raw)(struct mtd_info *mtd,
>>  						 struct nand_chip *chip,
>> -						 uint8_t *buf);
>> +						 uint8_t *buf, int page);
>>  	void			(*write_page_raw)(struct mtd_info *mtd,
>>  						  struct nand_chip *chip,
>>  						  const uint8_t *buf);
>>  	int			(*read_page)(struct mtd_info *mtd,
>>  					     struct nand_chip *chip,
>> -					     uint8_t *buf);
>> +					     uint8_t *buf, int page);
>>  	int			(*read_subpage)(struct mtd_info *mtd,
>>  					     struct nand_chip *chip,
>>  					     uint32_t offs, uint32_t len,
>> --
>> 1.6.0.4
>
> _______________________________________________
> Davinci-linux-open-source mailing list
> Davinci-linux-open-source@linux.davincidsp.com
> http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
