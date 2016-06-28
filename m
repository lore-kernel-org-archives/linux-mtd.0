Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bI0PB-00038x-4s
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 21:18:49 +0000
Received: by mail-qk0-x241.google.com with SMTP id b136so6005547qkg.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2016 14:18:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160628205551.GI3737@rob-hp-laptop>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
 <1466804411-19874-3-git-send-email-han.xu@nxp.com>
 <20160628205551.GI3737@rob-hp-laptop>
From: Han Xu <xhnjupt@gmail.com>
Date: Tue, 28 Jun 2016 16:18:27 -0500
Message-ID: <CA+EcR21hRgt6veugwf8oasZkRD6DEeMtBXGoJa+Z-aY2eJwBRw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] Documentation: dt: mtd: gpmi: document the clocks
 and clock-names in DT property
To: Rob Herring <robh@kernel.org>
Cc: Han Xu <han.xu@nxp.com>, mark.rutland@arm.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2016 at 3:55 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jun 24, 2016 at 04:40:07PM -0500, Han Xu wrote:
>> add the clocks and clock-names in DT property, gpmi-io clock is
>> mandatory for all platforms, but some platforms, such as i.MX6Q may
>> need more extra clocks for submodules. More details please refer to the
>> SoC reference manual.
>>
>> Signed-off-by: Han Xu <han.xu@nxp.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>> index d02acaf..a2fd034 100644
>> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
>> @@ -13,6 +13,13 @@ Required properties:
>>      and GPMI DMA channel ID.
>>      Refer to dma.txt and fsl-mxs-dma.txt for details.
>>    - dma-names: Must be "rx-tx".
>> +  - clocks : The clocks needed by the gpmi controller. This field varies
>> +    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
>> +    need several extra clocks, such as i.MX6 series, which requires "gpmi_apb,
>> +    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules, while i.MX7 only
>> +    need gpmi_bch_apb. Please refer to the HW design manual.
>> +  - clock-names : the name of the clocks, please refer to the HW design
>> +    manual.
>
> No please list the names here (I assume what is above?). Also need to
> specify the order of the clocks. It would be clearest if you list things
> by exact compatible strings.

These are the exact clocks needed by i.MX6 and i.MX7. Order doesn't matter.

>
> Rob
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU
