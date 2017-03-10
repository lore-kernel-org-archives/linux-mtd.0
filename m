Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmEzB-0002zE-2y
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 07:29:15 +0000
Received: by mail-wm0-x243.google.com with SMTP id u132so846671wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 23:28:50 -0800 (PST)
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
 <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw@mail.gmail.com>
 <eb8f93fd-0534-2b91-7fec-7d40ddf7b8cb@gmail.com>
 <20170310063810.2efkb6j2kdgadalv@lukather>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Alban <albeu@free.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Devicetree List <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <26333808-3740-31ca-12ee-e4c6afc9ef29@gmail.com>
Date: Fri, 10 Mar 2017 08:28:47 +0100
MIME-Version: 1.0
In-Reply-To: <20170310063810.2efkb6j2kdgadalv@lukather>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/10/2017 07:38 AM, Maxime Ripard wrote:
> Hi Marek,
> 
> On Fri, Mar 10, 2017 at 05:52:36AM +0100, Marek Vasut wrote:
>> On 03/10/2017 05:06 AM, Moritz Fischer wrote:
>>> On Thu, Mar 9, 2017 at 7:17 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 03/07/2017 09:26 AM, Alban wrote:
>>>>> Config data for drivers, like MAC addresses, is often stored in MTD.
>>>>> Add a binding that define how such data storage can be represented in
>>>>> device tree.
>>>>>
>>>>> Signed-off-by: Alban <albeu@free.fr>
>>>>> ---
>>>>> Changelog:
>>>>> v2: * Added a "Required properties" section with the nvmem-provider
>>>>>       property
>>>>> ---
>>>>>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>>>>>  1 file changed, 33 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>>>> new file mode 100644
>>>>> index 0000000..8ed25e6
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>>>> @@ -0,0 +1,33 @@
>>>>> += NVMEM in MTD =
>>>>> +
>>>>> +Config data for drivers, like MAC addresses, is often stored in MTD.
>>>>> +This binding define how such data storage can be represented in device tree.
>>>>> +
>>>>> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
>>>>> +property to their node. Data cells can then be defined as child nodes
>>>>> +of the partition as defined in nvmem.txt.
>>>>
>>>> Why don't we just read the data from MTD and be done with it ? What's
>>>> the benefit of complicating things by using nvmem ?
>>>
>>> Well because usually stuff like MAC addresses etc are stored in eeproms.
>>
>> But eeproms are already supported, see drivers/misc/ .
> 
> This the old, free for all, way to support eeproms. We have a proper
> framework for them now, and it's called nvmem.

Ha, so that's why this patchset, I see. Thanks for clarifying.

-- 
Best regards,
Marek Vasut
