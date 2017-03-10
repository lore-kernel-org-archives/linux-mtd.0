Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmCY0-0001OS-Ap
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 04:53:03 +0000
Received: by mail-wm0-x241.google.com with SMTP id u132so448471wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 20:52:39 -0800 (PST)
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
To: Moritz Fischer <moritz.fischer@ettus.com>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
 <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw@mail.gmail.com>
Cc: Alban <albeu@free.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Devicetree List <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <eb8f93fd-0534-2b91-7fec-7d40ddf7b8cb@gmail.com>
Date: Fri, 10 Mar 2017 05:52:36 +0100
MIME-Version: 1.0
In-Reply-To: <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/10/2017 05:06 AM, Moritz Fischer wrote:
> On Thu, Mar 9, 2017 at 7:17 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 03/07/2017 09:26 AM, Alban wrote:
>>> Config data for drivers, like MAC addresses, is often stored in MTD.
>>> Add a binding that define how such data storage can be represented in
>>> device tree.
>>>
>>> Signed-off-by: Alban <albeu@free.fr>
>>> ---
>>> Changelog:
>>> v2: * Added a "Required properties" section with the nvmem-provider
>>>       property
>>> ---
>>>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>> new file mode 100644
>>> index 0000000..8ed25e6
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>> @@ -0,0 +1,33 @@
>>> += NVMEM in MTD =
>>> +
>>> +Config data for drivers, like MAC addresses, is often stored in MTD.
>>> +This binding define how such data storage can be represented in device tree.
>>> +
>>> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
>>> +property to their node. Data cells can then be defined as child nodes
>>> +of the partition as defined in nvmem.txt.
>>
>> Why don't we just read the data from MTD and be done with it ? What's
>> the benefit of complicating things by using nvmem ?
> 
> Well because usually stuff like MAC addresses etc are stored in eeproms.

But eeproms are already supported, see drivers/misc/ .

> This gives a nice abstraction with making them both look like nvmem (that was my
> reasoning back then when I submitted a patch to support the OTP part in a
> SPI NOR part.

Hm, I am confused here, we're mixing SPI NOR, EEPROMs and OTP devices here.

-- 
Best regards,
Marek Vasut
