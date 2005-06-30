Received: from karma.reboot.ca ([67.15.48.17])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Do3A4-0000aw-1G
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2005 13:49:17 -0400
Message-ID: <001b01c57d9c$761e6200$6702a8c0@niro>
From: "Andre" <andre@rocklandocean.com>
To: "Greg Ungerer" <gerg@snapgear.com>
References: <006301c576ad$70547490$6702a8c0@niro>
	<42C391A2.5020502@snapgear.com>
Date: Thu, 30 Jun 2005 10:52:18 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	fabrice.bellard@netgem.com
Subject: Re: kernel messages from INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

Greg Ungerer wrote:
> Hi Andre,
>
> Andre wrote:
>> First of all, thank you Thomas for your help on trying to get my
>> diskonchip2000 to be recognized by linuxmtd.
>>
>> After enabling the right config flags in the kernel, I can now mount
>> my diskonchip2000.
>>
>> There were some messages during the initial loading of the inftl
>> module that frightened me a bit. Here is the entire output from
>> dmesg: ==================
>> DiskOnChip found at 0xd0000
>> Detected 3 chips per floor.
>> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND
>> 128MiB 3,3V 8-bit)
>> 3 NAND chips detected
>> Bad block table not found for chip 0
>> Bad block table not found for chip 0
>> Found DiskOnChip BNAND Media Header at 0x4000
>>     bootRecordID          = BNAND
>>     NoOfBootImageBlocks   = 0
>>     NoOfBinaryPartitions  = 1
>>     NoOfBDTLPartitions    = 1
>>     BlockMultiplerBits    = 0
>>     FormatFlgs            = 1
>>     OsakVersion           = 5.1.4.0
>>     PercentUsed           = 98
>>     PARTITION[0] ->
>>         virtualUnits    = 4
>>         firstUnit       = 2
>>         lastUnit        = 5
>>         flags           = 0x20000000
>>         spareUnits      = 0
>>     PARTITION[1] ->
>>         virtualUnits    = 24072
>>         firstUnit       = 11
>>         lastUnit        = 24575
>>         flags           = 0xc0000000
>>         spareUnits      = 2
>> Creating 2 MTD partitions on "DiskOnChip 2000 (INFTL Model)":
>> 0x00008000-0x00018000 : " DiskOnChip BDK partition"
>> 0x0002c000-0x18000000 : " DiskOnChip BDTL partition"
>>
>> <Andre> looks ok up until here
>>
>> INFTL: inftlcore.c $Revision: 1.18 $, inftlmount.c $Revision: 1.16 $
>> INFTL: corrupt block 10588 in chain 10588, chain length 0, erase
>> mark 0x0? INFTL: formatting chain at block 10588
>> INFTL: formatting block 10588
>> INFTL: error while formatting block 10588
>> INFTL: corrupt block 15274 in chain 15274, chain length 0, erase
>> mark 0x0? INFTL: formatting chain at block 15274
>> INFTL: formatting block 15274
>> INFTL: error while formatting block 15274
>> INFTL: corrupt block 21286 in chain 21286, chain length 0, erase
>> mark 0x0? INFTL: formatting chain at block 21286
>> INFTL: formatting block 21286
>> INFTL: error while formatting block 21286
>> INFTL: corrupt block 24574 in chain 24574, chain length 0, erase mark
>> 0xffff?
>> INFTL: formatting chain at block 24574
>> INFTL: formatting block 24574
>> INFTL: corrupt block 24575 in chain 24575, chain length 0, erase mark
>> 0xffff?
>> INFTL: formatting chain at block 24575
>> INFTL: formatting block 24575
>>  inftla: inftla1
>> ==================
>> The INFTL messages do not appear on subsequent loads of the inftl
>> module. Can somebody please explain what happened, i.e. should I be
>> concerned?
>
> The INFTL code is telling you that it didn't think the chains
> where logically correct. So it went ahead and tried to fix them up.
> Once fixed you should not see any messages on the next boot (as
> you didn't). Certainly not normal (or good).

The device really started to act up on subsequent boot and I couldn't even
format it anymore with m-sys tools. The dformat utility complained about not
being able to find the bad block table.

> I take it you are running this on a device that was formatted
> using the M-systems tools?

correct

> What kernel version are you using here?

stock 2.6.11 with mtd 20050612 snapshot.

Thanks for your reply,
Andre
