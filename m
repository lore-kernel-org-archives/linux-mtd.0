Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17k3qw-0004Kq-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 15:31:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1030544853.3d6cddd5501b2@imp.free.fr> 
References: <1030544853.3d6cddd5501b2@imp.free.fr> 
To: olivier.eribon@free.fr
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de
Subject: Re: Cannot remove child on JFFS2 FS with latest CVS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 28 Aug 2002 15:31:23 +0100
Message-ID: <14081.1030545083@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

olivier.eribon@free.fr said:
>  Now with latest CVS Aug 28 2002, and 2.4.17 linux kernel on a
> specific  board (ppc405gp with a nand flash : Toshiba TC58256FT/DC),
> I have always the same message :

> Cannot remove child "fileXXX", ino #0, because it doesn't exist 

You don't have the latest code. Check the $Id$ tag in fs/jffs2/build.c.

 * $Id: build.c,v 1.38 2002/08/23 12:21:36 dwmw2 Exp $


Note the check of fd->ino which was added the first time this was reported:

		while(ic->scan->dents) {
			struct jffs2_inode_cache *child_ic;

			fd = ic->scan->dents;
			ic->scan->dents = fd->next;

			if (!fd->ino) {
				/* It's a deletion dirent. Ignore it */
				D1(printk(KERN_DEBUG "Child \"%s\" is a deletion dirent, skipping...\n", fd->name));
				jffs2_free_full_dirent(fd);
				continue;
			}
			if (!whinged) {
				whinged = 1;
				printk(KERN_NOTICE "Inode #%u was a directory with children - removing those too...\n", ic->ino);
			}

			D1(printk(KERN_DEBUG "Removing child \"%s\", ino #%u\n",
				  fd->name, fd->ino));
			
			child_ic = jffs2_get_ino_cache(c, fd->ino);
			if (!child_ic) {
				printk(KERN_NOTICE "Cannot remove child \"%s\", ino #%u, because it doesn't exist\n", fd->name, fd->ino);
				jffs2_free_full_dirent(fd);
				continue;
			}
			jffs2_free_full_dirent(fd);
			child_ic->nlink--;
		}
--
dwmw2
