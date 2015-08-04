Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMdma-0001t1-9b
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:05:36 +0000
Message-ID: <55C0D4A6.9000207@codeaurora.org>
Date: Tue, 04 Aug 2015 20:35:10 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: Andy Gross <agross@codeaurora.org>
CC: linux-mtd@lists.infradead.org, dehrenberg@google.com,
 cernekee@gmail.com, computersforpeace@gmail.com,
 linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148
 platform
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-6-git-send-email-architt@codeaurora.org>
 <20150803193514.GA19772@qualcomm.com>
In-Reply-To: <20150803193514.GA19772@qualcomm.com>
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



On 8/4/2015 1:05 AM, Andy Gross wrote:
> On Mon, Aug 03, 2015 at 10:38:18AM +0530, Archit Taneja wrote:
>> Enable the NAND controller node on the AP148 platform. Provide pinmux
>> information.
>>
>> Cc: devicetree@vger.kernel.org
>>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>   arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 36 ++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
>> index 7f9ea50..2e88eff 100644
>> --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
>> +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
>> @@ -30,6 +30,28 @@
>>   					bias-none;
>>   				};
>>   			};
>> +			nand_pins: nand_pins {
>> +				mux {
>> +					pins = "gpio34", "gpio35", "gpio36",
>> +					       "gpio37", "gpio38", "gpio39",
>> +					       "gpio40", "gpio41", "gpio42",
>> +					       "gpio43", "gpio44", "gpio45",
>> +					       "gpio46", "gpio47";
>> +					function = "nand";
>> +					drive-strength = <10>;
>> +					bias-disable;
>> +				};
>> +				pullups {
>> +					pins = "gpio39";
>> +					bias-pull-up;
>> +				};
>> +				hold {
>> +					pins = "gpio40", "gpio41", "gpio42",
>> +					       "gpio43", "gpio44", "gpio45",
>> +					       "gpio46", "gpio47";
>> +					bias-bus-hold;
>
> Maybe split out the bias-disable into a separate set and remove that property
> from the mux.

I'll fix this.

Thanks,
Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
