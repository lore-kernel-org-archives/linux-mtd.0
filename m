Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1FWi-0001Kf-W6
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 12:47:45 +0000
Date: Mon, 22 Jul 2013 15:47:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: walter harms <wharms@bfs.de>
Subject: Re: [patch] mtd: use correct error codes in debugfs_create()
Message-ID: <20130722124712.GG5636@mwanda>
References: <20130719054938.GC9729@elgon.mountain>
 <20130722055607.GF5636@mwanda> <51ECE488.1050307@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51ECE488.1050307@bfs.de>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The debugfs API is a bit confusing initialy but it's straight
foward to use.  You call:

	dfs_rootdir = debugfs_create_dir(...);

If it returns NULL then you return an error code.  If debugfs is
not enabled then it returns ERR_PTR(-ENODEV) but you don't normally
need to test for it.  After all later when you call:

	debugfs_create_file("wear_report", S_IRUSR,
			    dfs_rootdir, dev, &dfs_fops);

That function is just a no-op because debugfs is disabled.

The problem here is that we test for IS_ERR_OR_NULL() instead of
just if (!dfs_rootdir) which is wrong.  Also if we do hit an error
we return success because the true false bit are reversed.

regards,
dan carpenter
> 
