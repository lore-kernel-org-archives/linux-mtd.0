Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL849-0000MJ-FO
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 14:15:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 22 May 2018 19:44:54 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 09/14] mtd: rawnand: qcom: modify write_oob to remove
 read codeword part
In-Reply-To: <20180522120231.5dd32f8b@xps13>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-10-git-send-email-absahu@codeaurora.org>
 <20180522120231.5dd32f8b@xps13>
Message-ID: <ec5063fab29afb218e7de436384b8b43@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-05-22 15:32, Miquel Raynal wrote:
> Hi Abhishek,
> 
> Some nitpicking below.
> 
> On Thu,  3 May 2018 17:50:36 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> QCOM NAND layout protect available OOB data bytes with ECC also so
> 
>            ^controller
> 
>> when ecc->write_oob (qcom_nandc_write_oob) is being called then it
> 
> You can just state "->write_oob()"
> 
>> can't update just OOB bytes. Currently, it first reads the last
>> codeword which includes old OOB bytes. Then it updates the old OOB
>> bytes with new one and then again writes the codeword back.
> 
>                  ones?
> 
>> The reading codeword is unnecessary since all the other bytes
>> should be 0xff only.
> 
>                                       since the user is responsible to
> have these bytes cleared to 0xFF.
> 
>> 
>> This patch removes the read part and updates the oob bytes with
> 
> s/oob/OOB/
> 
>> all other data bytes as 0xff.
> 
> The end of the sentence is not clear for me. Do you mean that padding
> with 0xFF is realized before write?
> 
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>> * Changes from v1:
>> 
>>  NEW CHANGE
>> 
>>  drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++------------
>>  1 file changed, 5 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c 
>> b/drivers/mtd/nand/raw/qcom_nandc.c
>> index 61d0e7d..f85d8ab 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -2067,10 +2067,9 @@ static int qcom_nandc_write_page_raw(struct 
>> mtd_info *mtd,
>>   * implements ecc->write_oob()
>>   *
>>   * the NAND controller cannot write only data or only oob within a 
>> codeword,
> 
> s/oob/OOB/
> 
> Remove the trailing ','
> 
>> - * since ecc is calculated for the combined codeword. we first copy 
>> the
>> - * entire contents for the last codeword(data + oob), replace the old 
>> oob
>> - * with the new one in chip->oob_poi, and then write the entire 
>> codeword.
>> - * this read-copy-write operation results in a slight performance 
>> loss.
>> + * since ecc is calculated for the combined codeword. So make all the 
>> data
> 
> s/ecc/ECC/
> 
>> + * bytes as 0xff and update the oob from chip->oob_poi, and then 
>> write
>> + * the entire codeword again.
> 
> What about "Pad the data area with OxFF before writing."?
> 
>>   */
>>  static int qcom_nandc_write_oob(struct mtd_info *mtd, struct 
>> nand_chip *chip,
>>  				int page)
>> @@ -2082,20 +2081,14 @@ static int qcom_nandc_write_oob(struct 
>> mtd_info *mtd, struct nand_chip *chip,
>>  	int data_size, oob_size;
>>  	int ret;
>> 
>> -	host->use_ecc = true;
>> -
>> -	clear_bam_transaction(nandc);
>> -	ret = copy_last_cw(host, page);
>> -	if (ret)
>> -		return ret;
>> -
>> -	clear_read_regs(nandc);
>>  	clear_bam_transaction(nandc);
>> 
>>  	/* calculate the data and oob size for the last codeword/step */
>>  	data_size = ecc->size - ((ecc->steps - 1) << 2);
>>  	oob_size = mtd->oobavail;
>> +	host->use_ecc = true;
> 
> You don't need to move this line here, do you?
> 
>> 
>> +	memset(nandc->data_buffer, 0xff, host->cw_data);
>>  	/* override new oob content to last codeword */
>>  	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, 
>> oob,
>>  				    0, mtd->oobavail);
> 
> 
> Once fixed, you can add my:

  Thanks Miquel.
  I will fix all these and update the patch.

  Regards,
  Abhishek

> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Thanks,
> Miquèl
