Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqac6-0001yl-Iw
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 21:42:34 +0000
Message-ID: <48F7B59D.9000200@logix.net.nz>
Date: Fri, 17 Oct 2008 10:43:57 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: nandwrite/ubi memory corruption?
References: <48F71315.5080707@logix.net.nz>
	<20081016150135.GA11063@fluff.org.uk>
In-Reply-To: <20081016150135.GA11063@fluff.org.uk>
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
> On Thu, Oct 16, 2008 at 11:10:29PM +1300, Michal Ludvig wrote:
>> Hi all,
>>
>> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
>> and am experiencing (probably) memory corruption of UBI/UBIFS on
>> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
>> [...]
>> s3c2410-nand s3c2410-nand: clock idle support enabled
> 
> hmm, could you try disabling the clock-idle support?

How do I do that?

Michal
