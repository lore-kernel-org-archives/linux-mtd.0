Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cf6q2-0002E9-Sw
 for linux-mtd@lists.infradead.org; Sat, 18 Feb 2017 15:22:21 +0000
Received: by mail-wm0-x243.google.com with SMTP id c85so7201614wmi.1
 for <linux-mtd@lists.infradead.org>; Sat, 18 Feb 2017 07:21:57 -0800 (PST)
Subject: Re: [PATCH V2, 2/2] mtd: nand: brcmnand: Check flash #WP pin status
 before nand erase/program
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1487270812-6882-1-git-send-email-kdasu.kdev@gmail.com>
 <1487270812-6882-2-git-send-email-kdasu.kdev@gmail.com>
 <1c718482-719a-190b-8e86-ca21f6bf330f@gmail.com>
 <20170218090327.76954604@bbrezillon>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, richard@nod.at, bcm-kernel-feedback-list@broadcom.com,
 cyrille.pitchen@atmel.com, computersforpeace@gmail.com, dwmw2@infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d0397839-fcb5-90d4-3c7a-cf3a24417c69@gmail.com>
Date: Sat, 18 Feb 2017 16:21:54 +0100
MIME-Version: 1.0
In-Reply-To: <20170218090327.76954604@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/18/2017 09:03 AM, Boris Brezillon wrote:
> On Fri, 17 Feb 2017 22:38:04 +0100
> Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> On 02/16/2017 07:46 PM, Kamal Dasu wrote:
>>> brcmnand controller v6.x and v7.x lets driver to enable disable #WP pin
>>> via NAND_WP bit in CS_SELECT register. Driver implementation assumes that
>>> setting/resetting the bit would assert/de-assert  #WP pin instantaneously
>>> from the flash part's perspective, and was proceeding to erase/program
>>> without verifying flash status byte for protection bit. In rigorous
>>> testing this was causing rare data corruptions with erase and/or
>>> subsequent programming. To fix this added verification logic to
>>> brcmandn_wp_set() by reading  flash status and verifying protection bit
>>> indicating #WP pin status.  The new logic makes sure controller as well
>>> as the flash is ready to accept commands.
>>>
>>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>>> ---
>>>  drivers/mtd/nand/brcmnand/brcmnand.c | 53 ++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 51 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>>> index c7c4efe..2f082a3 100644
>>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>>> @@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
>>>  #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
>>>  #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
>>>  
>>> +#define FLASH_RDY	(NAND_STATUS_READY)  
>>
>> Drop extra parenthesis
>>
>>> +#define NAND_CTRL_RDY	(INTFC_CTLR_READY | INTFC_FLASH_READY)
>>> +
>>>  /* Controller feature flags */
>>>  enum {
>>>  	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
>>> @@ -765,12 +768,57 @@ enum {
>>>  	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
>>>  };
>>>  
>>> -static int brcmnand_set_wp(struct brcmnand_host *host, int en)
>>> +static void bcmnand_ctrl_busy_poll(struct brcmnand_controller *ctrl, u32 mask)
>>> +{
>>> +	unsigned long timeout = jiffies + msecs_to_jiffies(200);
>>> +
>>> +	while ((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) & mask) !=
>>> +		mask) {  
>>
>> Ewww, make this into something like ...
>>
>> while (true) { / for (;;) {
>>  reg = read.....
>>  if ((reg & mask) == mask)
>>    ...
>>  if (time ....)
>>    dev_warn...
>>  cpu_relax();
>> }
>>
>> But then again, there's the readx_poll_timeout() , which seems like
>> exactly the thing you implemented here .
> 
> I agree that using readl_poll_timeout() would be better, but it's not
> so simple (see brcmnand_read_reg() and brcmnand_readl()
> implementations).

I admit I didn't look at how those are implemented.

-- 
Best regards,
Marek Vasut
