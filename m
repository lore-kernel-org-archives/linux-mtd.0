Received: from ip67-153-123-160.z123-153-67.customer.algx.net
	([67.153.123.160] helo=calypsoo.voxware.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5FLg-0000xP-7u
	for linux-mtd@lists.infradead.org; Sat, 26 Feb 2005 22:44:05 -0500
Message-ID: <422141F8.7050707@voxware.com>
Date: Sat, 26 Feb 2005 22:43:52 -0500
From: "Craig A. Vanderborgh" <craigv@voxware.com>
MIME-Version: 1.0
To: dedekind@infradead.org,  linux-mtd@lists.infradead.org
References: <1109444967.4688.19.camel@sauron.oktetlabs.ru>
In-Reply-To: <1109444967.4688.19.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [BUGFIX] JFFS2 NOR problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

>Hello,
>
>I've detected major JFFS2 bug and have attached the fix. The bug seems
>to be NOR-only. I believe everybody who uses JFFS2 on top of NOR flash
>should have this bug fixed.
>
>The brief problem description:
>
>JFFS2 clears the JFFS2_SB_FLAG_MOUNTING (c-flags) superblock flag after
>it has done the 1st filesystem build pass. But it still has non NULL
>ic->scan_dents pointers which are actually assigned NULL at the very end
>of the file system build procedure. Next FS build passes call the
>jffs2_mark_node_obsolete() function which, in turn, utilizes the
>jffs2_raw_ref_to_ic() function which *requires* ic->scan_dents = NULL.
>
>This might cause infinite loops and oopses.
>
>I think it is safe to clear the JFFS2_SB_FLAG_MOUNTING flag at the end
>of JFFS2 filesystem build routine. Comments?
>
>P.S. Possibly, the patch will fix Konstantin Kletschke's and Craig A.
>Vanderborgh's problems. Guys, please try.
>
>  
>
>------------------------------------------------------------------------
>
>--- build.c	2005-02-26 22:08:17.503657749 +0300
>+++ build.c_fixed	2005-02-26 22:07:55.806278357 +0300
>@@ -116,7 +116,6 @@
> 			cond_resched();
> 		}
> 	}
>-	c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
> 
> 	D1(printk(KERN_DEBUG "Pass 1 complete\n"));
> 
>@@ -164,6 +163,8 @@
> 		ic->scan_dents = NULL;
> 		cond_resched();
> 	}
>+	c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
>+
> 	D1(printk(KERN_DEBUG "Pass 3 complete\n"));
> 	D2(jffs2_dump_block_lists(c));
> 
>  
>
Hello Artem:

Thank you for taking pity on us :^)

I have succeeded in resolving the oops that I reported in 2 different ways:

1. I applied your patch to the "vanilla" 2.6.10 sources.  To test, I 
compiled and
installed the modified kernel, and had it mount a large (~7MB) JFFS2 
root filesystem
that was "virginal".  This works.  Previously, it was this very same 
testing procedure
that produced a kernel oops "every time".

2. Before receiving your patch, I back-ported the 2.6.11-rc5 sources for 
fs/jffs2
(and the required related header files). I tested using the same 
procedure mentioned
above, and this also works.

Would you please comment on this:  which solution do you think is the 
better one?  Now that we have the newer MTD code working in the 
otherwise "vanilla" 2.6.10 kernel, is this the best solution?  Or is the 
build.c patch solution the safer bet for us?

Please advise.

Thanks a lot for looking into this, we REALLY appreciate it and it's 
great to be fully operational on kernel 2.6!!

Best regards,
craig vanderborgh
voxware incorporated
The 4th Reich
