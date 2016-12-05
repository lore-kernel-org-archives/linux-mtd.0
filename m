Received: from mail-wj0-x243.google.com ([2a00:1450:400c:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDvwj-0000AR-2Z
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 16:16:54 +0000
Received: by mail-wj0-x243.google.com with SMTP id j10so12698256wjb.3
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2016 08:16:32 -0800 (PST)
Subject: Re: [PATCH v6 1/2] mtd: arasan: Add device tree binding documentation
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1480911066-26157-1-git-send-email-punnaia@xilinx.com>
 <74842d92-840d-a7c2-fb1b-ddab1ac2cf42@gmail.com>
 <20161205093630.650451d7@bbrezillon>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, michals@xilinx.com,
 kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <59e420fd-afb1-ab4c-44bd-ead160496bfd@gmail.com>
Date: Mon, 5 Dec 2016 17:11:36 +0100
MIME-Version: 1.0
In-Reply-To: <20161205093630.650451d7@bbrezillon>
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

On 12/05/2016 09:36 AM, Boris Brezillon wrote:
> On Mon, 5 Dec 2016 05:25:54 +0100
> Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> On 12/05/2016 05:11 AM, Punnaiah Choudary Kalluri wrote:
>>> This patch adds the dts binding document for arasan nand flash
>>> controller.
>>>
>>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> ---
>>> changes in v6:
>>> - Removed num-cs property
>>> - Separated nandchip from nand controller
>>> changes in v5:
>>> - None
>>> Changes in v4:
>>> - Added num-cs property
>>> - Added clock support
>>> Changes in v3:
>>> - None
>>> Changes in v2:
>>> - None
>>> ---
>>>  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38 ++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>> new file mode 100644
>>> index 0000000..dcbe7ad
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>> @@ -0,0 +1,38 @@
>>> +Arasan Nand Flash Controller with ONFI 3.1 support  
>>
>> Arasan NAND Flash ...
>>
>>> +Required properties:
>>> +- compatible: Should be "arasan,nfc-v3p10"  
>>
>> This v3p10 looks like version 3 patchlevel 10, but shouldn't we have
>> some fallback option which doesn't encode IP version in the compat
>> string ?
> 
> Not necessarily. Usually you define a generic compatible when you have
> other reliable means to detect the IP version (a version register for
> example).
> If you can't detect that at runtime, then providing only specific
> compatible strings is a good solution to avoid breaking the DT ABI.

Can we detect it at runtime with this hardware ?

>>
>> Also, shouldn't quirks be handled by DT props instead of effectively
>> encoding them into the compatible string ?
> 
> Well, from my experience, it's better to hide as much as possible
> behind the compatible. This way, if new quirks are needed for a
> specific revision, you can update the driver without having to change
> the DT.

That's a good point, yes.

-- 
Best regards,
Marek Vasut
