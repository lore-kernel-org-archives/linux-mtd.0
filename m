Received: from walscop001.walsimou.com ([82.228.201.70]
	helo=bekkor.walsimou.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlTJn-0008Bf-4K
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 21:03:36 +0000
Message-ID: <4C6AF83E.6050408@embtoolkit.org>
Date: Tue, 17 Aug 2010 22:59:42 +0200
From: Abdoulaye Walsimou GAYE <awg@embtoolkit.org>
MIME-Version: 1.0
To: Brian Norris <norris@broadcom.com>, linux-mtd@lists.infradead.org
Subject: Re: [BUG] Nand support broken with v2.6.36-rc1
References: <20100817113644.GA31317@gibson.comsick.at>
	<4C6AC037.7070205@broadcom.com>
In-Reply-To: <4C6AC037.7070205@broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/17/2010 07:00 PM, Brian Norris wrote:
> Hello,
>
> On 08/17/2010 01:52 AM, Michael Guntsche wrote:
> > The only thing that might be special with the nand driver that is being
> > used is that a different oob layout is being used.
> >
> > static struct nand_ecclayout rbppc_nand_oob_16 = {
> >    .eccbytes = 6,
> >    .eccpos = { 8, 9, 10, 13, 14, 15 },
> >    .oobavail = 9,
> >    .oobfree = { { 0, 4 }, { 6, 2 }, { 11, 2 }, { 4, 1 } }
> > };
>
> On 08/17/2010 04:36 AM, Michael Guntsche wrote:
>> I added this to the nand driver itself.
>>
>> static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
>> static struct nand_bbt_descr rbppc_nand_smallpage = {
>>    .options = NAND_BBT_SCAN2NDPAGE,
>>    .offs = NAND_SMALL_BADBLOCK_POS,
>>    .len = 1,
>>    .pattern = scan_ff_pattern
>> };
>>
>> and the driver is working again. But shouldn't this be supported by 
>> the stock level code as well?
>
> Why yes, it should! Somebody (probably me) goofed. Your nand_ecclayout 
> is conflicting with the kernel's choice of bad block position. Recent 
> changes must have affected which position is chosen automatically by 
> the kernel.
>
> One of the following two cases is likely the problem:
> (1) Your chip is supposed to use offset 0, not 5, for the BBM (i.e., 
> NAND_LARGE_BADBLOCK_POS, not NAND_SMALL_BADBLOCK_POS), and so your 
> ecclayout should not be leaving byte 0 in the "oobfree" array (a 
> design flaw since you first began using this chip)
> (2) I made the commit that you mentioned 
> (c7b28e25cb9beb943aead770ff14551b55fa8c79) too restrictive in allowing 
> chips to use NAND_SMALL_BADBLOCK_POS.
>
> Option 2 is likely the case, and in fact, I realized a stupid mistake 
> I made in refactoring the detection here.
>
> I have been studying data from hundreds of flash chips to find where 
> the factory-determined markers should be stored. Unfortunately, I 
> can't cover all of them, and so your Hynix chip is likely one that was 
> overlooked. Could you send the full NAND ID string (8 bytes, not just 
> the manufacturer and chip ID), an exact part number for the flash, and 
> a datasheet? Any one of those could help (the datasheet being the most 
> important), but whatever you can provide is helpful. More data on your 
> chip would allow me to determine the problem for sure; I will send a 
> patch ASAP once I get your information.
>
> Sorry for the trouble!
>
> On another note, it may be intelligent to have the kernel-specific 
> systems check for such a conflict between bad-block markers and ECC 
> layout. If a position needed by the bad-block marker is listed in 
> "oobfree" or "eccpos" then we have a problem. Sound like a good idea 
> anybody? If so, what would be the best approach:
> * print an error and quit detection
> * try to modify the ecclayout, bbm info or both
> * try to modify, and fall-back to error message and quit if necessary
>
> Thanks,
> Brian


Hello,
I don't know if it's the same issue reported here (sorry if not), but 
when I use flash_eraseall
to erase a partition of a NAND flash[1] with linux-2.6.33.5 running on 
the target here is the output:

# flash_eraseall  /dev/mtd3
Erasing 16 Kibyte @ 1270000 -- 31 % complete.
Skipping bad block at 0x01274000
Erasing 16 Kibyte @ 3aa0000 -- 100 % complete.

And if it is latest linus tree (v2.6.36-rc1):

# flash_eraseall  /dev/mtd3
Erasing 16 Kibyte @ 1274000 -- 31 % complete.
flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 3aa0000 -- 100 % complete.

Now 0x01274000 is not recognized as bad block.
I use flash_eraseall from latest mtd-utils git tree 
(07a87aa599a8fc32e938d9987bd2b59eebcfcb76)

Do you think it's the same issue?

Thanks,
AWG

[1]
S3C24XX NAND Driver, (c) 2004 Simtec Electronics
s3c24xx-nand s3c2440-nand: Tacls=1, 9ns Twrph0=3 29ns, Twrph1=2 19ns
s3c24xx-nand s3c2440-nand: NAND hardware ECC
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 
3,3V 8-bit)
Creating 4 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x000000000000-0x000000040000 : "u-boot"
0x000000040000-0x000000060000 : "u-boot-env"
0x000000060000-0x000000560000 : "kernel"
0x000000560000-0x000004000000 : "root"
