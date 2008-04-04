Received: from wr-out-0506.google.com ([64.233.184.231])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhfJm-0001gE-1P
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 06:22:30 +0000
Received: by wr-out-0506.google.com with SMTP id c46so3571608wra.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Apr 2008 23:22:28 -0700 (PDT)
Message-ID: <9c9fda240804032322x7316ff78lee646d22cb66178a@mail.gmail.com>
Date: Fri, 4 Apr 2008 15:22:20 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: joern@logfs.org
Subject: Re: [patch 5/15] fs/logfs/dir.c
In-Reply-To: <20080401181332.853833005@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833005@logfs.org>
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

Hi,

It's just quick view
>  +
>  +static int logfs_lookup_handler(struct inode *dir, struct dentry *dentry,
>  +               struct logfs_disk_dentry *dd, loff_t pos, void *arg)
>  +{
>  +       struct inode *inode;
>  +
>  +       inode = iget(dir->i_sb, be64_to_cpu(dd->ino));
>  +       if (!inode)
>  +               return -EIO;
>  +       return PTR_ERR(d_splice_alias(inode, dentry));
>  +}
>  +

The latest kernel doesn't have iget anymore. I saw some files use the
logfs_iget but dir.c, readwrite.c, ... uses the iget directly.
Please update this one.

Thank you,
Kyungmin Park
