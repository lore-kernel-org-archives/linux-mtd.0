Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bdVO-0006nK-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 09:18:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000001c2c287$ffa8eef0$800b040f@bergamot> 
References: <000001c2c287$ffa8eef0$800b040f@bergamot> 
To: "Christopher Hoover" <ch@murgatroid.com>
Cc: "'Frank Becker'" <fbecker@intrinsyc.com>,
    linux-arm-kernel@lists.arm.linux.org.uk,
    "'linux-mtd'" <linux-mtd@lists.infradead.org>, akpm@digeo.com,
    linux-kernel@vger.kernel.org
Subject: Re: 2.5.55-rmk1: user space lossage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 23 Jan 2003 09:48:23 +0000
Message-ID: <15943.1043315303@passion.cambridge.redhat.com>
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

 < Snip long thread about init segfaulting immediately at boot on 2.5.55 >

ch@murgatroid.com said:
> I just dropped jffs2 from 2.5.52 into 2.5.55 and it works, too.

ch@murgatroid.com said:
> Aha!  This is the problem: 
> -       .mmap =         generic_file_mmap,
> +       .mmap =         generic_file_readonly_mmap,
> If you reverese this change, 2.5.55-rmk1 behaves.

Er, yes. generic_file_readonly_mmap() silently removed the VM_MAYWRITE bit 
from vma->vm_flags when init made a _PRIVATE_ writable mapping, apparently 
on the basis that we have no writepage().

Then we return success anyway.

Then init segfaults when it touches something in that mapping.

/me blames akpm. :)

--
dwmw2
