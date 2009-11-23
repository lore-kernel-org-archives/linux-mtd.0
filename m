Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCaPv-00050y-6a
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 15:01:31 +0000
Subject: Re: [PATCH 4/7] nandsim: Don't use PF_MEMALLOC
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
In-Reply-To: <20091117161843.3DE0.A69D9226@jp.fujitsu.com>
References: <20091117161551.3DD4.A69D9226@jp.fujitsu.com>
	<20091117161843.3DE0.A69D9226@jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Nov 2009 17:00:17 +0200
Message-Id: <1258988417.18407.44.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-17 at 16:19 +0900, KOSAKI Motohiro wrote:
> Non MM subsystem must not use PF_MEMALLOC. Memory reclaim need few
> memory, anyone must not prevent it. Otherwise the system cause
> mysterious hang-up and/or OOM Killer invokation.
> 
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
> ---
>  drivers/mtd/nand/nandsim.c |   22 ++--------------------
>  1 files changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index cd0711b..97a8bbb 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -1322,34 +1322,18 @@ static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t
>  	return 0;
>  }
>  
> -static int set_memalloc(void)
> -{
> -	if (current->flags & PF_MEMALLOC)
> -		return 0;
> -	current->flags |= PF_MEMALLOC;
> -	return 1;
> -}
> -
> -static void clear_memalloc(int memalloc)
> -{
> -	if (memalloc)
> -		current->flags &= ~PF_MEMALLOC;
> -}
> -
>  static ssize_t read_file(struct nandsim *ns, struct file *file, void *buf, size_t count, loff_t *pos)
>  {
>  	mm_segment_t old_fs;
>  	ssize_t tx;
> -	int err, memalloc;
> +	int err;
>  
>  	err = get_pages(ns, file, count, *pos);
>  	if (err)
>  		return err;
>  	old_fs = get_fs();
>  	set_fs(get_ds());
> -	memalloc = set_memalloc();
>  	tx = vfs_read(file, (char __user *)buf, count, pos);
> -	clear_memalloc(memalloc);
>  	set_fs(old_fs);
>  	put_pages(ns);
>  	return tx;
> @@ -1359,16 +1343,14 @@ static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size
>  {
>  	mm_segment_t old_fs;
>  	ssize_t tx;
> -	int err, memalloc;
> +	int err;
>  
>  	err = get_pages(ns, file, count, *pos);
>  	if (err)
>  		return err;
>  	old_fs = get_fs();
>  	set_fs(get_ds());
> -	memalloc = set_memalloc();
>  	tx = vfs_write(file, (char __user *)buf, count, pos);
> -	clear_memalloc(memalloc);
>  	set_fs(old_fs);
>  	put_pages(ns);
>  	return tx;

I vaguely remember Adrian (CCed) did this on purpose. This is for the
case when nandsim emulates NAND flash on top of a file. So there are 2
file-systems involved: one sits on top of nandsim (e.g. UBIFS) and the
other owns the file which nandsim uses (e.g., ext3).

And I really cannot remember off the top of my head why he needed
PF_MEMALLOC, but I think Adrian wanted to prevent the direct reclaim
path to re-enter, say UBIFS, and cause deadlock. But I'd thing that all
the allocations in vfs_read()/vfs_write() should be GFP_NOFS, so that
should not be a probelm?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
