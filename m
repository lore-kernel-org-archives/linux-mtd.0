Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4FDe-0000D4-FB
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 21:45:47 +0000
Message-ID: <565F662A.2060903@broadcom.com>
Date: Wed, 2 Dec 2015 13:44:10 -0800
From: Florian Fainelli <fainelli@broadcom.com>
MIME-Version: 1.0
To: Simon Arlott <simon@fire.lp0.eu>, Florian Fainelli <f.fainelli@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
CC: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Pawel Moll
 <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Jonas
 Gorski" <jogo@openwrt.org>, bcm-kernel-feedback-list
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
 <CAGVrzcZa2LNcajdnZHgZ2j+2Yj0_0a-7VmtXoBtWwFK2C02CyA@mail.gmail.com>
 <565F4E63.3030100@simon.arlott.org.uk>
In-Reply-To: <565F4E63.3030100@simon.arlott.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/12/15 12:02, Simon Arlott wrote:
> On 02/12/15 19:38, Florian Fainelli wrote:
>> 2015-12-02 11:05 GMT-08:00 Brian Norris <computersforpeace@gmail.com>:
>>> + Broadcom list + Kamal
>>>
>>> On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
>>>> Add device tree binding for NAND on the BCM63268.
>>>>
>>>> The BCM63268 has a NAND interrupt register with combined status and enable
>>>> registers.
>>>>
>>>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>>>> ---
>>>>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
>>>>  1 file changed, 35 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> index 4ff7128..f2a71c8 100644
>>>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> @@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
>>>>         and enable registers
>>>>       - reg-names: (required) "nand-int-base"
>>>>
>>>> +   * "brcm,nand-bcm63268"
>>>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>>>
>>> Looks like you're aiming to support bcm63168? Is bcm63268 the first
>>> chip to include this style of register then? The numbering seems
>>> backwards, but that may just be reality.
>>
>> 6362 (NAND rev 2.1, ann. Sep 8, 2009), 6368 (v0.1?!?, ann. Jan 7,
>> 2009) and 6328 (v2.1, can't find release date) are earlier chips that
>> have an identical combined interrupt enable + status register and a
>> NAND controller within the same 32-bits word, so these would qualify
>> as a better compatible string for this specific addition integration
>> stub here. I would gowith 6368 here then?
>>
> 
> I could change it to 6368 but there's no documented NAND_INTR_BASE for
> it. Only the 63268 and 6818 have a #define for NAND_INTR_BASE.
> 

It looks exactly the same as the 63268 layout, and double checking, this
appears to be a v2.1 controller as well, it was not just properly
documented as such.
-- 
Florian
