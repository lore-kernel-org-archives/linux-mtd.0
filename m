Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATmsq-0005vU-Gf
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 18:46:58 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: John Stirling <js@reciva.com>
In-Reply-To: <1070992528.25344.23.camel@dobblers.nexus.co.uk>
References: <1070992528.25344.23.camel@dobblers.nexus.co.uk>
Content-Type: text/plain
Message-Id: <1070995502.24447.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 09 Dec 2003 18:45:02 +0000
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

On Tue, 2003-12-09 at 17:55 +0000, John Stirling wrote:
> jffs2_flash_writev is called with vecs[0]=68, vecs[1]=489. This only
> results in one page write even though there is more than 512 bytes of
> data. It is called from jffs2_full_dnode (in write.c).
> alloc_mode=ALLOC_GC. Is this expected operation ? It seems to be causing
> the reported errors.

Yes, it's expected. The remainder should remain in the wbuf, and later
writes will be appended, before it's flushed. It'll also be flushed if
appropriate on sync(), fsync(), umount() etc.

> I have some additional errors - see below. 0x4ac400 corresponds to the
> end of the downloaded jffs2 image (approx 5Mb). The remainder of the
> partition was filled with 0xff (7Mb). Individual page reads and writes
> work fine.

Can you read the entire flash back and give me a dump of it? 

-- 
dwmw2
