Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3yP-0007N4-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 11:20:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m34rrlfd3h.fsf@drkitkat.Hispafuentes.com> 
References: <m34rrlfd3h.fsf@drkitkat.Hispafuentes.com> 
To: juan@hispafuentes.com (Juan Ramon Jimenez)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with NAND support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 11:26:17 +0100
Message-ID: <6837.997179977@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


juan@hispafuentes.com said:
>  We only can get a kernel image if we don't enable NAND device
> support.  The problem is that we really need it. Do you know why? 

If you're using raw NAND chips you'll need a tiny board-specific glue 
driver like spia.c to let the generic nand code know how to access the 
chips.

You can't use FTL on it because that's for NOR flash. You can't use NFTL 
because that requires the DiskOnChip ECC hardware, and in many places both 
suffer from patent problems.

You can use JFFS on it, but JFFS2 hasn't yet been made to deal with NAND 
flash - I'm happy to give you pointers if you want to fix that.

I'd also like to see someone write a SmartMedia-compatible translation 
layer driver - that ought to be fairly simple to do too.

--
dwmw2
