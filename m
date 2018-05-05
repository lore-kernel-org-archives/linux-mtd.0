Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fF51s-0001Z3-Pv
 for linux-mtd@lists.infradead.org; Sat, 05 May 2018 21:47:46 +0000
Received: by mail-wr0-x243.google.com with SMTP id f2-v6so12497325wrm.3
 for <linux-mtd@lists.infradead.org>; Sat, 05 May 2018 14:47:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <39fbb845-784b-3e73-a9c6-0729a783930f@gmail.com>
References: <20180112093354.17593-1-zajec5@gmail.com>
 <20180119214450.vhctphu5d4kagwkv@rob-hp-laptop>
 <39fbb845-784b-3e73-a9c6-0729a783930f@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sat, 5 May 2018 23:47:31 +0200
Message-ID: <CACna6rxVkV=VdUu+Q8cfRk626eCKqq9ue+=_+GBMgEWO_KTkgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: document Broadcom's BCM47xx
 partitions
To: Rob Herring <robh@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,

On 29 March 2018 at 08:23, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote=
:
> Hi Rob & sorry for the late reply. My earlier accepted patchset adding
> of_match_table matching was reported to cause a regression. It had to be
> dropped and I had to focus on fixing that first.
>
>
> On 01/19/2018 10:44 PM, Rob Herring wrote:
>>
>> On Fri, Jan 12, 2018 at 10:33:53AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>
>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>
>>> Broadcom based home router devices use partitions which have to be
>>> discovered in a specific non-standard way. As there is no partition
>>> table this commit adds and describes a new custom binding.
>>>
>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>> ---
>>>  .../devicetree/bindings/mtd/partition.txt          | 46
>>> +++++++++++++++++++++-
>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt
>>> b/Documentation/devicetree/bindings/mtd/partition.txt
>>> index 36f3b769a626..b201d497b618 100644
>>> --- a/Documentation/devicetree/bindings/mtd/partition.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
>>> @@ -14,8 +14,6 @@ method is used for a given flash device. To describe
>>> the method there should be
>>>  a subnode of the flash device that is named 'partitions'. It must have=
 a
>>>  'compatible' property, which is used to identify the method to use.
>>>
>>> -We currently only document a binding for fixed layouts.
>>> -
>>>
>>>  Fixed Partitions
>>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> @@ -109,3 +107,47 @@ flash@2 {
>>>                 };
>>>         };
>>>  };
>>> +
>>> +
>>> +Broadcom BCM47xx Partitions
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> +
>>> +Broadcom is one of hardware manufacturers providing SoCs (BCM47xx) use=
d
>>> in
>>> +home routers. Their BCM947xx boards using CFE bootloader have several
>>> partitions
>>> +without any on-flash partition table. On some devices their sizes and/=
or
>>> +meanings can also vary so fixed partitioning can't be used.
>>> +
>>> +Discovering partitions on these devices is possible thanks to having a
>>> special
>>> +header and/or magic signature at the beginning of each of them. They a=
re
>>> also
>>> +block aligned which is important for determinig a size.
>>> +
>>> +Most of partitions use ASCII text based magic for determining a type.
>>> More
>>> +complex partitions (like TRX with its HDR0 magic) may include extra
>>> header
>>> +containing some details, including a length.
>>> +
>>> +A list of supported partitions includes:
>>> +1) Bootloader with Broadcom's CFE (Common Firmware Environment)
>>> +2) NVRAM with configuration/calibration data
>>> +3) Device manufacturer's data with some default values (e.g. SSIDs)
>>> +4) TRX firmware container which can hold up to 4 subpartitions
>>> +5) Backup TRX firmware used after failed upgrade
>>> +
>>> +As mentioned earlier, role of some partitions may depend on extra
>>> configuration.
>>> +For example both: main firmware and backup firmware use the same TRX
>>> format with
>>> +the same header. To distinguish currently used firmware a CFE's
>>> environment
>>> +variable "bootpartition" is used.
>>> +
>>> +
>>> +Devices using Broadcom partitions described above should should have
>>> flash node
>>> +with a subnode named "partitions" using following properties:
>>> +
>>> +Required properties:
>>> +- compatible : (required) must be "brcm,bcm947xx-cfe-partitions"
>>
>>
>> So you can't discover you have CFE partitions, but you can discover
>> everything else like where partitions start?
>
>
> I could discover there is a CFE bootloader at the flash beginning and
> assume there are CFE-like partitions. It doesn't sound safe however and
> I believe the point of using DT + compatible properties is to avoid such
> /guessing/. There are too many cases, devices, "formats" to just blindly
> try every possible parser. That's why we agreed to use "compatible"
> strings.
>
> This was also described by Boris in his patchset 2+ years ago:
> [RFC PATCH 0/7] mtd: partitions: add of_match_table support
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html
>
>>  (2) we can't just scan for all supported parsers (like the block system
>> does), since
>>      there is a wide diversity of "formats" (no standardization), and it
>> is not
>>      always safe or efficient to attempt to do so, particularly since ma=
ny
>> of
>>      them allow their data structures to be placed anywhere on the flash=
,
>> and
>>      so require scanning the entire flash device to find them.
>
> I also believe this is solution you acked back then:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064100.html
>
>> On Fri, Dec 04, 2015 at 09:19:19PM -0800, Brian Norris wrote:
>> > The platform description (such as the type of partition formats used o=
n
>> > a given flash) should be done independently of the flash driver in use=
.
>> > However, we can't reasonably have *all* partition parsers run on all
>> > flash (until they find a match), so let's overload the 'partitions'
>> > subnode to support specifying which format(s) to try in the device tre=
e.
>> >
>> > (...)
>>
>> Looks good to me. If you had lots of partitions, I'd agree with comments
>> that they should be separate files, but I doubt we'll have many 10s of
>> them. Plus all we really need here is a list of compatible strings.
>>
>> Acked-by: Rob Herring <robh at kernel.org>
>
> So I guess the answer is:
> 1) I really don't want to blindly look for CFE-like partitions. Too much
>    risk of false positives.
> 2) I don't want parser to be blindly called & use extra magic checks to
>    make sure I'm dealing with device using CFE bootloader.
> 3) Once I know I'm dealing with device using CFE bootloader I can find
>    partitions on the flash.
>
>
>> Why doesn't the kernel just probe for the partition table?
>
>
> If by a "partition table" you mean a single block with data using a
> clear structure: it doesn't exist. That's the whole point with crappy
> Broadcom devices.

Would you find a moment to review that patch again, after extra
explanation I provided, please?
