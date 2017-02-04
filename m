Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ca8o8-0004Ok-Ia
 for linux-mtd@lists.infradead.org; Sat, 04 Feb 2017 22:27:51 +0000
Received: from player729.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id A9513203B1
 for <linux-mtd@lists.infradead.org>; Sat,  4 Feb 2017 23:27:21 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sat, 04 Feb 2017 23:27:12 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH V3] mtd: bcm47xxsflash: support reading flash out of
 mapping window
In-Reply-To: <a39c07ff-a17a-306e-88c0-fc79105ac608@gmail.com>
References: <20170123115154.3364-1-zajec5@gmail.com>
 <a39c07ff-a17a-306e-88c0-fc79105ac608@gmail.com>
Message-ID: <79f26e776e8ca071bb0a09e434114e99@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-02-04 23:01, Marek Vasut wrote:
> On 01/23/2017 12:51 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>> 
>> For reading flash content we use MMIO but it's possible to read only
>> first 16 MiB this way. It's simply an arch design/limitation.
>> To support flash sizes bigger than 16 MiB implement indirect access
>> using ChipCommon registers.
>> This has been tested using MX25L25635F.
>> 
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Simplify line writing to buf
>>     Add some trivial comment for OPCODE_ST_READ4B
>>     Both requested by Marek
>> V3: Use as much as possible MMIO access for read crossing boundary 
>> (performance)
> 
> It's not because of performance, but because you can start reading at 
> 15
> MiB offset and read 2 MiB , at which point the previous patch would IMO
> fail.

It never failed. It was slow but was working as expected.


> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 
> Thanks!

Thanks
