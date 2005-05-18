Message-ID: <428BC34F.7000904@netwinder.org>
Date: Wed, 18 May 2005 18:35:59 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Thorsten Haas <haas@deutaeit.de>
References: <1116403535.2682.7.camel@shrek>
In-Reply-To: <1116403535.2682.7.camel@shrek>
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

> I have a board equipped with CFI-compatible NOR-flash, which is
> physmapped and detected by the kernel (/dev/mtd0 in /proc/mtd). Now I am
> trying to configure partitions. I read the HOWTO on
> ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt,
> googled and browsed kernel code (2.6.8.11) and a daily mtd-snapshot
> (2005-05-15). From what i read, I understand:
> a) Command line partition table parsing is not functional with
> physmapped devices
> b) I need to create and fill a 'struct mtd_partition' and call     

Hmm, I have used both methods successfully, albeit not with NOR flash... 
  though I can't see how it would make any difference for partitioning. 
  I'm using the MTD code "as is" in kernel 2.6.11.3 from kernel.org. 
One minor bug with automatic buswidth probing, easily solved though.

> I've seen people writing board-dependent mapping drivers, thus
> clobbering the section "mapping driver for chip access". Is this
> actually the way to go? Well, I am not too lazy to write some code, but
> is there a more genric way?

Unless you have special requirements, such as paging or special unlock 
sequences, or multiple (different) kinds of flash chips, you probably do 
not need your own mapping driver.  Physmap should do fine I'd think.

-R
