Received: from wr-out-0506.google.com ([64.233.184.234])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhfrI-00032O-PJ
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 06:57:09 +0000
Received: by wr-out-0506.google.com with SMTP id c46so3586021wra.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Apr 2008 23:57:08 -0700 (PDT)
Message-ID: <9c9fda240804032357i36e7eac0q1c639a017b27af42@mail.gmail.com>
Date: Fri, 4 Apr 2008 15:57:08 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: joern@logfs.org
Subject: Re: [patch 8/15] fs/logfs/inode.c
In-Reply-To: <20080401181332.853833008@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833008@logfs.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>  +
>  +const struct super_operations logfs_super_operations = {
>  +       .alloc_inode    = logfs_alloc_inode,
>  +       .delete_inode   = logfs_delete_inode,
>  +       .destroy_inode  = logfs_destroy_inode,
>  +       .drop_inode     = logfs_drop_inode,
>  +       .read_inode     = logfs_read_inode,
>  +       .write_inode    = logfs_write_inode,
>  +       .statfs         = logfs_statfs,
>  +       .sync_fs        = logfs_sync_fs,
>  +};

Same reason, 'read_inode' is removed.

After some works, it can compile but there's undefined symbols.
WARNING: "swapper_space" [fs/logfs/logfs.ko] undefined!
WARNING: "add_to_page_cache_lru" [fs/logfs/logfs.ko] undefined!
WARNING: "inode_lock" [fs/logfs/logfs.ko] undefined!

Which kernel version do you use?

Thank you,
Kyungmin Park
