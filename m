Received: from nz-out-0506.google.com ([64.233.162.228])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrWh9-0002uY-Hn
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 05:39:13 -0500
Received: by nz-out-0506.google.com with SMTP id z3so777918nzf
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Nov 2007 02:39:03 -0800 (PST)
Message-ID: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
Date: Mon, 12 Nov 2007 13:39:02 +0300
From: "Damir Shayhutdinov" <lost404@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm studying JFFS2 code now, and I believe I've found a kernel memory leak.

fs/jffs2/erase.c:

76         ret = c->mtd->erase(c->mtd, instr);
77         if (!ret)
78                 return;

In case of ret == 0 (erase succeeded), line 78 leaves the function
jffs2_erase_block without kfree-ing previously kmalloc-ed pointer
instr (line 50).

So, sizeof(struct erase_info) + sizeof(struct erase_priv_struct) bytes
are leaking each time block is erased successfully.
