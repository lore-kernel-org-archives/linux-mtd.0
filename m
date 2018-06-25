Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXZ7F-0001bq-19
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 21:33:43 +0000
Received: from player693.ha.ovh.net (unknown [10.109.120.29])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 5B4991C147A
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 23:33:18 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 25 Jun 2018 23:33:05 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Mark Rutland <mark.rutland@arm.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Jonas Gorski
 <jonas.gorski@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: document Broadcom's TRX firmware
 format binding
In-Reply-To: <20180625212137.GA16487@rob-hp-laptop>
References: <20180612104434.15232-1-zajec5@gmail.com>
 <20180625212137.GA16487@rob-hp-laptop>
Message-ID: <623424b397965cea5f85ccbabdda3ef6@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-06-25 23:21, Rob Herring wrote:
> On Tue, Jun 12, 2018 at 12:44:33PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>> 
>> Broadcom based home router devices use TRX firmware format. It's a
>> container that can hold few partitions. If operating system is 
>> expected
>> to access them it has to understand that format and parse flash data
>> accordingly.
>> 
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>  .../bindings/mtd/partitions/brcm,trx.txt           | 35 
>> ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt 
>> b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
>> new file mode 100644
>> index 000000000000..e590b884e5ac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
>> @@ -0,0 +1,35 @@
>> +Broadcom TRX Container Partition
>> +================================
>> +
>> +TRX is Broadcom's official firmware format for the BCM947xx boards. 
>> It's used by
>> +most of the vendors building devices based on Broadcom's BCM47xx SoCs 
>> and is
>> +supported by the CFE bootloader.
>> +
>> +Design of the TRX format is very minimalistic. Its header contains
>> +identification fields, CRC32 checksum and the locations of embedded 
>> partitions.
>> +Its purpose is to store a few partitions in a format that can be 
>> distributed as
>> +a standalone file and written in a flash memory.
>> +
>> +Container can hold up to 4 partitions. The first partition has to 
>> contain a
>> +device executable binary (e.g. a kernel) as it's what the CFE 
>> bootloader starts
>> +executing. Other partitions can be used for operating system 
>> purposes. This is
>> +useful for systems that keep kernel and rootfs separated.
>> +
>> +TRX doesn't enforce any strict partition boundaries or size limits. 
>> All
>> +partitions have to be less than the 4GiB max size limit.
>> +
>> +There are two existing/known TRX variants:
>> +1) v1 which contains 3 partitions
>> +2) v2 which contains 4 partitions
>> +
>> +Required properties:
>> +- compatible : (required) must be either: "brcm,trx-v1" or 
>> "brcm,trx-v2"
>> +	followed by "brcm,trx"
> 
> What is the purpose of brcm,trx? Either that alone is enough or you 
> need
> v1/v2 to distinguish the difference. You shouldn't need both.

I guess I incorrectly tried some pattern I saw when specifying SoC
compatibility.

Can I have you advise here, please?

No TRX supporting code really needs a hint about used TRX version. TRX
format (header) contains "version" field so any code dealing with TRX
format can check that field. Then it knows what version it's dealing
with.

Which binding(s) should I use in that case?
