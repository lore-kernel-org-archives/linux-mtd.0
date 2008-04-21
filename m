Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JnwCO-0000xy-61
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 13:36:48 +0000
Date: Mon, 21 Apr 2008 15:36:09 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [U-Boot-Users] ubi and u-boot
In-Reply-To: <1208779508.5965.371.camel@sauron>
Message-ID: <Pine.LNX.4.64.0804211533140.27984@lnxricardw.se.axis.com>
References: <20080420222237.4AE5324657@gemini.denx.de>
	<1208779508.5965.371.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "u-boot-users@lists.sourceforge.net" <u-boot-users@lists.sourceforge.net>,
	Bernard Blackham <bernard@largestprime.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 21 Apr 2008, Artem Bityutskiy wrote:

> On Mon, 2008-04-21 at 00:22 +0200, Wolfgang Denk wrote:
>> In message <4808DF3B.2080702@largestprime.net> you wrote:
>>>
>>> Wolfgang showed some interest briefly too.[1]
>>
>> I am definitely interested.
>
> What I would suggest to start with is to teach U-boot to erase flash and
> preserve erase counters, because now it just wipes the erase counters
> out. Also, it would be nice to teach it to flash images properly in case
> of NAND flash.
>

I was under the impression from past emails on the MTD list that the=20
internal meta format for UBI has changed a few times over its lifetime.

Assuming this continues, I would think this would cause problems for=20
bootloaders such as U-Boot whose flash partitions are not necessarily=20
rewritten in the case of a product upgrade - i.e. a firmware upgrade with=
=20
a new kernel would have a new UBI implementation and spec causing an
older bootloader to fail to operate properly with the newer image.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
