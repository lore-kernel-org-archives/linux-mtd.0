Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MzLO-0002XQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 22:58:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B560681.4D216FF3@sun.com> 
References: <3B560681.4D216FF3@sun.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002 and writes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Jul 2001 23:04:35 +0100
Message-ID: <26325.995493875@redhat.com>
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

thockin@sun.com said:
>  The flash can be erased by 64k blocks.  Since it is flash, you can
> only reprogram '1' bits to '0' bits, and never vice versa.  What I
> don't find is any hooks in cfi_cmdset_0002 to read a whole block,
> erase it, make changes to the in-memory block and write it back to
> flash.

> How/where does it do this? 

It doesn't. Doing that kind of thing is scary and dangerous, and certainly
doesn't belong in the low-level driver. We have real filesystems and
translation layers which work on flash instead.

However, the primitive read/erase/modify/pray_we_don't_lose_power/writeback
behaviour you described is available in the 'mtdblock' driver, and it's sane
enough to use it if you only write to it during setup, then run it normally
in read-only mode.

--
dwmw2
