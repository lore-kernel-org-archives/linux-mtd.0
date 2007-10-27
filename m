Subject: RE: getdents64 problem in 2.6.23
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1193482960.23594.8.camel@gentoo-jocke.transmode.se>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
	<1193482960.23594.8.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Sat, 27 Oct 2007 08:44:29 -0400
Message-Id: <1193489069.2533.23.camel@shinybook.infradead.org>
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


On Sat, 2007-10-27 at 13:02 +0200, Joakim Tjernlund wrote:
> 
> +static int jffs2_release(struct inode *dir_i, struct file *file)
> +{
> +       //struct jffs2_sb_info *c = JFFS2_SB_INFO(dir_i->i_sb);
> +       struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
> +       struct jffs2_full_dirent **prev = &dir_f->dents;
> +
> +       if (atomic_read(&dir_i->i_count))
> +               return 0;

That's certainly what I was thinking -- but do check that it's right.
It's possible that you'll have to do refcounting some other way.

> +       while (*prev) {
> +               D1(printk(KERN_DEBUG "Releasing directory inode:%d\n", (*prev)->ino));
> +
> +               jffs2_free_full_dirent(*prev);
> +               prev = &((*prev)->next);
> +       }

That'll kill _everything_, so if the inode is subsequently reopened
before it's pruned from the icache, it'll appear empty. You were only
supposed to remove the dirents where fd->raw == NULL; the ones which
were acting as 'placeholders' to keep seeks in the directory's opened
filedescriptors working consistently.

-- 
dwmw2
