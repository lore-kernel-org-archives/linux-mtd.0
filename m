Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNB8Y-0002M5-TQ
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 05:56:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 28 May 2018 11:25:54 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 05/16] mtd: rawnand: qcom: remove dt property
 nand-ecc-step-size
In-Reply-To: <20180526104259.210d96fc@xps13>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-6-git-send-email-absahu@codeaurora.org>
 <20180526104259.210d96fc@xps13>
Message-ID: <4b3a6c3b975f58ea68b7f0749b5fcd54@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-05-26 14:12, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Fri, 25 May 2018 17:51:33 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> QCOM NAND controller supports only one step size (512) so
>> nand-ecc-step-size DT property is redundant. This property
>> can be removed and ecc step size can be assigned with 512 value.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>> * Changes from v2:
>> 
>>  NEW CHANGE
>> 
>>   1. Removed the custom logic and used the helper fuction.
>>  drivers/mtd/nand/raw/qcom_nandc.c | 11 ++---------
>>  1 file changed, 2 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c 
>> b/drivers/mtd/nand/raw/qcom_nandc.c
>> index b554fb6..b538390 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -2325,15 +2325,8 @@ static int qcom_nand_host_setup(struct 
>> qcom_nand_host *host)
>>  	bool wide_bus;
>>  	int ecc_mode = 1;
>> 
>> -	/*
>> -	 * the controller requires each step consists of 512 bytes of data.
>> -	 * bail out if DT has populated a wrong step size.
>> -	 */
>> -	if (ecc->size != NANDC_STEP_SIZE) {
>> -		dev_err(nandc->dev, "invalid ecc size\n");
>> -		return -EINVAL;
>> -	}
>> -
>> +	/* controller only supports 512 bytes of data in each step */
> 
> "512 bytes data steps"
> 

  Thanks Miquel.
  Will update that.

  Regards,
  Abhishek

>> +	ecc->size = NANDC_STEP_SIZE;
>>  	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
>> 
>>  	if (ecc->strength >= 8) {
> 
> Once corrected:
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
