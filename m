Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178ys8-0007fM-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 08:43:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF40@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF40@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel oops after sync command in jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 18 May 2002 08:43:23 +0100
Message-ID: <11464.1021707803@redhat.com>
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

fgiasson@mediatrix.com said:
>  When the oops happen, the do_erase_oneblock() function if
> cfi_cmdset_0002.c complains that DQ5 has been asserted to "1" while
> the flash was still erasing, meaning that a program command has been
> attempted.  

> So I examined the chip driver to see if there were a gap in the mutual
> exclusion of the chip access.  I found that function
> cfi_amdstd_write() send unlock bypass command to the flash without
> verifying if the flash is ready first, if cfi->fast_prog is true.  I
> tryied to disable fast_prog in cfi_probe.c, and the oops did not
> happen again.  It sound like it were the problem, although I am not
> 100% sure yet.

Thanks. I've disabled fast programming mode completely, until the code gets 
fixed. 

That should have just caused an I/O error though; not an oops.


--
dwmw2
