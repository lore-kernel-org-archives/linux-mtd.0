Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqvzT-00008s-N1
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 04:36:08 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 222EE205B8
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 04:35:46 +0000 (UTC)
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2938620711
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 04:35:44 +0000 (UTC)
Received: by ykek133 with SMTP id k133so24309798yke.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 21:35:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151011200402.GE3696@localhost>
References: <cover.1439911625.git.hramrach@gmail.com>
 <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Oct 2015 23:35:24 -0500
Message-ID: <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding
 specification
To: Brian Norris <computersforpeace@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 11, 2015 at 3:04 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi DT maintainers,
>
> It's a bit hypocritical of me, since I've been a slow reviewer as well,
> but... can we get some review on this one? Usually, I'm comfortable
> taking driver DT bindings without your review, but this one is a bit
> more generic and is more far-reaching than the average driver.

Sorry, missed this one. This would be a good one to send to
devicetree-spec to BTW.

> I'm not a big fan of this change, and I don't quite understand why the
> bus driver (the SPI bus, which is a level up from the SPI device / MTD
> node) can specify its grandchildren (see spi-samsung.txt). But given the

That's just an example. I just would change it.

> constraints, I think Michal's solution is OK. And I do agree that MTD's
> ofpart should be bit more specific.
>
> Anyway, a quick look and an Ack/Nak would be appreciated.

Looks fine to me:

Acked-by: Rob Herring <robh@kernel.org>

>
> Thanks,
> Brian
>
> On Tue, Aug 18, 2015 at 03:34:08PM -0000, Michal Suchanek wrote:
>> To avoid conflict with other drivers using subnodes of the mtd device
>> create only one ofpart-specific node rather than any number of
>> arbitrary partition subnodes.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> ---
>> v3:
>>
>>  - rename DT node ofpart -> partitions
>> ---
>>  .../devicetree/bindings/mtd/partition.txt          | 68 +++++++++++++---------
>>  1 file changed, 40 insertions(+), 28 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
>> index 8e5557d..8c2aff7 100644
>> --- a/Documentation/devicetree/bindings/mtd/partition.txt
>> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
>> @@ -4,10 +4,16 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
>>  on platforms which have strong conventions about which portions of a flash are
>>  used for what purposes, but which don't use an on-flash partition table such
>>  as RedBoot.
>> +
>> +The partition table should be partitions subnode of the mtd node. Partitions are
>> +defined in subnodes of the partitions node.
>> +
>> +For backwards compatibility partitions as direct subnodes of the mtd device are
>> +supported. This use is discouraged.
>>  NOTE: if the sub-node has a compatible string, then it is not a partition.
>>
>> -#address-cells & #size-cells must both be present in the mtd device. There are
>> -two valid values for both:
>> +#address-cells & #size-cells must both be present in the partitions subnode of the
>> +mtd device. There are two valid values for both:
>>  <1>: for partitions that require a single 32-bit cell to represent their
>>       size/address (aka the value is below 4 GiB)
>>  <2>: for partitions that require two 32-bit cells to represent their
>> @@ -28,44 +34,50 @@ Examples:
>>
>>
>>  flash@0 {
>> -     #address-cells = <1>;
>> -     #size-cells = <1>;
>> +     partitions {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>>
>> -     partition@0 {
>> -             label = "u-boot";
>> -             reg = <0x0000000 0x100000>;
>> -             read-only;
>> -     };
>> +             partition@0 {
>> +                     label = "u-boot";
>> +                     reg = <0x0000000 0x100000>;
>> +                     read-only;
>> +             };
>>
>> -     uimage@100000 {
>> -             reg = <0x0100000 0x200000>;
>> +             uimage@100000 {
>> +                     reg = <0x0100000 0x200000>;
>> +             };
>>       };
>>  };
>>
>>  flash@1 {
>> -     #address-cells = <1>;
>> -     #size-cells = <2>;
>> +     partitions {
>> +             #address-cells = <1>;
>> +             #size-cells = <2>;
>>
>> -     /* a 4 GiB partition */
>> -     partition@0 {
>> -             label = "filesystem";
>> -             reg = <0x00000000 0x1 0x00000000>;
>> +             /* a 4 GiB partition */
>> +             partition@0 {
>> +                     label = "filesystem";
>> +                     reg = <0x00000000 0x1 0x00000000>;
>> +             };
>>       };
>>  };
>>
>>  flash@2 {
>> -     #address-cells = <2>;
>> -     #size-cells = <2>;
>> +     partitions {
>> +             #address-cells = <2>;
>> +             #size-cells = <2>;
>>
>> -     /* an 8 GiB partition */
>> -     partition@0 {
>> -             label = "filesystem #1";
>> -             reg = <0x0 0x00000000 0x2 0x00000000>;
>> -     };
>> +             /* an 8 GiB partition */
>> +             partition@0 {
>> +                     label = "filesystem #1";
>> +                     reg = <0x0 0x00000000 0x2 0x00000000>;
>> +             };
>>
>> -     /* a 4 GiB partition */
>> -     partition@200000000 {
>> -             label = "filesystem #2";
>> -             reg = <0x2 0x00000000 0x1 0x00000000>;
>> +             /* a 4 GiB partition */
>> +             partition@200000000 {
>> +                     label = "filesystem #2";
>> +                     reg = <0x2 0x00000000 0x1 0x00000000>;
>> +             };
>>       };
>>  };
>> --
>> 2.1.4
>>
