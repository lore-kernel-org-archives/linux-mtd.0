Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2onQ-0007lr-G7
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 19:02:41 +0000
Message-ID: <1330542157.13689.17.camel@joe2Laptop>
Subject: Re: [PATCH 0/4] jffs2: logging message neatening
From: Joe Perches <joe@perches.com>
To: dedekind1@gmail.com
Date: Wed, 29 Feb 2012 11:02:37 -0800
In-Reply-To: <1330517290.3545.107.camel@sauron.fi.intel.com>
References: <cover.1329349881.git.joe@perches.com>
 <1330517290.3545.107.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-02-29 at 14:08 +0200, Artem Bityutskiy wrote:
> On Wed, 2012-02-15 at 15:56 -0800, Joe Perches wrote:
> > Joe Perches (4):
> >   jffs2: Convert most D1/D2 macros to jffs2_dbg
> >   jffs2: Convert printks to pr_<level>
> >   jffs2: Use pr_fmt and remove jffs: from formats
> >   jffs2: Standardize JFFS_<LEVEL> uses
> 
> Thanks for the work, appreciated. But your patch introduces new sparse
> and smatch warnings, which did not exist before your patch:

Hello Artem.

> Successfully built configuration "l2_mxs_defconfig,arm,arm-unknown-linux-gnueabi-", results:
> 
> --- before_patching.log
> +++ after_patching.log 
> @@ @@
> +fs/jffs2/file.c:330:2: warning: signed and unsigned type in conditional expression [-Wsign-compare]
> @@ @@
> -fs/jffs2/read.c:154 jffs2_read_dnode(129) warn: possible memory leak of 'decomprbuf' [smatch]
> -fs/jffs2/read.c:154 jffs2_read_dnode(129) warn: possible memory leak of 'readbuf' [smatch]
> +fs/jffs2/read.c:154 jffs2_read_dnode(131) warn: possible memory leak of 'decomprbuf' [smatch]
> +fs/jffs2/read.c:154 jffs2_read_dnode(131) warn: possible memory leak of 'readbuf' [smatch]
> @@ @@
> -fs/jffs2/scan.c:108:54: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
> @@ @@
> +fs/jffs2/super.c:377:1: error: directive in argument list [sparse]
> +fs/jffs2/super.c:379:1: error: directive in argument list [sparse]
> +fs/jffs2/super.c:380:1: error: directive in argument list [sparse]
> +fs/jffs2/super.c:382:1: error: directive in argument list [sparse]

I don't see how this is a new error.
printk vs pr_info shouldn't change this.
maybe it's a smatch issue?


> Would you please take a look? Ideally patches should eliminate warnings,
> not introduce new ones.

I believe this simply exposes a current defect rather than
adds "new" ones.  It seems the old D1/D2 macros hide them.

> Also, your patch does not apply cleanly to my l2-mtd tree - and this is
> the tree which is currently used for merging MTD and JFFS2 stuff
> upstream, and it is in linux-next as well. Would you send patches
> against the l2 tree?

This patchset applies cleanly against next-20120229
Where is your git tree?

cheers, Joe
