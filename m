Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYJpv-0001MA-OJ
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 20:45:36 +0000
Date: Tue, 23 Feb 2016 21:45:11 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: Implement O_TMPFILE
Message-ID: <20160223204510.GA16961@amd>
References: <1456048004-20365-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456048004-20365-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> +	ui = ubifs_inode(inode);
> +
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err)
> +		goto out_inode;
> +
> +	mutex_lock(&ui->ui_mutex);
> +	insert_inode_hash(inode);
> +	d_tmpfile(dentry, inode);
> +	ubifs_assert(ui->dirty);
> +	instantiated = 1;
> +	mutex_unlock(&ui->ui_mutex);
> +
> +	mutex_lock(&dir_ui->ui_mutex);
> +	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
> +	if (err)
> +		goto out_cancel;
> +	mutex_unlock(&dir_ui->ui_mutex);

Move the if () below unlock, and make it goto out_inode?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
