Received: from mtagate7.de.ibm.com ([195.212.29.156])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGVVK-0000Dx-ET
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 03:53:56 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate7.de.ibm.com (8.13.8/8.13.8) with ESMTP id l727rm8T118436
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 07:53:48 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l727rmlc2207864
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 09:53:48 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l727rlI9004186
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 09:53:48 +0200
Message-ID: <46B18D89.1010207@de.ibm.com>
Date: Thu, 02 Aug 2007 09:53:45 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
In-Reply-To: <6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> References to what? pages? pfn's?
Currently we use struct page in our address space operation, but 
moving to pfn seems advisable to me.

> Assume we need to erase a block, this definately requires that all
> pages in that block be 'zapped'.
True.

> With most flashes the erase operation takes chunks of the array larger
> than the effected block offline temporarily.  Right now XIP support in
> MTD just spins waiting for an interrupt.  When one is recieved the
> erase is suspended and normal execution continues with just the block
> being erased in an unknown state.  Then when the coast is clear the
> erase is resumed.
That does'nt work on smp machines, does it? Sounds like a hack to me.

> So we have a large number of pages that are not being changed but that
> are not availiable for some time.  I think it would be much better to
> identify those pages that will be taken offline and change the page
> tables such that a fault can be directed to the FS and then to the MTD
> to do the suspend.
> 
> The reason would be fault avoidance.  See once the erase completes all
> the old valid pages should be mapped back as they were.  Why not allow
> the kernel to continue (assuming it isn't taken offline!) executing as
> normal and why interrupt the erase until you know for sure you need to
> access effected pages?
How do you know a user app that has a valid pte to your flash media 
accesses it? Userspace may do so at any time it wants, and as far as I 
understand Joerns and Davids explanations on flash it will just see 
invalid data rather than raising a page fault.
