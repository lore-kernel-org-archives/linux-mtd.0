Received: from codepoet.org
	([166.70.99.138] helo=winder.codepoet.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GHlA-0008Md-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 11:50:40 +0000
Date: Mon, 25 Nov 2002 05:21:10 -0700
From: Erik Andersen <andersen@codepoet.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c rework
Message-ID: <20021125122110.GC18046@codepoet.org>
Reply-To: andersen@codepoet.org
References: <20021125111843.GA17562@codepoet.org> <1319.1038224945@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319.1038224945@passion.cambridge.redhat.com>
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

On Mon Nov 25, 2002 at 11:49:05AM +0000, David Woodhouse wrote:
> Anyway, page size isn't even always 16KiB on IA64 either, is it? Stick to 
> 4KiB default -- it's safer. If you know the target system has a larger page 
> size, you can specify it on the command line. Same logic as keeping the 
> erase size small by default.
> 
> How about changing cpu_to_target32() et al. to be cpu_to_je32() to match the 
> JFFS2 code?

I've got these changes done.  Shall I check it in?  Adding
support for cleanmarkers can be done soon (after I get a chance
to read that part of the kernel code).  For now, it can wait till
I've had a chance to finish adding device table support to
mkcramfs (which is what got me started rewriting things this time
around ;-)

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
