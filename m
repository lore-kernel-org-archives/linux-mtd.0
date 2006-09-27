Subject: Re: JFFS2 problem with filename length > 7
From: David Woodhouse <dwmw2@infradead.org>
To: Martin Wedepohl <martinatgd@gmail.com>
In-Reply-To: <67f0a57c0609271418q61d32478jff09b9a15d29e4be@mail.gmail.com>
References: <67f0a57c0609262213j56993210h654450841dcac92f@mail.gmail.com>
	<1159337564.3309.91.camel@pmac.infradead.org>
	<67f0a57c0609271418q61d32478jff09b9a15d29e4be@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 27 Sep 2006 22:35:02 +0100
Message-Id: <1159392902.3309.159.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Curiouser and curiouser. At this point...

> [JFFS2 DBG] (876) jffs2_build_inode_pass1: increased nlink for child "88888888" (ino #9)
> [JFFS2 DBG] (876) jffs2_build_inode_pass1: increased nlink for child "666666" (ino #7)
> [JFFS2 DBG] (876) jffs2_build_inode_pass1: increased nlink for child "7777777" (ino #8)
> [JFFS2 DBG] (876) jffs2_build_inode_pass1: increased nlink for child "999999999" (ino #10)
> [JFFS2 DBG] (876) jffs2_build_inode_pass1: increased nlink for child "aaaaaaaaaa" (ino #11)

... those nodes seem to be perfectly fine. Yet at _this_ point...

> [JFFS2 DBG] (876) jffs2_do_read_inode: read inode #1
> [JFFS2 DBG] (876) jffs2_do_read_inode_internal: ino #1 nlink is 1
> [JFFS2 DBG] (876) jffs2_get_inode_nodes: ino #1
> [JFFS2 DBG] (876) jffs2_get_inode_nodes: read 40 bytes at 0x1c06bc(2).
> [JFFS2 DBG] (876) jffs2_add_fd_to_list: add dirent "aaaa", ino #11
> [JFFS2 DBG] (876) jffs2_get_inode_nodes: read 40 bytes at 0x1c0600(2).
> [JFFS2 DBG] (876) jffs2_add_fd_to_list: add dirent "9999", ino #10
> [JFFS2 DBG] (876) jffs2_get_inode_nodes: read 40 bytes at 0x1c0548(2).
> [JFFS2 DBG] (876) jffs2_add_fd_to_list: add dirent "8888", ino #9
> [JFFS2 DBG] (876) jffs2_get_inode_nodes: read 40 bytes at 0x1c0490(2). 

... they're screwed. The dump you sent looks find -- but can you make it
print what it sees when it reads the node from the flash in
jffs2_get_inode_nodes()? That's where it seems to be screwed.

-- 
dwmw2
