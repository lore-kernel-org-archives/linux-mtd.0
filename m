Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBXKh-0002FC-Qj
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2005 07:09:05 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <Sergei.Sharonov@Halliburton.com>
In-Reply-To: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
References: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
Content-Type: text/plain
Date: Wed, 16 Mar 2005 15:08:26 +0300
Message-Id: <1110974906.30606.38.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: failed write verify causes segmentation fault
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

It is difficult to me to say what's going wrong without an additional
information. The following are my thoughts.

> Writing 10000000 bytes.. nand_verify_pages: Failed write verify, 
> page 0x00013dfd <5>Write of 4164 bytes at 0x09efe1bc failed. retur4
> jffs2_flash_writev(): Non-contiguous write to 09eff200
> Unable to handle kernel NULL pointer dereference at virtual 
This is odd. If you take a glimpse to the corresponding code in fs/jffs2/wbuf.c,
you'll find:

        if (to != PAD(c->wbuf_ofs + c->wbuf_len)) {
                /* We're not writing immediately after the writebuffer. Bad. */
                printk(KERN_CRIT "jffs2_flash_writev(): Non-contiguous write to %08lx\n", (unsigned long)to);
                if (c->wbuf_len)
                        printk(KERN_CRIT "wbuf was previously %08x-%08x\n",
                                          c->wbuf_ofs, c->wbuf_ofs+c->wbuf_len);
                BUG();
        }

I don't see any reason why the NULL dereferencing might happen after the
"jffs2_flash_writev(): Non-contiguous write to.." output. BUG()
should be called instead.

The fact that the "if (to != PAD(c->wbuf_ofs + c->wbuf_len)" condition fails
implies that something goes wring. This means that a write operation is made
the wrong place, not the page which is currently being represented by the write buffer.

> Seems that when (eventually) write verify failed the system could not 
> handle it graciously. Has anybody seen this before?
This is only one possible reason. The other possible reason which I
think is more likely has happened in your case is that JFFS2 tried to
write to a non-empty NAND page, e.g., the page didn't contain all 0xFF.
In this case write_verify() might fail as well. I don't know why JFFS2
might do that, possibly there is some bug.

I'd suggest you to debug JFFS2. You might try to do the following
things.

1. Before writing anything, check that the target NAND page is empty.
For this purpose you might insert the corresponding checking code at
wbuf.c:466 (__jffs2_flush_wbuf() function). The line number must be
valid for the last MTD snapshot ($Id: wbuf.c,v 1.89 2005/02/09 09:23:54
pavlov Exp $.). All writes pass this functions in case of NAND flash.

To read a page you may insert something like this:
char testbuf[2048];
memset(testbuf, '\0', 2048);
jffs2_flash_read(c, c->wbuf_ofs, c->wbuf_pagesize, &retlen, &testbuf
[0]);

Then check that testbuf[] contains all 0xFF.

2. Insert printk's in different places. You might enable the Level 1
jffs2 debug output. But this will be too noisy.

You might alternatively introduce some variable like 'int
_shit_have_happened_' and export it.

Redefine D1() to something like:

#define D1(x) { if (_shit_have_happened_) { x; } }

Set _shit_have_happened_ to 1 in nand_verify_page if an error happened,
or in __jffs2_flush_wbuf() if you've found that you write to non-empty
NAND page and the like.

This might help.

I wonder does something like this happens in case of normal
temperatures? Might something except NAND get crazy ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
