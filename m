Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu1DX-0007YK-UY
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 16:15:08 +0000
Message-ID: <5558BE74.5020307@hauke-m.de>
Date: Sun, 17 May 2015 18:14:44 +0200
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 6/7] mtd: brcmnand: run bcm47xxpart part parser in addition
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-7-git-send-email-hauke@hauke-m.de>
 <CAOiHx=kGrsxLRT_Lf7PGm=hHm8azQYu5_AQVd6q+oOh2EXawsQ@mail.gmail.com>
In-Reply-To: <CAOiHx=kGrsxLRT_Lf7PGm=hHm8azQYu5_AQVd6q+oOh2EXawsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, rjui@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/17/2015 06:05 PM, Jonas Gorski wrote:
> Hi Hauke,
> 
> On Sun, May 17, 2015 at 5:41 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> On the bcm53xx and bcm47xx SoC the bcm47xxpart partition parser is able
>> to parse the partitions automatically by reading some special header
>> used on these SoCs flash partition and some guessing. Without this
>> patch the default list is used, with this patch this partition parser
>> is used if the others haven't found a partition.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 468a212..cc5dc1e 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -1879,6 +1879,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>>         return 0;
>>  }
>>
>> +static const char * const probes[] = {"cmdlinepart", "ofpart", "bcm47xxpart",
>> +                                     NULL};
>> +
> 
> I know this is a bit more work, but how about moving the
> "linux,part-probe" parsing code from drivers/mtd/maps/physmap_of.c to
> mtd_device_parse_register?
> 
> then mtd_device_parse_register could do something like
> 
>  if (!probes && ppdata && ppdata->of_node)
>     probes = of_get_probes(ppdata->of_node);
> 
> and you could just add a linux,part-probe = "..."; property to the dts files
> 
> (It looks too easy/obvious so I guess I'm overlooking something fundamental ;P)
> 

Yes I will try to get this done in a generic way through device tree. I
was already searching for a way to provide the partition parser from
device tree and was wondering why it was not there.

I will send an independent patch which adds this feature and this patch
from this series can be dropped.

Hauke
