Received: from mika.eatserver.nl ([195.20.9.75])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9ER3-0001JV-8m
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 09:29:02 +0000
Message-ID: <4BDFE8D6.1050704@aimvalley.nl>
Date: Tue, 04 May 2010 11:28:54 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>
Subject: Re: Some questions on bit-flips and JFFS2
References: <201005031505.18604.muehlfelder@enertex.de>
In-Reply-To: <201005031505.18604.muehlfelder@enertex.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thorsten Mühlfelder wrote:
> Hi there,
> 
> I'm experiencing some problems with bit-flips on devices using NAND and JFFS2:
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron NAND 512MiB 3,3V 
> 8-bit)
> Creating 2 MTD partitions on "NAND 512MiB 3,3V 8-bit":
> 0x00000000-0x00a00000 : "Bootloader Area"
> 0x00a00000-0x20000000 : "User Area"
> 
> In rare cases 1 or 2 bits in the bootloader area (kernel) flip, so that the 
> system won't boot anymore (kernel checksum error).
> As the bootloader image is not mounted at all I wonder if this may be caused 
> by these read disturbs I've heard of.
> 


This may very well be the case.


> I've found some statements from different people about it here on the ML:
> 
>> We use JFFS2. As known JFFS2 detects and corrects single bit-flips
>> (per 256 byte subpage) but it doesn't physically correct them
>> on the NAND device itself.
> 
> and:
> 
>> AFAIK, jffs2 doesn't handle correctly bit flip on read: it won't try to
>> copy the data on another block while the data can still be recovered
>> by ecc.
> 
> For me this means that data still is read correctly because of ECC but it 
> won't get moved to a new block if a bit-flip happens? And what happens if 
> this occours on the kernel partition?
> 


True.
ECC is taken care of by the low-level MTD/NAND code
(e.g. drivers/mtd/nand/nand_base.c). These routines do indicate
errors but jffs2 doesn't really handle them (see jffs2_flash_read)
The kernel partition is a bare MTD(BLOCK) partition so the block won't
be moved or handled for sure. This means the same (=nothing) will happen.


> Furthermore:
>>> How about detection of ECC errors in read only partitions?
>> ECC should be done on both rw and read-only partitions. Sometimes NAND gets
>> read disturbs which would impact on read-only partitions. Also, write
>> disturbs from writes to one partition can still corrupt a read-only
>> partition on the same chip.
> 
> So writing to my root partition may harm my kernel partition, too?
> 


I don't know. Check/ask your hardware supplier. Micron may have some
details/documents about this.


> PS: I could not reproduce the bit-flip problem. It just happens in rare cases. 
> Furthermore some of my devices are using Samsung NAND instead of the Micron 
> NAND and did not show any problems yet. So perhaps my problem are just some 
> bad NAND chip? But still I have to find a solution for the problem.
> 


Maybe, as said check/ask your hardware supplier.
Maybe "refreshing" the block helps (that is saving the data, erasing the block(s) and
reprogramming all data). You could try this.
The best solution is of course UBIFS. UBI/UBIFS will handle bad blocks and read/write
disturbs. Include your kernel partition into the (big) flash filesystem partition and
start using UBIFS (i.s.o. JFFS2).


hth,
Norbert van Bolhuis.
