Received: from dsl-62-3-66-203.zen.co.uk
	([62.3.66.203] helo=crown.nexus.co.uk ident=foobar)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AUNNw-0002vg-TO
	for <linux-mtd@lists.infradead.org>; Thu, 11 Dec 2003 09:45:30 +0000
From: John Stirling <js@reciva.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1071061636.25344.70.camel@dobblers.nexus.co.uk>
References: <1070992528.25344.23.camel@dobblers.nexus.co.uk>
	 <1070995502.24447.2.camel@imladris.demon.co.uk>
	 <1071053801.25344.43.camel@dobblers.nexus.co.uk>
	 <1071054191.5712.204.camel@hades.cambridge.redhat.com>
	 <1071061636.25344.70.camel@dobblers.nexus.co.uk>
Content-Type: text/plain
Message-Id: <1071135724.25344.165.camel@dobblers.nexus.co.uk>
Mime-Version: 1.0
Date: 11 Dec 2003 09:42:05 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2/nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've done some further investigation on this.

The problem I was seeing was caused by a call to jffs2_full_dnode (in
write.c, alloc_mode=ALLOC_GC). This leaves stuff in the write_buf, but
never gets round to actually writing it to flash unless another write
happens in the meantime. 

When I copy a file the flushing procedure seems to work. I see an
initial page write, followed a couple of seconds later by another write
of the remaining stuff in the write_buf. However, following this, more
stuff remains in the write_buf, which again never gets written to flash
and produces errors again when the kernel is rebooted.

As an experiment i removed the checked for ino!=0 at the end of
jffs2_flash_writev
ie
replaced 
if (c->wbuf_len && ino)
  jffs2_wbuf_dirties_inode(c, ino);
with
if (c->wbuf_len)
  jffs2_wbuf_dirties_inode(c, ino);

Having done this, almost all the reported errors disappeared next time I
rebooted. 

Also, I noticed that having copied a few files manually then some of the
errors disappeared. 

So, is it possible that the errors that are being reported are not
really errors and will get cleaned up via garbage collection at some
point. If so, then it would be nice if they weren't reported are
errors..






On Wed, 2003-12-10 at 13:07, John Stirling wrote:
> > Not fsync() but a flush should happen then, yes.
> > 
> > Compile with CONFIG_JFFS2_FS_DEBUG=1.  Run 'sync' after writing your
> > file. Show me the output.
> > 
> 
> See extract from kernel log below. Setting FS_DEBUG=1 didn't seem to
> produce any more debug info. sync didn't cause a further page write..
> 
> 
> 
