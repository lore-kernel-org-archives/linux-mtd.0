Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MkYT-0001iM-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 07:11:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7118259C3044D311942700508B2CA5BB7412DE@balance.coactive.com> 
References: <7118259C3044D311942700508B2CA5BB7412DE@balance.coactive.com> 
To: Mike Voytovich <mvoytovich@coactive.com>
Cc: Steve Kranz <skranz@ridgerun.com>, linux-mtd@lists.infradead.org
Subject: Re: MTD/mtdblock.c uclinux 2.0.38? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Jul 2001 07:16:39 +0100
Message-ID: <18526.995436999@redhat.com>
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

mvoytovich@coactive.com said:
> One big issue is that JFFS2 seems to rely on the dirent cache, which
> isn't present in the 2.0.x kernel.  So, I suppose that would have to
> be backported from 2.2.x (if that's even a reasonable task).  

Wouldn't it be easier to forward-port uCLinux to 2.4? Didn't someone 
already do that, in fact?

> I don't know what other kernel dependencies (besides dirent cache)
> there are for JFFS2...  I wonder if anyone has been successful in
> getting JFFS2 working with 2.0.x??  Any feedback would be
> appreciated...

JFFS1 will be easier. JFFS2 is possible but may be a lot of work. The dcache
thing should be the biggest problem - and that's possible to work around. I 
wouldn't backport the whole of the dcache thing to 2.0 - that would involve 
completely rewriting the VFS. Just provide internally to the JFFS2 code 
sufficient dcache stuff for it to work. Pretend dentries are JFFS2-internal 
data structures. 

--
dwmw2
