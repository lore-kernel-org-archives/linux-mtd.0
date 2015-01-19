Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YD9dN-000365-L7
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 10:32:38 +0000
Message-ID: <54BCDD2A.90208@codeaurora.org>
Date: Mon, 19 Jan 2015 16:02:10 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: Add EBI2 clocks for IPQ806x
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1421419702-17812-2-git-send-email-architt@codeaurora.org>
 <54B9890C.2080506@codeaurora.org>
In-Reply-To: <54B9890C.2080506@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: agross@codeaurora.org, linux-kernel@vger.kernel.org, galak@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 01/17/2015 03:26 AM, Stephen Boyd wrote:
> On 01/16/2015 06:48 AM, Archit Taneja wrote:
>> The NAND controller within EBI2 requires EBI2_CLK and EBI2_ALWAYS_ON_CLK clocks.
>> Create structs for these clocks so that they can be used by the NAND controller
>> driver. Add an entry for EBI2_AON_CLK in the gcc-ipq806x DT binding document.
>>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>
> Looks ok. I couldn't find this used in the downstream sources though.
> Can you point me to it? I'm mostly worried that this is a shared
> resource that never should be turned off, so exposing it to drivers may
> not be the right idea.

I'll share the sources.

>
>> +static struct clk_branch ebi2_aon_clk = {
>> +	.hwcg_reg = 0x3b00,
>> +	.hwcg_bit = 6,
>> +	.halt_reg = 0x2fcc,
>> +	.halt_bit = 0,
>> +	.clkr = {
>> +		.enable_reg = 0x3b00,
>> +		.enable_mask = BIT(8),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "ebi2_always_on_clk",
>>
>
> Can this be ebi2_aon_clk to match the macro?
>

I'll fix this.

Thanks,
Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
