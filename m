Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1796dR-0008Li-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 17:00:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020517161920.75017.qmail@web21505.mail.yahoo.com> 
References: <20020517161920.75017.qmail@web21505.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 18 May 2002 17:00:44 +0100
Message-ID: <23649.1021737644@redhat.com>
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

studying_mtd@yahoo.com said:
> A. FAT: filesystem driver 
> B. Translation: translation layer on the NAND flash to
> make it emulate a normal hard drive
> C. MTD: Memory Technology Devices driver (MTD Block)
> D. NAND: generic NAND driver
> E. Hardware specific driver (Plus NFTL)

No. NFTL _is_ the translation layer in (B). The SmartMedia format could be
used in its place. The other list you gave looks more like the existing 
situation.

However, in neither list is item 'C' correct. Neither the 'mtdblock' nor 
'mtdchar' code is involved at all. NFTL or the SmartMedia code talks 
directly to the MTD device provided by the NAND code.

--
dwmw2
