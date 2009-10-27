Date: Mon, 26 Oct 2009 22:21:01 -0400
From: Valerie Aurora <vaurora@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 16/41] whiteout: jffs2 whiteout support
Message-ID: <20091027022101.GB14574@shell>
References: <1256152779-10054-9-git-send-email-vaurora@redhat.com>
	<1256152779-10054-10-git-send-email-vaurora@redhat.com>
	<1256152779-10054-11-git-send-email-vaurora@redhat.com>
	<1256152779-10054-12-git-send-email-vaurora@redhat.com>
	<1256152779-10054-13-git-send-email-vaurora@redhat.com>
	<1256152779-10054-14-git-send-email-vaurora@redhat.com>
	<1256152779-10054-15-git-send-email-vaurora@redhat.com>
	<1256152779-10054-16-git-send-email-vaurora@redhat.com>
	<1256152779-10054-17-git-send-email-vaurora@redhat.com>
	<1256165449.22999.19.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1256165449.22999.19.camel@macbook.infradead.org>
Cc: Scott James Remnant <scott@canonical.com>, Felix Fietkau <nbd@openwrt.org>,
	"J. R. Okajima" <hooanon05@yahoo.co.jp>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
	Sandu Popa Marius <sandupopamarius@gmail.com>,
	linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Whitcroft <apw@canonical.com>,
	Vladimir Dronnikov <dronnikov@gmail.com>, Jan Blunck <jblunck@suse.de>,
	Jan Rekorajski <baggins@sith.mimuw.edu.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 22, 2009 at 07:50:49AM +0900, David Woodhouse wrote:
> On Wed, 2009-10-21 at 12:19 -0700, Valerie Aurora wrote:
> > From: Felix Fietkau <nbd@openwrt.org>
> > 
> > Add support for whiteout dentries to jffs2.
> 
> As discussed, there are a few places where JFFS2 will assume that a
> dirent with fd->ino == 0 is a deletion dirent -- a kind of whiteout of
> its own, used internally because it's a log-structured file system and
> it needs to mark previously existing dirents as having been unlinked.
> 
> You're breaking that assumption. So, for example, your whiteouts are
> going to get lost when the eraseblock containing them is garbage
> collected -- because they'll be treated like deletion dirents, which
> only need to remain on the medium for as long as the _real_ dirents
> which they exist to kill.
>
> This completely untested patch addresses some of it.

I think you are right.  Thanks!  I will add JFFS2 to my test suite
before the next release.  Right now I am testing mostly on UML, which
doesn't support the RAM-based MTD emulator as far I can tell.

> The other thing to verify is the three places in dir.c which check
> whether whiteout/rmdir/rename should return -ENOTEMPTY. Those all do so
> by checking whether the directory in question has any dirents with
> fd->ino != 0 -- i.e. does it contain any _real_ dirents, or only the
> deletion markers for dead stuff.
> 
> So that will now be _allowing_ you to remove a directory which contains
> whiteouts, since you haven't changed the test. Is that intentional? It
> seems sane at first glance.

Yes, you should be able to remove a directory which contains only
union mount-level whiteouts.

-VAL

> diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
> index c5e1450..4dc883f 100644
> --- a/fs/jffs2/build.c
> +++ b/fs/jffs2/build.c
> @@ -217,8 +217,9 @@ static void jffs2_build_remove_unlinked_inode(struct jffs2_sb_info *c,
>  			ic->scan_dents = fd->next;
>  
>  			if (!fd->ino) {
> -				/* It's a deletion dirent. Ignore it */
> -				dbg_fsbuild("child \"%s\" is a deletion dirent, skipping...\n", fd->name);
> +				dbg_fsbuild("child \"%s\" is a %s, skipping...\n",
> +					    fd->name,
> +					    (fd->type == DT_WHT)?"whiteout":"deletion dirent");
>  				jffs2_free_full_dirent(fd);
>  				continue;
>  			}
> diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
> index 090c556..7f5afbb 100644
> --- a/fs/jffs2/gc.c
> +++ b/fs/jffs2/gc.c
> @@ -516,7 +516,7 @@ static int jffs2_garbage_collect_live(struct jffs2_sb_info *c,  struct jffs2_era
>  			break;
>  	}
>  
> -	if (fd && fd->ino) {
> +	if (fd && (fd->ino || fd->type == DT_WHT)) {
>  		ret = jffs2_garbage_collect_dirent(c, jeb, f, fd);
>  	} else if (fd) {
>  		ret = jffs2_garbage_collect_deletion_dirent(c, jeb, f, fd);
> @@ -895,7 +895,7 @@ static int jffs2_garbage_collect_deletion_dirent(struct jffs2_sb_info *c, struct
>  				continue;
>  
>  			/* If the name length doesn't match, or it's another deletion dirent, skip */
> -			if (rd->nsize != name_len || !je32_to_cpu(rd->ino))
> +			if (rd->nsize != name_len || (!je32_to_cpu(rd->ino) && rd->type != DT_WHT))
>  				continue;
>  
>  			/* OK, check the actual name now */
> diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
> index ca29440..bcd4b86 100644
> --- a/fs/jffs2/write.c
> +++ b/fs/jffs2/write.c
> @@ -629,8 +629,9 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
>  					printk(KERN_WARNING "Deleting inode #%u with active dentry \"%s\"->ino #%u\n",
>  					       dead_f->inocache->ino, fd->name, fd->ino);
>  				} else {
> -					D1(printk(KERN_DEBUG "Removing deletion dirent for \"%s\" from dir ino #%u\n",
> -						fd->name, dead_f->inocache->ino));
> +					D1(printk(KERN_DEBUG "Removing %s for \"%s\" from dir ino #%u\n",
> +						  (fd->type == DT_WHT)?"whiteout":"deletion dirent",
> +						  fd->name, dead_f->inocache->ino));
>  				}
>  				if (fd->raw)
>  					jffs2_mark_node_obsolete(c, fd->raw);
> 
> 
> -- 
> David Woodhouse                            Open Source Technology Centre
> David.Woodhouse@intel.com                              Intel Corporation
> 
