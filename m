Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrYRH-0000s7-6G
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 07:30:57 -0500
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Damir Shayhutdinov <lost404@gmail.com>
In-Reply-To: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 12 Nov 2007 13:30:49 +0100
Message-Id: <1194870649.4029.37.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-11-12 at 13:39 +0300, Damir Shayhutdinov wrote:
> Hi!
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

Nope, instr is freed in jffs2_erase_callback() in this case.

 Jocke
