Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddKPt-0002k0-9s
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 18:00:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 03 Aug 2017 23:29:51 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 02/25] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
In-Reply-To: <20170803174713.5b5f5dde@bbrezillon>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
 <20170803174713.5b5f5dde@bbrezillon>
Message-ID: <6262dc2740eeb74288886a95e53286ca@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-08-03 21:17, Boris Brezillon wrote:
> On Wed, 19 Jul 2017 17:17:50 +0530
> Abhishek Sahu <absahu@codeaurora.org> wrote:
> 
>> The current driver is failing without complete bootchain since
>> NAND_DEV_CMD_VLD value is not valid.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  drivers/mtd/nand/qcom_nandc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index bc0408c..f3b995d 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -148,6 +148,9 @@
>>  #define	FETCH_ID			0xb
>>  #define	RESET_DEVICE			0xd
>> 
>> +/* Value for NAND_DEV_CMD_VLD */
>> +#define NAND_DEV_CMD_VLD_VAL		0x1d
> 
> Where does this 0x1d value comes from? Defining a macro instead of
> passing 0x1d does not change the fact that this is a magic value :-).
> 

  This register tells the NAND controller which commands are valid

  Bits    Meaning
  0       READ_START_VALID
  1       READ_STOP_VALID
  2       WRITE_START_VALID
  3       ERASE_START_VALID
  4       SEQ_READ_START_VLD

  The default power on value is
  0xe - ERASE_START_VALID | WRITE_START_VALID | READ_STOP_VALID

  It need to be programmed for
  0x1d - READ_START_VALID | WRITE_START_VALID | ERASE_START_VALID | 
SEQ_READ_START_VLD

  Read STOP command is not required in normal NAND reads so it need to be 
disabled.

  I will define the individual bits and will make this value with bits 
which will
  make this more clear.

>> +
>>  /*
>>   * the NAND controller performs reads/writes with ECC in 516 byte 
>> chunks.
>>   * the driver calls the chunks 'step' or 'codeword' interchangeably
>> @@ -1972,6 +1975,7 @@ static int qcom_nandc_setup(struct 
>> qcom_nand_controller *nandc)
>>  {
>>  	/* kill onenand */
>>  	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>> +	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>> 
>>  	/* enable ADM DMA */
>>  	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);

-- 
Abhishek Sahu
