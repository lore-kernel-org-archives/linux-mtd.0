Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By7Tp-0005vM-6k
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 07:22:48 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Fri, 20 Aug 2004 13:27:16 +0200
References: <200408201300.05579.gruber.m@utanet.at>
	<200408201315.01078.gruber.m@utanet.at>
	<1093000400.14552.3411.camel@hades.cambridge.redhat.com>
In-Reply-To: <1093000400.14552.3411.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200408201327.16211.gruber.m@utanet.at>
Subject: Re: Number of CFI chips ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 20. August 2004 13:13 schrieben Sie:
> On Fri, 2004-08-20 at 13:15 +0200, Manfred Gruber wrote:
> > phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
>
> It found two devices, in a pair. After that, it treats them as one
> 'chip' because they're interleaved and so they do everything together.
>
> > number of CFI chips: 1
>
> That really means one interleaved _pair_ of chips.

OK.

But the output of device size and erase size?
When it should be then seen as one chips, why is  erase size 0x10000 and 
device size 0x200000 ?? That for one chip ....

thanks, regrads manfred 
