Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PI45Y-0001fa-Fu
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2010 18:47:42 +0000
Received: by wwc33 with SMTP id 33so380835wwc.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2010 10:47:21 -0800 (PST)
Date: Mon, 15 Nov 2010 21:45:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vasiliy Kulikov <segoon@openwall.com>
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-ID: <20101115184531.GA24643@bicker>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
	<20101114202905.GA21614@bicker> <20101115143735.GA4548@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20101115143735.GA4548@albatros>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 15, 2010 at 05:37:37PM +0300, Vasiliy Kulikov wrote:
> 
> x86_64, linux-next:
> 
> make -C /home/vasya/linux fs/jffs2/xattr.o
> make: Вход в каталог `/home/vasya/dev/linux-next'
        ^^^^^^^^^^^^^^

This means "Entering directory" right?  So /home/vasya/linux is a
symlink to /home/vasya/dev/linux-next.  It still compiles for me
when I create a symlink and use the -C option...

>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CC      fs/jffs2/xattr.o
> fs/jffs2/xattr.c: In function ‘unload_xattr_datum’:
> fs/jffs2/xattr.c:87: error: ‘struct jffs2_sb_info’ has no member named ‘xdatum_mem_usage’
> fs/jffs2/xattr.c: In function ‘reclaim_xattr_datum’: fs/jffs2/xattr.c:105: error: ‘struct jffs2_sb_info’ has no member named
> ‘xdatum_mem_threshold’ fs/jffs2/xattr.c:105: error: ‘struct jffs2_sb_info’ has no member named
> ‘xdatum_mem_usage’ fs/jffs2/xattr.c:108: error: ‘struct jffs2_sb_info’ has no member named
> ‘xdatum_mem_usage’ fs/jffs2/xattr.c:109: error: ‘struct jffs2_sb_info’ has no member named
> ‘xdatum_mem_usage’ fs/jffs2/xattr.c:110: error: ‘XATTRINDEX_HASHSIZE’ undeclared (first use
> in this function) fs/jffs2/xattr.c:110: error: (Each undeclared identifier is reported
> only once
> fs/jffs2/xattr.c:110: error: for each function it appears in.)
> 

It's not pulling in the CONFIG_JFFS2_FS_XATTR=y for some reason.  Is
there an environment variable which it uses to pull in your config
file?  An allyesconfig or an allmodconfig should work.

regards,
dan carpenter
