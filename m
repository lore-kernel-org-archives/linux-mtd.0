Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmBp2-0003nf-7Y
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 04:06:34 +0000
Received: by mail-qk0-x22e.google.com with SMTP id 1so150939042qkl.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 20:06:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Thu, 9 Mar 2017 20:06:09 -0800
Message-ID: <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Alban <albeu@free.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 9, 2017 at 7:17 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 03/07/2017 09:26 AM, Alban wrote:
>> Config data for drivers, like MAC addresses, is often stored in MTD.
>> Add a binding that define how such data storage can be represented in
>> device tree.
>>
>> Signed-off-by: Alban <albeu@free.fr>
>> ---
>> Changelog:
>> v2: * Added a "Required properties" section with the nvmem-provider
>>       property
>> ---
>>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> new file mode 100644
>> index 0000000..8ed25e6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> @@ -0,0 +1,33 @@
>> += NVMEM in MTD =
>> +
>> +Config data for drivers, like MAC addresses, is often stored in MTD.
>> +This binding define how such data storage can be represented in device tree.
>> +
>> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
>> +property to their node. Data cells can then be defined as child nodes
>> +of the partition as defined in nvmem.txt.
>
> Why don't we just read the data from MTD and be done with it ? What's
> the benefit of complicating things by using nvmem ?

Well because usually stuff like MAC addresses etc are stored in eeproms.
This gives a nice abstraction with making them both look like nvmem (that was my
reasoning back then when I submitted a patch to support the OTP part in a
SPI NOR part.

>> +Required properties:
>> +nvmem-provider:      Indicate that the device should be registered as
>> +             NVMEM provider
>> +
>> +Example:
>> +
>> +     flash@0 {
>> +             ...
>> +
>> +             partition@2 {
>> +                     label = "art";
>> +                     reg = <0x7F0000 0x010000>;
>> +                     read-only;
>> +
>> +                     nvmem-provider;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +
>> +                     eeprom@1000 {
>> +                             label = "wmac-eeprom";
>> +                             reg = <0x1000 0x1000>;
>> +                     };
>> +             };
>> +     };
>>
>
>
> --
> Best regards,
> Marek Vasut

Cheers,
Moritz
