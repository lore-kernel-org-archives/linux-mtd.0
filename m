Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgIxA-0005Bg-DE
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 00:07:27 +0000
Date: Fri, 20 Jul 2018 01:04:31 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] jffs2: Provide jffs2_sync files to track gc POLL
 progress
Message-ID: <20180720000431.GA30522@ZenIV.linux.org.uk>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 20, 2018 at 11:50:12AM +1200, Theuns Verwoerd wrote:

> +ssize_t jffs2_sync_file_read(struct file *f,
> +	      char __user *b, size_t len, loff_t *ofs)
> +{
> +	struct jffs2_sb_info *c = file_inode(f)->i_private;
> +
> +	while (c->tidemark)
> +		schedule();
> +
> +	return 0;
> +}

Brilliant.  So when that gets called with c->tidemark being true and
need_resched() - false, we shall...

Bonus question: what happens if that is called after that jffs2_sb_info
gets freed?

--
It Doesn't Need To Make Sense - It's For Security Purposes.
