Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DzBJ9-0006vf-Ni
	for linux-mtd@lists.infradead.org; Sun, 31 Jul 2005 06:44:48 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Mirco Fuchs <mircofuchs@web.de>
In-Reply-To: <9370766@web.de>
References: <9370766@web.de>
Content-Type: text/plain
Date: Sun, 31 Jul 2005 14:44:06 +0400
Message-Id: <1122806646.16052.21.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem with AT91RM9200 and intel cfi flash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-07-29 at 12:46 +0200, Mirco Fuchs wrote:
> fs/built-in.o(.text+0x60f3c): In function `jffs2_get_inode_nodes':
> fs/jffs2/readinode.c:252: undefined reference to `__jffs2_dbg_dump_node'
> fs/built-in.o(.text+0x6149c):fs/jffs2/readinode.c:387: undefined reference to `__jffs2_dbg_dump_node'
> make: *** [.tmp_vmlinux1] Fehler 1
Fixed in CVS, please, update.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
