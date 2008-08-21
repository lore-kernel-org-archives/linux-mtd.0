Received: from smtp1.stealer.net ([88.198.224.204])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW8L1-00008k-6H
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 11:28:23 +0000
Date: Thu, 21 Aug 2008 13:27:57 +0200 (CEST)
From: Sven Wegener <sven.wegener@stealer.net>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
In-Reply-To: <48AD0101.4020505@gmail.com>
Message-ID: <alpine.LNX.1.10.0808211325530.12259@titan.stealer.net>
References: <48AD0101.4020505@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Aug 2008, Jared Hulbert wrote:

> The many different devices AXFS can mount to and the various
> dual device mounting schemes are supported here.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
> +static int __init init_axfs_fs(void)
> +{
> +	axfs_uncompress_init();

one more thing, axfs_uncompress_init() can fail

> +	return register_filesystem(&axfs_fs_type);
> +}
> +
> +static void __exit exit_axfs_fs(void)
> +{
> +	axfs_uncompress_exit();
> +	unregister_filesystem(&axfs_fs_type);
> +}
> +
> +module_init(init_axfs_fs);
> +module_exit(exit_axfs_fs);
> +MODULE_LICENSE("GPL");
