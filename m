Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160sU9-0006rb-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 22:44:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <007c01c1662c$3e1767c0$456c020a@SENSORIA> 
References: <007c01c1662c$3e1767c0$456c020a@SENSORIA> 
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 support for a custom PPC750 board 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Nov 2001 22:54:13 +0000
Message-ID: <31265.1005000853@redhat.com>
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

baoha@sensoria.com said:
>  Can the firmware boot into LILO directly?  Or it requires the patched
> lilo-mtd in the patches subdirectory?

> I have been under the impression that you need lilo-mtd to boot the
> DiskOnChip.  However, the lilo-mtd patch is dated March of 2000. 

I've never used the patched LILO, but I believe the only changes are that 
it recognises the 'root=/dev/nftla' device and sets the device number 
accordingly, and that it can deal with the fact that the M-Systems BIOS 
extension has eaten a huge chunk of sub-640K RAM. The latter may no longer 
be required with a newer LILO anyway, and the former can be worked around 
by using 'append="root=/dev/nftla"' instead of just 'root=', just as with 
other device names that LILO doesn't know about.


--
dwmw2
