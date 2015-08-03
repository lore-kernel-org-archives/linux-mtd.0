Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMMot-00010x-4f
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:58:51 +0000
Date: Mon, 3 Aug 2015 13:58:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com,
 cernekee@gmail.com, computersforpeace@gmail.com,
 linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148
 platform
Message-ID: <20150803205829.GA21068@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-6-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438578498-32254-6-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/03, Archit Taneja wrote:
> @@ -93,5 +115,19 @@
>  		sata@29000000 {
>  			status = "ok";
>  		};
> +
> +		nand@1ac00000 {
> +			status = "ok";
> +
> +			pinctrl-0 = <&nand_pins>;
> +			pinctrl-names = "default";
> +
> +			nand-ecc-strength = <4>;
> +			nand-bus-width = <8>;
> +		};
>  	};
>  };
> +
> +&adm_dma {
> +	status = "ok";
> +};

I think the preference is to put the full path to the device in
the dts file and then have status = "ok". So please move this
into the soc node and give the correct offset, etc. like we've
done for other nodes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
