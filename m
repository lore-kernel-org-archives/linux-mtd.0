Received: from mail-wm0-f66.google.com ([74.125.82.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ca8tR-0006En-IW
 for linux-mtd@lists.infradead.org; Sat, 04 Feb 2017 22:33:19 +0000
Received: by mail-wm0-f66.google.com with SMTP id c85so13351416wmi.1
 for <linux-mtd@lists.infradead.org>; Sat, 04 Feb 2017 14:32:57 -0800 (PST)
Subject: Re: [PATCH V3] mtd: bcm47xxsflash: support reading flash out of
 mapping window
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20170123115154.3364-1-zajec5@gmail.com>
 <a39c07ff-a17a-306e-88c0-fc79105ac608@gmail.com>
 <79f26e776e8ca071bb0a09e434114e99@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b9143509-e182-79f6-19c8-7bca5393b772@gmail.com>
Date: Sat, 4 Feb 2017 23:31:53 +0100
MIME-Version: 1.0
In-Reply-To: <79f26e776e8ca071bb0a09e434114e99@milecki.pl>
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

On 02/04/2017 11:27 PM, Rafał Miłecki wrote:
> On 2017-02-04 23:01, Marek Vasut wrote:
>> On 01/23/2017 12:51 PM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> For reading flash content we use MMIO but it's possible to read only
>>> first 16 MiB this way. It's simply an arch design/limitation.
>>> To support flash sizes bigger than 16 MiB implement indirect access
>>> using ChipCommon registers.
>>> This has been tested using MX25L25635F.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>> V2: Simplify line writing to buf
>>>     Add some trivial comment for OPCODE_ST_READ4B
>>>     Both requested by Marek
>>> V3: Use as much as possible MMIO access for read crossing boundary
>>> (performance)
>>
>> It's not because of performance, but because you can start reading at 15
>> MiB offset and read 2 MiB , at which point the previous patch would IMO
>> fail.
> 
> It never failed. It was slow but was working as expected.

Maybe you didn't test with dumb enough mis-usage ;) I think something
like this would've triggered it:
$ dd if=/dev/mtd0 of=/dev/null seek=15M bs=2M
Assuming mtd0 is the whole flash device, and the flash is larger than 17
MiB.

But then again, it should be OK now and we can move on to the next problem.

>> Acked-by: Marek Vasut <marek.vasut@gmail.com>
>>
>> Thanks!
> 
> Thanks


-- 
Best regards,
Marek Vasut
