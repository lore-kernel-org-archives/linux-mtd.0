Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnN6H-0006d6-JX
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 07:07:37 +0000
Date: Thu, 22 May 2014 00:06:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: ravibhuva9955@gmail.com
Subject: Re: [Bug 76701] New: Page Allocation failure during mount operation
Message-Id: <20140522000634.65031979.akpm@linux-foundation.org>
In-Reply-To: <bug-76701-27@https.bugzilla.kernel.org/>
References: <bug-76701-27@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, bugzilla-daemon@bugzilla.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

On Thu, 22 May 2014 06:35:38 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=76701
> 
>             Bug ID: 76701
>            Summary: Page Allocation failure during mount operation
>            Product: Memory Management
>            Version: 2.5
>     Kernel Version: 2.6.37
>           Hardware: ARM
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Page Allocator
>           Assignee: akpm@linux-foundation.org
>           Reporter: ravibhuva9955@gmail.com
>         Regression: No
> 
> Created attachment 137081
>   --> https://bugzilla.kernel.org/attachment.cgi?id=137081&action=edit
> Mount Error Logs
> 
> Hello Friends,
> 
> I am mounting configuration partition(NAND) during firmware upgrade and commit
> operations. And some times, I am getting error of mount failure and some of
> logs in syslog and dmesg(attached).
> 
> So how to resolve this issue?

Jun 11 19:54:21 GJ-90012 user.warn kernel: mount: page allocation failure. order:5, mode:0x40d0
Jun 11 19:54:21 GJ-90012 user.warn kernel: Backtrace: 
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c0052078>] (dump_backtrace+0x0/0x110) from [<c04dc338>] (dump_stack+0x18/0x1c)
Jun 11 19:54:21 GJ-90012 user.warn kernel:  r6:00000001 r5:00000005 r4:000040d0 r3:60000013
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c04dc320>] (dump_stack+0x0/0x1c) from [<c00b0440>] (__alloc_pages_nodemask+0x4fc/0x560)
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c00aff44>] (__alloc_pages_nodemask+0x0/0x560) from [<c00b04bc>] (__get_free_pages+0x18/0x34)
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c00b04a4>] (__get_free_pages+0x0/0x34) from [<c00ce590>] (__kmalloc+0x3c/0xc0)
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c00ce554>] (__kmalloc+0x0/0xc0) from [<c0231d98>] (jffs2_scan_medium+0xdc/0x119c)
Jun 11 19:54:21 GJ-90012 user.warn kernel:  r8:c0237228 r7:00020000 r6:ea6e1200 r5:00000000 r4:ea6e1c00
Jun 11 19:54:21 GJ-90012 user.warn kernel: r3:00000004
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c0231cbc>] (jffs2_scan_medium+0x0/0x119c) from [<c0234bf0>] (jffs2_do_mount_fs+0x180/0x59c)
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c0234a70>] (jffs2_do_mount_fs+0x0/0x59c) from [<c0236d80>] (jffs2_do_fill_super+0x154/0x238)
Jun 11 19:54:21 GJ-90012 user.warn kernel:  r8:c0237228 r7:00020000 r6:ea6e1200 r5:00000000 r4:ea6e1c00
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c0236c2c>] (jffs2_do_fill_super+0x0/0x238) from [<c02372e4>] (jffs2_fill_super+0xbc/0xdc)
Jun 11 19:54:21 GJ-90012 user.warn kernel:  r7:00000000 r6:00000001 r5:ea6e1c00 r4:ea6e1200
Jun 11 19:54:21 GJ-90012 user.warn kernel: [<c0237228>] (jffs2_fill_super+0x0/0xdc) from [<c0312944>] (mount_mtd_aux.clone.0+0x50/0xd4)

I'm not seeing mtd_kmalloc_up_to() in the backtrace, but that might be
a post-2.6.37 change.

Perhaps mtd_kmalloc_up_to() should be including __GFP_NOWARN in its
final kmalloc attemot, but that won't help you.

As for why the mount actually fails I cannot say - hopefully the fs
isn't dependent upon the success of an order-5 page allocation?
