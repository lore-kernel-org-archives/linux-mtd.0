Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oGJ-0000n2-DC
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:15:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Gregg C Levine <hansolofalcon@worldnet.att.net>
In-Reply-To: <000001c2fd7e$420dc320$90a0580c@who5>
References: <000001c2fd7e$420dc320$90a0580c@who5>
Message-Id: <1049789725.18045.79.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 09:15:25 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Is this normal?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-04-08 at 04:23, Gregg C Levine wrote:
> so replaced its flakey M-SYS firmware with the GRUB based one.
> Since I have Lilo installed on the drive, as well as a currently
> inactive grub, I half expected to see the Lilo multiple kernel boot
> prompt. Instead I saw the grub menu that I have placed there.

That is indeed normal. Since you removed the M-Systems firmware, there's
nothing to make the DiskOnChip appear as a 'normal' hard drive via the
BIOS 'normal' INT 13h disc access routines. So LILO cannot possibly
work.

> Now the question remains: Any suggestions, again, for constructing
> that image to place on the DOC-2000? And how would I tell the computer
> to boot it, or the resident hard drive?

You are, as ever, very difficult to comprehend. What image to place on
the DOC2000? Format it (with the Grub firmware) with DFORMAT, or with
nftl_format if you must, make an ext2 file system on /dev/nftl, and have
Grub's boot menu boot from the ext2 file system.... what are you
missing?

-- 
dwmw2
