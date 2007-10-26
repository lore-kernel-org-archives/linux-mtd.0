Subject: RE: getdents64 problem in 2.6.23
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <023b01c81824$71647f40$5267a8c0@Jocke>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
Content-Type: text/plain
Date: Fri, 26 Oct 2007 19:17:40 -0400
Message-Id: <1193440660.16168.57.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 2007-10-27 at 01:03 +0200, Joakim Tjernlund wrote:
> Is this what you mean(just a stupid hack for now)?
>           //*prev = this->next;
>             jffs2_mark_node_obsolete(c, (this->raw));
>             this->raw = NULL;
>           //jffs2_free_full_dirent(this);

Yeah, something like that. And we also need to modify
jffs2_add_fd_to_list() so that if we later add a new dirent which
_replaces_ this one, it doesn't oops after calling
jffs2_mark_node_obsolete(c, fd->raw);

> Perhaps add a jffs2_add_fd_to_list(c, this, &dir_f->dents)?

Nah, no need for that. It's already _in_ the list.

> How do I find where the filedescriptor is closed?

We probably need to implement a release() operation in the
jffs2_dir_operations (top of dir.c), which will remove the fake
'deletion' dirents if !atomic_read(&inode->i_count). Or something like
that.

-- 
dwmw2
