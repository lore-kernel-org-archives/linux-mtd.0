Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqeib-0006hS-4A
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 02:05:33 +0000
Message-ID: <48F7F340.5040804@logix.net.nz>
Date: Fri, 17 Oct 2008 15:06:56 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: nandwrite/ubi memory corruption?
References: <48F71315.5080707@logix.net.nz>	<20081016150135.GA11063@fluff.org.uk>	<48F7B59D.9000200@logix.net.nz>	<20081016215616.GE22711@trinity.fluff.org>
	<48F7C7E5.9070107@logix.net.nz>
In-Reply-To: <48F7C7E5.9070107@logix.net.nz>
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

Michal Ludvig wrote:
> Ben Dooks wrote:
>> On Fri, Oct 17, 2008 at 10:43:57AM +1300, Michal Ludvig wrote:
>>> Ben Dooks wrote:
>>>> On Thu, Oct 16, 2008 at 11:10:29PM +1300, Michal Ludvig wrote:
>>>>> Hi all,
>>>>>
>>>>> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
>>>>> and am experiencing (probably) memory corruption of UBI/UBIFS on
>>>>> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
>>>>> [...]
>>>>> s3c2410-nand s3c2410-nand: clock idle support enabled
>>>> hmm, could you try disabling the clock-idle support?
>>> How do I do that?
>> there should be a Kconfig entry to do it when the s3c2410 nand driver
>> is selected.
> 
> Ah, I see. OK, with clock-idle off nandwrite didn't corrupt ubi/ubifs
> but the kernel still wouldn't boot:

It looks like if nandwrite writes some nonsense onto the flash.

I did:
~ # nanddump -o -b -f dump.pre-nandwrite /dev/mtd1
~ # nandwrite -p /dev/mtd1 uimage26
~ # nanddump -o -b -f dump.post-nandwrite /dev/mtd1

dump.post-nandwrite is different from dump.pre-nandwrite but doesn't
seem to have much in common with uimage26.

OTOH dump.pre-nandwrite contains the kernel image that has been stored
by u-boot's nandw. So the /dev/mtd1 offset is probably OK.

Any ideas on what's wrong?

Michal
