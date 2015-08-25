Message-ID: <55DC4192.6060906@atmel.com>
Date: Tue, 25 Aug 2015 12:21:06 +0200
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
MIME-Version: 1.0
To: Jonas Gorski <jogo@openwrt.org>, Marek Vasut <marex@denx.de>
CC: Ben Hutchings <ben@decadent.org.uk>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll
 <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <zajec5@gmail.com>,
 <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-spi@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Mark Brown
 <broonie@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>,
 "Kumar Gala" <galak@codeaurora.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Bean Huo (beanhuo)"
 <beanhuo@micron.com>
Subject: Re: [PATCH linux-next v4 5/5] mtd: atmel-quadspi: add driver for
 Atmel QSPI controller
References: <cover.1440410236.git.cyrille.pitchen@atmel.com>
 <201508241303.52066.marex@denx.de> <55DB4EA6.9090807@atmel.com>
 <201508241945.33577.marex@denx.de>
 <CAOiHx=kExyKAoGW4ciWHHxGNosNR0VdvHHrSqeo7RH1rNOXgig@mail.gmail.com>
In-Reply-To: <CAOiHx=kExyKAoGW4ciWHHxGNosNR0VdvHHrSqeo7RH1rNOXgig@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 25/08/2015 11:46, Jonas Gorski a écrit :
> On Mon, Aug 24, 2015 at 7:45 PM, Marek Vasut <marex@denx.de> wrote:
>> On Monday, August 24, 2015 at 07:04:38 PM, Cyrille Pitchen wrote:
>>> Hi Marek,
>>
>> Hi!
>>
>>> Le 24/08/2015 13:03, Marek Vasut a écrit :
>>>> On Monday, August 24, 2015 at 12:14:00 PM, Cyrille Pitchen wrote:
>>>>> This driver add support to the new Atmel QSPI controller embedded into
>>>>> sama5d2x SoCs. It expects a NOR memory to be connected to the QSPI
>>>>> controller.
>>
>> [...]
>>
>>>>> +  /* Compute address parameters */
>>>>> +  switch (cmd->enable.bits.address) {
>>>>> +  case 4:
>>>>> +          ifr |= QSPI_IFR_ADDRL;
>>>>> +          /*break;*/ /* fallback to the 24bit address case */
>>>>
>>>> What's this commented out bit of code for ? :-)
>>>
>>> I just wanted to stress out there was no missing "break;".
>>> I've reworded the comment to:
>>> /* No "break" on purpose: fallback to the 24bit address case. */
>>
>> Oh, the address is in bytes . I see, yes, it makes sense to be more
>> explicit here about the purpose of the fallback. I think this change
>> in the comment will make it easier for everyone who comes back in a
>> few years and reads this code.
> 
> I think you are looking for the term "(switch case) fallthrough", not
> "fallback". "Fallback" makes it sound like there is something missing,
> or an invalid state.
> 
> 
> Jonas
> 

will be modified in the next series, thanks for the review!
