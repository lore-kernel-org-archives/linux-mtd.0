Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGxSx-00080z-Hp
 for linux-mtd@lists.infradead.org; Thu, 29 Jan 2015 22:21:35 +0000
Message-ID: <54CAB259.8090704@codeaurora.org>
Date: Thu, 29 Jan 2015 14:21:13 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Archit Taneja <architt@codeaurora.org>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: Add EBI2 clocks for IPQ806x
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1421419702-17812-2-git-send-email-architt@codeaurora.org>
In-Reply-To: <1421419702-17812-2-git-send-email-architt@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: galak@codeaurora.org, linux-kernel@vger.kernel.org, agross@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/16/15 06:48, Archit Taneja wrote:
> +
> +static struct clk_branch ebi2_aon_clk = {
> +	.hwcg_reg = 0x3b00,
> +	.hwcg_bit = 6,

It looks like these bits only apply to ebi2_clk, and not ebi2_aon_clk,
so these two lines should be dropped.

> +	.halt_reg = 0x2fcc,
> +	.halt_bit = 0,
> +	.clkr = {
> +		.enable_reg = 0x3b00,
> +		.enable_mask = BIT(8),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "ebi2_always_on_clk",
> +			.ops = &clk_branch_ops,
> +			.flags = CLK_IS_ROOT,
> +		},
> +	},
> +};
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
