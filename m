Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrYxS-0002u5-9B
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 08:04:12 -0500
Date: Mon, 12 Nov 2007 13:28:52 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Damir Shayhutdinov <lost404@gmail.com>
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
Message-ID: <20071112122852.GA6330@lazybastard.org>
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 November 2007 13:39:02 +0300, Damir Shayhutdinov wrote:
> 
> I'm studying JFFS2 code now, and I believe I've found a kernel memory leak.
> 
> fs/jffs2/erase.c:
> 
> 76         ret = c->mtd->erase(c->mtd, instr);
> 77         if (!ret)
> 78                 return;
> 
> In case of ret == 0 (erase succeeded), line 78 leaves the function
> jffs2_erase_block without kfree-ing previously kmalloc-ed pointer
> instr (line 50).
> 
> So, sizeof(struct erase_info) + sizeof(struct erase_priv_struct) bytes
> are leaking each time block is erased successfully.

Makes 64 Bytes, including kmalloc overhead.  On every successful erase.
David, please apply.

Jörn

-- 
It does not require a majority to prevail, but rather an irate,
tireless minority keen to set brush fires in people's minds.
-- Samuel Adams

Plug memleak in jffs2_erase_block()

Also does a kzalloc conversion, while in the area.

Signed-off-by: Jörn Engel <joern@logfs.org>
Reported-by: Damir Shayhutdinov <lost404@gmail.com>
---

 fs/jffs2/erase.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- linux-2.6.23logfs/fs/jffs2/erase.c~jffs2_erase	2007-08-08 19:30:19.000000000 +0200
+++ linux-2.6.23logfs/fs/jffs2/erase.c	2007-11-12 13:27:03.000000000 +0100
@@ -47,7 +47,7 @@ static void jffs2_erase_block(struct jff
 
 	D1(printk(KERN_DEBUG "jffs2_erase_block(): erase block %#08x (range %#08x-%#08x)\n",
 				jeb->offset, jeb->offset, jeb->offset + c->sector_size));
-	instr = kmalloc(sizeof(struct erase_info) + sizeof(struct erase_priv_struct), GFP_KERNEL);
+	instr = kzalloc(sizeof(struct erase_info) + sizeof(struct erase_priv_struct), GFP_KERNEL);
 	if (!instr) {
 		printk(KERN_WARNING "kmalloc for struct erase_info in jffs2_erase_block failed. Refiling block for later\n");
 		spin_lock(&c->erase_completion_lock);
@@ -59,8 +59,6 @@ static void jffs2_erase_block(struct jff
 		return;
 	}
 
-	memset(instr, 0, sizeof(*instr));
-
 	instr->mtd = c->mtd;
 	instr->addr = jeb->offset;
 	instr->len = c->sector_size;
@@ -72,11 +70,11 @@ static void jffs2_erase_block(struct jff
 	((struct erase_priv_struct *)instr->priv)->c = c;
 
 	ret = c->mtd->erase(c->mtd, instr);
+	bad_offset = instr->fail_addr;
+	kfree(instr);
 	if (!ret)
 		return;
 
-	bad_offset = instr->fail_addr;
-	kfree(instr);
 #endif /* __ECOS */
 
 	if (ret == -ENOMEM || ret == -EAGAIN) {
