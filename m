Received: from mtagate4.uk.ibm.com ([195.212.29.137])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW5xG-0004F4-95
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 08:55:42 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate4.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m7L8tTGP072896
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 08:55:29 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7L8tTxp4169856
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 09:55:29 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7L8tTwE012737
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 09:55:29 +0100
Message-ID: <48AD2D7F.9070109@de.ibm.com>
Date: Thu, 21 Aug 2008 10:55:27 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: jaredeh@gmail.com
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
References: <48AD0101.4020505@gmail.com>
In-Reply-To: <48AD0101.4020505@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> diff --git a/fs/axfs/axfs_super.c b/fs/axfs/axfs_super.c
> new file mode 100644
> index 0000000..5efab38
> --- /dev/null
> +++ b/fs/axfs/axfs_super.c
> +/***************** functions in other axfs files ***************************/
> +int axfs_get_sb_bdev(struct file_system_type *, int, const char *,
> +		     struct axfs_super *, struct vfsmount *, int *);
> +void axfs_kill_block_super(struct super_block *);
> +int axfs_copy_block(struct super_block *, void *, u64, u64);
> +int axfs_is_dev_bdev(char *);
> +int axfs_map_mtd(struct super_block *);
> +void axfs_unmap_mtd(struct super_block *);
> +int axfs_copy_mtd(struct super_block *, void *, u64, u64);
> +int axfs_get_sb_mtd(struct file_system_type *, int, const char *,
> +		    struct axfs_super *, struct vfsmount *, int *);
> +int axfs_is_dev_mtd(char *, int *);
> +void axfs_kill_mtd_super(struct super_block *);
> +struct inode *axfs_create_vfs_inode(struct super_block *, int);
> +int axfs_get_uml_address(char *, unsigned long *, unsigned long *);
> +int axfs_init_profiling(struct axfs_super *);
> +int axfs_shutdown_profiling(struct axfs_super *);
> +void axfs_profiling_add(struct axfs_super *, unsigned long, unsigned int);
> +struct inode *axfs_create_vfs_inode(struct super_block *, int);
Please put these definitions into a header file.
