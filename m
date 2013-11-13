Message-ID: <52835597.2010802@atmel.com>
Date: Wed, 13 Nov 2013 11:33:59 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix bug driver will in a dead lock if
 no nand detected
References: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
 <20131107083932.GJ3805@norris.computersforpeace.net>
 <527B6ADF.1090201@atmel.com>
 <20131107180942.GU20061@ld-irv-0074.broadcom.com> <527C5E96.40805@atmel.com>
 <20131113001022.GC9468@ld-irv-0074.broadcom.com> <5282F164.3040509@atmel.com>
 <20131113084418.GA16999@norris.computersforpeace.net>
In-Reply-To: <20131113084418.GA16999@norris.computersforpeace.net>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/11/2013 09:44, Brian Norris :
> Hi Josh,
>
> On Wed, Nov 13, 2013 at 11:26:28AM +0800, Josh Wu wrote:
>> On 11/13/2013 8:10 AM, Brian Norris wrote:
>>> On Fri, Nov 08, 2013 at 11:46:30AM +0800, Josh Wu wrote:
>>>> On 11/8/2013 2:09 AM, Brian Norris wrote:
>>>>>    if (nand_nfc.is_initialized) {
>>>>>      ...
>>>> Yes, exactly.
>>>> And the NAND probe will also load the NFC device before it reach
>>>> above check code.
>>> No, it loads the *driver*, not the *device*. I'm not familiar with the
>>> driver core guarantees, but I don't think you can guarantee that just
>>> because a driver was registered before another that the corresponding
>>> devices will be probed in that order. Or are you relying on the
>>> dependencies captured by device tree? (I don't think even the
>>> parent/child dependency between NAND/NFC gives you enough.)
>>
>> I put  more code here to make it clearer:
>>
>> arch/arm/boot/dts/sama5d3.dtsi:
>> nand0: nand@60000000 {
>>              compatible = "atmel,at91rm9200-nand";
>>              ...
>>              ranges;
>>              ...
>>              nfc@70000000 {
>>                  compatible = "atmel,sama5d3-nfc";
>>                  ...
>>              };
>>          };
>
> Ah, so you're focusing purely on the device tree support? It seems this
> driver also supports traditional platform devices, but nobody uses NFC
> without DT? That explains some things.

Absolutely: the NFC is only available on SoC that are pure-DT.

The traditional platform device support is for older SoC that can use 
this driver but do not have the NFC.

I let Josh continue the discussion on the registration topic.

[..]

Bye,
-- 
Nicolas Ferre
