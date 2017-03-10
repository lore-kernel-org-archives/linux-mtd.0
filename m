Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmOcv-0005mW-DA
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 17:46:55 +0000
Received: by mail-qk0-x241.google.com with SMTP id n141so28949902qke.3
 for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2017 09:46:33 -0800 (PST)
Subject: Re: [PATCH V6, 1/1] mtd: nand: brcmnand: Check flash #WP pin status
 before nand erase/program
To: Marek Vasut <marek.vasut@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-mtd@lists.infradead.org
References: <1488575813-12660-1-git-send-email-kdasu.kdev@gmail.com>
 <1488575813-12660-2-git-send-email-kdasu.kdev@gmail.com>
 <25484b94-341f-300d-474e-a272f249f0a2@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <74ac0886-769c-feab-836d-f782535d8592@gmail.com>
Date: Fri, 10 Mar 2017 09:46:29 -0800
MIME-Version: 1.0
In-Reply-To: <25484b94-341f-300d-474e-a272f249f0a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/10/2017 05:22 AM, Marek Vasut wrote:
> On 03/03/2017 10:16 PM, Kamal Dasu wrote:
>> On brcmnand controller v6.x and v7.x, the #WP pin is controlled through
>> the NAND_WP bit in CS_SELECT register.
>>
>> The driver currently assumes that toggling the #WP pin is
>> instantaneously enabling/disabling write-protection, but it actually
>> takes some time to propagate the new state to the internal NAND chip
>> logic. This behavior is sometime causing data corruptions when an
>> erase/program operation is executed before write-protection has really
>> been disabled.
>>
>> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 61 ++++++++++++++++++++++++++++++++++--
>>  1 file changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 42ebd73..7419c5c 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
>>  #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
>>  #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
>>  
>> +#define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
>> +#define NAND_POLL_STATUS_TIMEOUT_MS	100
>> +
>>  /* Controller feature flags */
>>  enum {
>>  	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
>> @@ -765,6 +768,31 @@ enum {
>>  	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
>>  };
>>  
>> +static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
>> +				    u32 mask, u32 expected_val,
>> +				    unsigned long timeout_ms)
>> +{
>> +	unsigned long limit;
>> +	u32 val;
>> +
>> +	if (!timeout_ms)
>> +		timeout_ms = NAND_POLL_STATUS_TIMEOUT_MS;
>> +
>> +	limit = jiffies + msecs_to_jiffies(timeout_ms);
>> +	do {
>> +		val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>> +		if ((val & mask) == expected_val)
>> +			return 0;
>> +
>> +		cpu_relax();
>> +	} while (time_after(limit, jiffies));
>> +
>> +	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
>> +		 expected_val, val & mask);
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>>  static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
>>  {
>>  	u32 val = en ? CS_SELECT_NAND_WP : 0;
>> @@ -1024,12 +1052,39 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
>>  
>>  	if ((ctrl->features & BRCMNAND_HAS_WP) && wp_on == 1) {
>>  		static int old_wp = -1;
> 
> Unrelated to this patch, but this static variable should be moved to
> driver's private data instead.

Does that mean you are okay with this patch as-is as a fix which can be
backported and code refactoring can be submitted as follow up patches?
-- 
Florian
