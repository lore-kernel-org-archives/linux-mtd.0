Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqbpi-0007Ji-GA
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:00:42 +0000
Message-ID: <48F7C7E5.9070107@logix.net.nz>
Date: Fri, 17 Oct 2008 12:01:57 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: nandwrite/ubi memory corruption?
References: <48F71315.5080707@logix.net.nz>
	<20081016150135.GA11063@fluff.org.uk>
	<48F7B59D.9000200@logix.net.nz>
	<20081016215616.GE22711@trinity.fluff.org>
In-Reply-To: <20081016215616.GE22711@trinity.fluff.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks wrote:
> On Fri, Oct 17, 2008 at 10:43:57AM +1300, Michal Ludvig wrote:
>> Ben Dooks wrote:
>>> On Thu, Oct 16, 2008 at 11:10:29PM +1300, Michal Ludvig wrote:
>>>> Hi all,
>>>>
>>>> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
>>>> and am experiencing (probably) memory corruption of UBI/UBIFS on
>>>> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
>>>> [...]
>>>> s3c2410-nand s3c2410-nand: clock idle support enabled
>>> hmm, could you try disabling the clock-idle support?
>> How do I do that?
> 
> there should be a Kconfig entry to do it when the s3c2410 nand driver
> is selected.

Ah, I see. OK, with clock-idle off nandwrite didn't corrupt ubi/ubifs
but the kernel still wouldn't boot:

NAND Flash Reading
dst base address          = 0x30100000
Source start block number = 20
Source size  (0x4000*n)   = 0x180000
status 1
## Booting image at 30100000 ...
Bad Magic Number
status -1
u-boot>

Michal
