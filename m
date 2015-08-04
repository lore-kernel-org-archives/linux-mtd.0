Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMgPV-00006H-Ri
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 17:53:58 +0000
Message-ID: <55C0FC1E.2060909@codeaurora.org>
Date: Tue, 04 Aug 2015 10:53:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Archit Taneja <architt@codeaurora.org>
CC: dehrenberg@google.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, agross@codeaurora.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v3 2/5] mtd: nand: Qualcomm NAND controller driver
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-3-git-send-email-architt@codeaurora.org>
 <20150803233852.GA20229@codeaurora.org> <55C0D483.7020405@codeaurora.org>
In-Reply-To: <55C0D483.7020405@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/04/2015 08:04 AM, Archit Taneja wrote:
>
> On 8/4/2015 5:08 AM, Stephen Boyd wrote:
>> I also wonder if this is little endian? It looks like some sort
>> of in memory register map that we point DMA to so that it can
>> write the values to the actual hardware registers?
>
> Yes, that's what it's supposed to do. I kept it in the form above
> so that updating the register map is as easy as assigning a new
> value to the member.
>
> I've tried to fix it for endianness in the diff below. I created
> some funcs to not flood the driver with cpu_to_le32() calls. Does
> it look okay?
>

Looks good.

>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>> [...]
>>> +
>>> +/*
>>> + * this is called after NAND_CMD_PAGEPROG and NAND_CMD_ERASE1 to 
>>> set our
>>> + * privately maintained status byte, this status byte can be read 
>>> after
>>> + * NAND_CMD_STATUS is called
>>> + */
>>> +static void parse_erase_write_errors(struct qcom_nandc_data *this, 
>>> int command)
>>> +{
>>> +    struct nand_chip *chip = &this->chip;
>>> +    struct nand_ecc_ctrl *ecc = &chip->ecc;
>>> +    int num_cw;
>>> +    int i;
>>> +
>>> +    num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
>>> +
>>> +    for (i = 0; i < num_cw; i++) {
>>> +        __le32 flash_status = le32_to_cpu(this->reg_read_buf[i]);
>>
>> So this doesn't need the i * 3 thing? If it does, perhaps
>> reg_read_buf needs to be of type struct read_stats instead.
>
> We just read back one register per codeword here, so we can't do
> the read_stats thing as before. I could read back the extra registers
> and discrading them, but I'd I'll leave that for later.

Ah right. Sounds like nothing to change then.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
