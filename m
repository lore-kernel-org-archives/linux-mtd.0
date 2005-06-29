Received: from ms-smtp-01-smtplb.ohiordc.rr.com ([65.24.5.135]
	helo=ms-smtp-01-eri0.ohiordc.rr.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dni9P-0005S6-B0
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 15:23:12 -0400
Message-ID: <42C2F99F.8050004@clarionsensing.com>
Date: Wed, 29 Jun 2005 14:42:23 -0500
From: "Brian O'Dell" <brian@clarionsensing.com>
MIME-Version: 1.0
To: Andrew Schultz <alschult@eecs.berkeley.edu>
References: <42C2E2CB.9030404@eecs.berkeley.edu>
In-Reply-To: <42C2E2CB.9030404@eecs.berkeley.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting Linux 2.6 with DiskOnChip 2000 TSOP (INFTL)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Schultz wrote:

> Hello,
>
> I've spent a few days attempting to get a new 256MB DiskOnChip 2000 
> TSOP working properly with Linux 2.6.11.  I have been using the MTD 
> drivers that come with the vanilla version of the kernel and so far I 
> can properly dformat, fdisk, format, and copy the file system so 
> everything is cool with the kernel driver.
>
> However, all my attempts to get grub/lilo/docboot to work in booting 
> of the DOC have been in vain.  My first question is does the current 
> grub patch actually have support for the TSOP (and INFTL devices in 
> general)?  I found two previous posts in 2002 and 2003 
> (http://lists.infradead.org/pipermail/linux-mtd/2003-November/008922.html 
> and 
> http://lists.infradead.org/pipermail/linux-mtd/2003-April/007487.html)
> which seem to be inconclusive about the current support of INFTL 
> devices and grub.
>
I am in a very similar situation.  I can read and write to the DOC 2000 
tsop, but no luck booting to it.

This post by dwmw2 is relevant to our troubles: 
http://lists.infradead.org/pipermail/linux-mtd/2004-December/011098.html

My thinking is that GRUB is out, and doesn't currently work for INFTL 
devices.  I could be dead wrong.  My understanding is that normal grub 
needs to understand the filesystem it is loading the kernel from.  The 
patched grub understands NFTL, but not INFTL. 

I don't think that LILO has this limitation.  I think LILO just loads 
the kernel from a given address, it does not understand filesystems, so 
it may work.  I haven't tried LILO yet.

-bto
