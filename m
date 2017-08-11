Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dg5ps-0007MB-4J
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 09:02:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Aug 2017 14:32:05 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v3 18/20] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND
 documentation
In-Reply-To: <20170810203009.sree54ddecbnymep@rob-hp-laptop>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-19-git-send-email-absahu@codeaurora.org>
 <20170810203009.sree54ddecbnymep@rob-hp-laptop>
Message-ID: <fa0864288be56f747b63396f46deb482@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-08-11 02:00, Rob Herring wrote:
> On Sat, Aug 05, 2017 at 09:49:56PM +0530, Abhishek Sahu wrote:
>> Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
>> which uses BAM DMA Engine.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt 
>> b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> index d93b952..8dfa543 100644
>> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> @@ -6,6 +6,8 @@ Required properties:
>>  			    SoC and it uses ADM DMA
>>      * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being 
>> used in
>>                              IPQ4019 SoC and it uses BAM DMA
>> +    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being 
>> used in
>> +                            IPQ8074 SoC and it uses BAM DMA
>> 
>>  - reg:			MMIO address range
>>  - clocks:		must contain core clock and always on clock
>> @@ -97,7 +99,7 @@ nand-controller@1ac00000 {
>>  };
>> 
>>  nand-controller@79b0000 {
>> -	compatible = "qcom,ipq4019-nand";
>> +	compatible = "qcom,ipq4019-nand", "qcom,ipq8074-nand";
> 
> The order here should be reversed as 8074 is the newer one. And if 4019
> is the fallback compatible, that needs to be documented above.
> 

  Thanks Rob for review.

  This is not fallback compatible. I checked the other device tree
  binding examples and it seems, we don't have to add every
  similar compatible string in example. I will remove the
  qcom,ipq8074-nand from example which is causing confusion.

> Rob
