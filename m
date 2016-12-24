Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKw2Y-0008AZ-Sp
 for linux-mtd@lists.infradead.org; Sat, 24 Dec 2016 23:47:52 +0000
Received: by mail-wj0-x241.google.com with SMTP id j10so44936118wjb.3
 for <linux-mtd@lists.infradead.org>; Sat, 24 Dec 2016 15:47:28 -0800 (PST)
Subject: Re: [PATCH v2 2/3] mtd: m25p80: consider max message size in
 m25p80_read
To: Marek Vasut <marek.vasut@gmail.com>, Michal Suchanek <hramrach@gmail.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
 <b65240ff-7e28-5ecb-0670-abfca871246b@gmail.com>
 <2e31fbe7-bbc7-8fed-ccbf-dd9ae4d220e1@atmel.com>
 <e7513817-c6d1-948d-19ff-617debfa1399@gmail.com>
 <CAOMqctTaPoMR=_dEF_j-WU178_i2tOp2sTfZJSDWWkohVxZn8A@mail.gmail.com>
 <1bd5f31a-a32e-12ce-10af-1a17955f5ab6@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <a7de8f14-220b-6511-d3b9-3d0858f2565a@gmail.com>
Date: Sun, 25 Dec 2016 00:47:09 +0100
MIME-Version: 1.0
In-Reply-To: <1bd5f31a-a32e-12ce-10af-1a17955f5ab6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.12.2016 um 11:20 schrieb Marek Vasut:
> On 12/23/2016 10:04 PM, Michal Suchanek wrote:
>> Hello,
> 
> Hi,
> 
>> On 23 December 2016 at 19:53, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> On 12/23/2016 04:33 PM, Cyrille Pitchen wrote:
>>>> Le 17/08/2016 à 21:09, Heiner Kallweit a écrit :
>>>>> Consider a message size limit when calculating the maximum amount
>>>>> of data that can be read.
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>
>>>> Applied to git://github.com/spi-nor/linux.git
>>>
>>> Is that the concensus now that we should fix controller crappiness on
>>> driver level ? Or did I miss the point of this patch ?
>>>
>>
>> In general most controllers do have some limit on the amount of data
>> they can transfer at once.
> 
> My observations suggest otherwise.
> 
>> For some you can apply workaround at controller driver level and for
>> some it's not practical.
>>
>> Also for some the limit is lower so it is more likely hit.
>>
>> I guess you can call controllers that have both of these limitations
>> crappy but that's what's in the silicone out there.
>>
>> If you have better solution to the problem please share it in detail.
> 
> I don't have a solution, but I am quite sure that if we now set a
> precedent that each and every device driver should take care of each and
> every controller's quirk, we have a lot of unpleasant work ahead
> of us and it will be quite the maintanance burden. The separations
> between device driver and controller driver has been weakened and I
> don't think that's good.
> 
The controller driver API has been extended to allow exposing certain
types of controller limits (max tranfer size, max message size)
to upper layers. And controller drivers rely on upper layers
considering this information.
W/o this patch certain combinations of protocol and controller drivers
(e.g. m25p80 + fsl-espi) don't work for big transfer / message sizes.

The (most likely more ugly) alternative is controller drivers
implementing protocol-specific hacks to deal with messages exceeding
controller limits. One example was the fsl-espi drivers before the
recent refactoring. It assumed all big messages to be m25p80.
