Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19azaa-0004Uq-3E
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2003 16:13:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: jbeisert@eurodsn.de
In-Reply-To: <200307111649.26591.jbeisert@eurodsn.de>
References: <200307111649.26591.jbeisert@eurodsn.de>
Message-Id: <1057936424.7949.41.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 11 Jul 2003 16:13:45 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Additional arguments to <struct nand_chip.hwcontrol> and
 .dev_ready functions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-07-11 at 15:49, Juergen Beisert wrote:
> Hello all,
> 
> I have written a driver for my NAND flash chip application using the mtd 
> framework. It works fine when there is only one chip in one memory area 
> present.
> But if there are more than one NAND chip, you need more than one function for
>     struct nand_chip.hwcontrol,
> because this function don't know which chips control lines it should change.
> Same with
>     struct nand_chip.dev_ready.
> For which chip it should wait?
> 
> Is it possible to add arguments, like a pointer to the struct nand_chip, to 
> these functions? Then one of this function could handle more than one chip.

I've done some work on this in CVS in the last few days. 

For the case where you have two entirely separate NAND flash chips it's
simple enough -- all these functions now take a 'struct mtd_info *'
argument which is sufficient. See the new DiskOnChip driver for an
example of how it works. You can then use mtdconcat to combine two
entirely separate devices into a single logical MTD device, if you want.

In addition to that, I'm working on fixing the generic NAND code to
handle multiple identical chips connected up together, in what seems to
be the most common arrangement where you _share_ the hwcontrol lines but
individually assert each chip's CE line. 

I've done this by adding a chip-number argument to the select_chip()
function. Your board driver can store this chip number if appropriate,
so that in hwcontrol() or dev_ready() it can ensure it's talking to the
correct chip.

So far, nand_scan() takes an extra argument to tell it the maximum
number of chips to attempt to probe, and I have it finding all 9 chips
on my 144MiB DiskOnChip 2000. I've just committed that and I'm now going
through the actual access functions making them select the correct chip
according to the address, etc.

-- 
dwmw2
