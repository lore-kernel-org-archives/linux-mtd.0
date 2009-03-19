Received: from mail.oksatcom.it ([83.216.172.7] helo=mail.satcom.it)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkIRG-00075G-JI
	for linux-mtd@lists.infradead.org; Thu, 19 Mar 2009 13:37:44 +0000
Message-ID: <49C24A9B.7060206@tecnasrl.com>
Date: Thu, 19 Mar 2009 14:37:31 +0100
From: Francesco Lodi - Tecna Srl <francesco.lodi@tecnasrl.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Micron NAND MT29F8G08AAAWP new structure support  ?
References: <C59456935A4A4267A7C97E6988C92F6A@XPGREGORY>
In-Reply-To: <C59456935A4A4267A7C97E6988C92F6A@XPGREGORY>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Gregory Medwed <gregory.medwed@actis-computer.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Gregory,
I am happy that I am not the only one with this problem! :D
By now, I have not yet resolved the problem because I gave the
precedence at other things but I will came back to this issue the next week.
If you want we can keep in touch to co-operate on this.
Also I would like to try to use YAFFS2 on this device, because I think
that JFFS2 would take a very long time to mount a 4 Gb device.

In the meanwhile... I have found that the u-boot team have a patch for
their version of MTD that would support 128k OOB but right now I was not
able to merge it with the linux MTD. You can give it a try, if you think
it is helpfull.

By the way, any help or suggestion by the MTD guru would be very
appreciated! ;)

Thanks and best regards,
Francesco

-------- Messaggio Originale  --------
Oggetto: Micron NAND MT29F8G08AAAWP new structure support  ?
Da: Gregory Medwed <gregory.medwed@actis-computer.com>
A: linux-mtd@lists.infradead.org
Data: 19/03/2009 09:44
> Hello,
> I'm having the same problem as describe by Francesco (in the email below)
> with MICRON MT29F8G08AAAWP device.
> Micron new NAND internal structure is:
> 4096 Bytes + 218 Bytes (OOB) = 1 page
> 256 kBytes + 13 kBytes (OOB) = 1 block (64 pages)
> 4.304 Mbytes = plane (2048 blocks)
>
> Is there a plan to support this new device structure in the MTD driver and
> utils ?
>
> Best regards
>
> Gregory
>
>
>   
>> Hi all,
>> I am trying to make this Micron NAND flash to work:
>> http://www.micron.com/products/partdetail?part=MT29F32G08QAAWP
>> it is a 32 gigabit divided into two 16 gigabit device and now, for
>> simplicity, I am working only on the first one.
>> The kernel I am using is the last 2.6.28.4.
>> The flash has a spare area of 218 bytes so the MTD driver calculate an
>> OOB size of 128 bytes and then it throws a BUG in the function
>> nand_scan_tail ("no oob scheme defined for oobsize 128").
>> I have tried to add this schema at the beginning on nand_base.c:
>>
>> static struct nand_ecclayout nand_oob_128 = {
>>    .eccbytes = 48,
>>    .eccpos = {
>>    80,  81,  82,  83,  84,  85,  86,  87,
>>    88,  89,  90,  91,  92,  93,  94,  95,
>>    96,  97,  98,  99, 100, 101, 102, 103,
>>    104, 105, 106, 107, 108, 109, 110, 111,
>>    112, 113, 114, 115, 116, 117, 118, 119,
>>    120, 121, 122, 123, 124, 125, 126, 127},
>>    .oobfree = {
>>        {.offset = 2,
>>         .length = 78}}
>> };
>>
>> and then adding:
>>        case 128:
>>            chip->ecc.layout = &nand_oob_128;
>> in nand_scan_tail.
>>
>> Doing that resolve the kernel BUG but flash_eraseall claims that it
>> can't read oobinfo.
>> I have resolved also this problem by expanding the array eccpos in the
>> structure nand_oobinfo to 64 even in the kernel than in the user space
>> utility.
>>
>> Now flash_eraseall -j works fine but when I mount the device it ends with:
>> Cowardly refusing to erase block on filesystem with no valid JFFS2 node
>>
>> After erasing the flash without the -j option I was able to mount the
>> device but whenever I copy a file into it I have a kernel BUG at
>> fs/jffs2/file.c:251
>>
>> Now I am stuck at this point and I am asking if you have any suggestion
>> on how to use this flash.
>>
>> Thanks,
>> Francesco
>>     
