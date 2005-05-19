Message-ID: <428C7E60.3090908@netwinder.org>
Date: Thu, 19 May 2005 07:54:08 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Thorsten Haas <haas@deutaeit.de>
References: <1116403535.2682.7.camel@shrek> <1116489972.2647.4.camel@shrek>
In-Reply-To: <1116489972.2647.4.camel@shrek>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI physmap - how to create partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thorsten Haas wrote:

> Solved. I used mphysmap.c, because there are two banks of flash on my
> board, but mphysmap.c does not support partitioning yet. Though,
> physmap.c does provide commandline partition parsing.
> Sadly, mtd-id's seem not to be well-documented. I looked the one for
> mappings to the physical memory area up in the source. It's
> "phys_mapped_flash". Huzaa.

Hmm, are the two banks the same (eg. two chips of same type), and are 
they consecutive in memory or parallel on the bus?  Then you can 
actually use physmap.  Just pass it the combined size of both chips, the 
MTD code will handle the rest.  There is no need to call probe function 
for each bank, or to partition each bank separately.  This seems to be 
another one of the MTD undocumented "features".

> Thus, I wrote some additional text into chapter "Making partitions with
> CFI flash and working with multiple banks of FLASH" of
> mtd-jffs-HOWTO.txt. ( retreived it from
> ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt )

Nice!
-R
