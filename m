Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14y2Xn-00011n-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2001 03:20:40 +0100
Message-ID: <3AFB4A69.910152C8@sis.com.tw>
Date: Fri, 11 May 2001 10:11:53 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Jimmy Brian Christanthio <jimmy@soft-v.com>, linux-mtd@lists.infradead.org
Subject: Re: Fw: nftl
References: <006a01c0d935$338c9840$223975cb@softdqxcunjyu6> <11739.989488574@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> jimmy@soft-v.com said:
> > Our system is the VR4121 using the Intel Strata Flash. If we use your code
> > to establish a sector of 1MB as a drive, can we also have XIP on it?
> > That is, can we execute on the flash instead of from the SDRAM?
> 
> You cannot use NFTL on that. Technically, you could use FTL, but in some
> countries patents may prevent you from doing so. If you want a writable
> filesystem, JFFS is probably the best bet.
> 
> We don't yet have support for XIP. It would require a special filesystem
> which aligns pages of the files at page-aligned addresses in the flash
> chips. In general, compression is far more useful than XIP, because RAM is
> cheaper than flash, so nobody's yet implemented this.
> 
> I started hacking on such an xipfs once. I don't recall how far I got with
> it - you're welcome to a copy of that if you want it, although I suspect
> you'd to better to start with a clean copy of romfs and do it again.
> 
> If you require a _writable_ filesystem, it's going to be extremely
> difficult to do XIP.
> 

Agenda PDA seems to have XIP CRAMfs. You probably should take a look
at that.

Ollie
