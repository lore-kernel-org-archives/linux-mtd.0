Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PI0Bo-0006No-PU
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2010 14:37:59 +0000
Received: by eyd9 with SMTP id 9so2795145eyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2010 06:37:42 -0800 (PST)
Sender: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 15 Nov 2010 17:37:37 +0300
From: Vasiliy Kulikov <segoon@openwall.com>
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-ID: <20101115143735.GA4548@albatros>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
	<20101114202905.GA21614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20101114202905.GA21614@bicker>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 14, 2010 at 23:29 +0300, Dan Carpenter wrote:
> On Sun, Nov 14, 2010 at 11:08:39PM +0300, Vasiliy Kulikov wrote:
> > do_verify_xattr_datum(), do_load_xattr_datum(), load_xattr_datum()
> > and verify_xattr_ref() should return negative value on error.
> > Sometimes they return EIO that is positive.  Change this to -EIO.
> > 
> > Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> > ---
> >  This driver is not compilable, so the patch is not tested.
> > 
> 
> It compiles.

Really?

x86_64, linux-next:

make -C /home/vasya/linux fs/jffs2/xattr.o
make: Вход в каталог `/home/vasya/dev/linux-next'
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CC      fs/jffs2/xattr.o
fs/jffs2/xattr.c: In function ‘unload_xattr_datum’:
fs/jffs2/xattr.c:87: error: ‘struct jffs2_sb_info’ has no member named ‘xdatum_mem_usage’
fs/jffs2/xattr.c: In function ‘reclaim_xattr_datum’: fs/jffs2/xattr.c:105: error: ‘struct jffs2_sb_info’ has no member named
‘xdatum_mem_threshold’ fs/jffs2/xattr.c:105: error: ‘struct jffs2_sb_info’ has no member named
‘xdatum_mem_usage’ fs/jffs2/xattr.c:108: error: ‘struct jffs2_sb_info’ has no member named
‘xdatum_mem_usage’ fs/jffs2/xattr.c:109: error: ‘struct jffs2_sb_info’ has no member named
‘xdatum_mem_usage’ fs/jffs2/xattr.c:110: error: ‘XATTRINDEX_HASHSIZE’ undeclared (first use
in this function) fs/jffs2/xattr.c:110: error: (Each undeclared identifier is reported
only once
fs/jffs2/xattr.c:110: error: for each function it appears in.)


For both defconfig and allyesconfig.

> regards,
> dan carpenter
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Vasiliy
