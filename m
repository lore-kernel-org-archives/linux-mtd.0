Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZfnO-0005JX-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:48:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <c5e41c5a4b.sbrodie@sbrodie.cam.pace.co.uk> 
References: <c5e41c5a4b.sbrodie@sbrodie.cam.pace.co.uk> 
To: Stewart Brodie <stewart.brodie@pace.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 failing to use zlib to compress things 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:48:49 +0100
Message-ID: <15147.1028069329@redhat.com>
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

stewart.brodie@pace.co.uk said:
> I have been having problems with mkfs.jffs2 (with the fs/jffs2 files
> from a MIPS Linux 2.4.17 kernel) not compressing files as it
> constructs the filesystem image.  I have no idea whether this will
> affect the run-time behaviour or not - I've not got that far.  After
> inserting debugging into the compression routines, it appears that
> Z_STREAM_ERROR streaming errors are occurring when the data is being
> passed through zlib, and thus the simple rtime compression is being
> used instead.

> It looks like mkfs.jffs2 is driving zlib's compression routines in a
> bizarre way (c.f. the decompression which uses a trivial loop) passing
> only small blocks of data at a time.  Is that loop correct?  Why is
> Z_PARTIAL_FLUSH being used?  The errors I get are all "final deflate
> returned -2".

> Any ideas what might be causing this? 

We compress only a page of data at a time, so we can get at them easily on 
demand without having to decompress a larger stream and discard some of the 
result. Normally, we do only one call to zlib_deflate() with 
Z_PARTIAL_FLUSH, which manages to deflate the entire input buffer. Then we 
try to do the Z_FINISH. I don't know why that would cause an error.

This is the same code as we use in the kernel though -- so it's possible 
that the same error is occurring there.

--
dwmw2
