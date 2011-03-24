Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2l5t-0000F1-6W
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 14:00:58 +0000
Received: by wwc33 with SMTP id 33so8192040wwc.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2011 07:00:55 -0700 (PDT)
Subject: Re: [PATCH] mtd: Use fallback in memory allocation for
	mtd_{read,write}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <1300796009-15019-1-git-send-email-jarkko.lavinen@nokia.com>
References: <1300796009-15019-1-git-send-email-jarkko.lavinen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Mar 2011 15:58:57 +0200
Message-ID: <1300975137.2735.93.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-22 at 14:13 +0200, Jarkko Lavinen wrote:
> Kmalloc used in mtd_read() and mtd_write() can fail if the request
> size is large and memory is fragmented.  Use fall-back mechanism which
> will quietly retry the allocation by halving the allocation size in each
> retry.
> 
> Signed-off-by: Jarkko Lavinen <jarkko.lavinen@nokia.com>
> ---
>  drivers/mtd/mtdchar.c |   44 ++++++++++++++++++++++++++++++--------------
>  1 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 145b3d0d..18263d8 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -171,12 +171,33 @@ static int mtd_close(struct inode *inode, struct file *file)
>  */
>  #define MAX_KMALLOC_SIZE 0x20000
>  
> +static void *mtd_buf_alloc(size_t *size)
> +{
> +	void *kbuf;
> +	size_t next;
> +
> +	if (*size > MAX_KMALLOC_SIZE)
> +		*size = MAX_KMALLOC_SIZE;
> +
> +	kbuf = kmalloc(*size, GFP_KERNEL | __GFP_NOWARN);
> +	next = 1 << (fls(*size - 1) - 1);
> +
> +	while (!kbuf && next >= PAGE_SIZE) {
> +		*size = next;
> +		next /= 2;
> +		kbuf = kmalloc(*size, GFP_KERNEL | __GFP_NOWARN);
> +	}
> +
> +	return kbuf;
> +}

Instead of improving bad code we need re-work it and allocate multiple
small buffers and use vector-based read/write functions.

Indeed, kmalloc()'ing large buffers is a horrible things to do for
performance because it causes a lot of activities, write-back, kills
caches, etc. This patch tries to kmalloc a lot, then less, even less,
etc, until it succeeds. And the first kmalloc will put the device on the
knees.

So we should not even try to kmalloc that much. And also, we should use
GFP_NOIO flag when kmalloc-ing a lot, I think.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
