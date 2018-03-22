Received: from mail-he1eur01on0720.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::720]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ez2Ks-0006Re-9O
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 15:41:05 +0000
Subject: Re: UBI assert failed in ubi_wl_init
To: Richard Weinberger <richard@sigma-star.at>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <CAFLxGvwyxJT8BtuPTJRonPhNnJ5mRtqda3H3u7bDTOsx7cRvtw@mail.gmail.com>
 <f18eea07-c2c5-cb61-e8d9-73b0b654645c@exertus.fi>
 <7511413.bof9RI5LLK@blindfold>
From: Timo Ketola <timo@exertus.fi>
Message-ID: <a6a77fba-9df1-2dac-25a7-c0d3d9bc5b42@exertus.fi>
Date: Thu, 22 Mar 2018 17:40:42 +0200
MIME-Version: 1.0
In-Reply-To: <7511413.bof9RI5LLK@blindfold>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22.03.2018 17:05, Richard Weinberger wrote:
> Timo,
> 
> Am Donnerstag, 22. März 2018, 14:57:57 CET schrieb Timo Ketola:
...
>> Here is a dump after the second boot:
>>
>> https://drive.google.com/open?id=1oa2lV_OB_tC-SX_c4jylnMXK6x1xhj2o
>>
>> After I dumped it I erased the whole mtd, wrote the dump back there,
>> dumped another dump and verified that it was identical with the first
>> one. Then I rebooted and observed that the issue was still there just as
>> before.
> 
> This image contains a Fastmap, but it is invalid.
> The image has a length of 2079326208 bytes, your PEB size is 128KiB.
> Therefore PEB count is 15864.
> But the Fastmap references PEBs 15865, 15866 and 15867.
> 
> This explains the failing assert, Fastmap talks about PEBs which are unknown 
> to UBI.
> 
> Can it be that your mtd partition layout is bad/broken?

The partition spans two chips and they both have four blocks of bad
block tables at the end of the chips. Would that explain?

I'm slightly confused though, because flash_erase reports total of eight
blocks:

# flash_eraseall /dev/mtd1
Erasing 128 Kibyte @ 3bf60000 - 48% complete.
Skipping bad block at 0x3bf80000

Skipping bad block at 0x3bfa0000

Skipping bad block at 0x3bfc0000

Skipping bad block at 0x3bfe0000
Erasing 128 Kibyte @ 7bf60000 - 99% complete.
Skipping bad block at 0x7bf80000

Skipping bad block at 0x7bfa0000

Skipping bad block at 0x7bfc0000

Skipping bad block at 0x7bfe0000
Erasing 128 Kibyte @ 7c000000 - 100% complete.


but, log tells only about four blocks:

[    1.549699] Bad block table found at page 524224, version 0x01
[    1.554241] Bad block table found at page 1048512, version 0x01
[    1.561314] Bad block table found at page 524160, version 0x01
[    1.565853] Bad block table found at page 1048448, version 0x01
[    1.573232] 2 ofpart partitions found on MTD device gpmi-nand
[    1.577688] Creating 2 MTD partitions on "gpmi-nand":
[    1.581499] 0x000000000000-0x000004000000 : "system"
[    1.595001] 0x000004000000-0x000080000000 : "user"


--

Timo
