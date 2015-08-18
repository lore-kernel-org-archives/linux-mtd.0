Date: Tue, 18 Aug 2015 10:59:21 -0700
From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
To: Mathieu Olivari <mathieu@codeaurora.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com"
 <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk"
 <linux@arm.linux.org.uk>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "agross@codeaurora.org" <agross@codeaurora.org>, "sboyd@codeaurora.org"
 <sboyd@codeaurora.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] ARM: qcom: add SFPB nodes to IPQ806x dts
Message-ID: <20150818175921.GT13472@usrtlx11787.corpusers.net>
References: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
 <1439855266-26242-2-git-send-email-mathieu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1439855266-26242-2-git-send-email-mathieu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon 17 Aug 16:47 PDT 2015, Mathieu Olivari wrote:

> Add one new node to the ipq806x.dtsi file to declare & register the
> hardware spinlock devices. This mechanism is required to be used by
> other drivers such as SMEM.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 9f727d8..8d366ae 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -329,5 +329,16 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		sfpb_mutex_block: syscon@1200600 {
> +			compatible = "syscon";
> +			reg = <0x01200600 0x100>;

I have this block listed to start at 0x1200000 and used 0x604 as offset
when testing this. In my docs there's nothing in those first 0x600 bytes
though, so this works fine for me.

> +		};
> +	};
> +
> +	sfpb_mutex: sfpb-mutex {
> +		compatible = "qcom,sfpb-mutex";
> +		syscon = <&sfpb_mutex_block 4 4>;
> +
> +		#hwlock-cells = <1>;
>  	};
>  };

Regards,
Bjorn
