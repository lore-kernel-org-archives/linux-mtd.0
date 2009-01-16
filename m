Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNpoA-0007vm-PI
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 14:36:29 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1620052wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jan 2009 06:36:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1232105373.25068.25.camel@localhost.localdomain>
References: <de9b121e0901150854w7b88abcendc36e4a5311890aa@mail.gmail.com>
	<1232105373.25068.25.camel@localhost.localdomain>
Date: Fri, 16 Jan 2009 15:36:25 +0100
Message-ID: <de9b121e0901160636l1d946e9bhaf5c269a5131ea7d@mail.gmail.com>
Subject: Re: Problem with ubiformat
From: Johan <kungjohan@gmail.com>
To: dedekind@infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is my output of flash_eraseall, so it looks like the same
input/output error exist in flash_eraseall but it continues anyway.

# flash_eraseall /dev/mtd0
Erasing 128 Kibyte @ fba0000 -- 24 % complete.
Skipping bad block at 0x0fbc0000
Erasing 128 Kibyte @ 105e0000 -- 25 % complete.
Skipping bad block at 0x10600000
Erasing 128 Kibyte @ 14160000 -- 31 % complete.
flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ 17620000 -- 36 % complete.
Skipping bad block at 0x17640000
Erasing 128 Kibyte @ 205e0000 -- 50 % complete.
Skipping bad block at 0x20600000
Erasing 128 Kibyte @ 22d20000 -- 54 % complete.
Skipping bad block at 0x22d40000
Erasing 128 Kibyte @ 2dd80000 -- 71 % complete.
Skipping bad block at 0x2dda0000
Erasing 128 Kibyte @ 32e20000 -- 79 % complete.
Skipping bad block at 0x32e40000
Erasing 128 Kibyte @ 33220000 -- 79 % complete.
Skipping bad block at 0x33240000

Skipping bad block at 0x33260000
Erasing 128 Kibyte @ 3b240000 -- 92 % complete.
flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ 3ce00000 -- 95 % complete.
Skipping bad block at 0x3ce20000
Erasing 128 Kibyte @ 3fec0000 -- 99 % complete.
Skipping bad block at 0x3fee0000

Skipping bad block at 0x3ff00000

Skipping bad block at 0x3ff20000

Skipping bad block at 0x3ff40000

Skipping bad block at 0x3ff60000

Skipping bad block at 0x3ff80000

Skipping bad block at 0x3ffa0000

Skipping bad block at 0x3ffc0000

Skipping bad block at 0x3ffe0000

#

Looking at my bootup sequence:

[42949374.580000] NAND device: Manufacturer ID: 0xad, Chip ID: 0xd3
(Hynix NAND 1GiB 3,3V 8-bit)
[42949374.590000] AT91 NAND: 8-bit, Software ECC
[42949374.590000] Scanning device for bad blocks
[42949374.690000] Bad eraseblock 2014 at 0x0fbc0000
[42949374.690000] Bad eraseblock 2096 at 0x10600000
[42949374.740000] Bad eraseblock 2994 at 0x17640000
[42949374.790000] Bad eraseblock 4144 at 0x20600000
[42949374.810000] Bad eraseblock 4458 at 0x22d40000
[42949374.880000] Bad eraseblock 5869 at 0x2dda0000
[42949374.910000] Bad eraseblock 6514 at 0x32e40000
[42949374.910000] Bad eraseblock 6546 at 0x33240000
[42949374.920000] Bad eraseblock 6547 at 0x33260000
[42949374.980000] Bad eraseblock 7793 at 0x3ce20000
[42949375.000000] Bad eraseblock 8183 at 0x3fee0000
[42949375.000000] Bad eraseblock 8184 at 0x3ff00000
[42949375.010000] Bad eraseblock 8185 at 0x3ff20000
[42949375.010000] Bad eraseblock 8186 at 0x3ff40000
[42949375.020000] Bad eraseblock 8187 at 0x3ff60000
[42949375.020000] Bad eraseblock 8188 at 0x3ff80000
[42949375.030000] Bad eraseblock 8189 at 0x3ffa0000
[42949375.030000] Bad eraseblock 8190 at 0x3ffc0000
[42949375.040000] Bad eraseblock 8191 at 0x3ffe0000
[42949375.040000] Creating 1 MTD partitions on "atmel_nand":
[42949375.050000] 0x00000000-0x40000000 : "NAND flash partition"

There is no bad eraseblock 2571 at that position, but I assume that it
should be marked so?

/Johan

2009/1/16 Artem Bityutskiy <dedekind@infradead.org>:
> On Thu, 2009-01-15 at 17:54 +0100, Johan wrote:
>> I have a problem with ubiformat on one of my boards, the same command
>> works on another board.
>>
>> #
>> # ubiformat /dev/mtd0
>> ubiformat: mtd0 (NAND), size 1073741824 bytes (1024.0 MiB), 131072
>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
>> libscan: scanning eraseblock 8191 -- 100 % complete
>> ubiformat: 2567 eraseblocks have valid erase counter, mean value is 3
>> ubiformat: 5606 eraseblocks are supposedly empty
>> ubiformat: bad eraseblocks: 2014, 2096, 2994, 4144, 4458, 5869, 6514,
>> 6546, 6547, 7793, 8183, 8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191
>> ubiformat: warning!: only 2567 of 8173 eraseblocks have valid erase coun=
ter
>> ubiformat: erase counter 0 will be used for all eraseblocks
>> ubiformat: note, arbitrary erase counter value may be specified using -e=
 option
>> ubiformat: continue? (yes/no)  yes
>> ubiformat: use erase counter 0 for all eraseblocks
>> ubiformat: formatting eraseblock 2571 -- 31 % complete  ubiformat:
>> error!: failed to erase eraseblock 2571
>>            error 5 (Input/output error)
>> #
>>
>> I am using mtd-utils snapshot from 2008-12-18.
>>
>> Any ideas to what the problem might be?
>
> I guess eraseblock number 2571 is bad and ubiformat cannot erase it.
> Probably we should teach ubiformat taking care about bad eraseblocks by
> marking them as bad. It should be easy. Try flash_eraseall - does it
> complain about eraseblock 2571?
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
