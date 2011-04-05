Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6y2n-0000UN-Pl
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 04:39:11 +0000
Received: by eyh6 with SMTP id 6so213eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 21:39:07 -0700 (PDT)
Subject: Re: [PATCH v2] MTD: Retry Read/Write Transfer Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1301941174-10050-1-git-send-email-marathon96@gmail.com>
References: <1301705049-15593-1-git-send-email-marathon96@gmail.com>
	<1301941174-10050-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 07:39:04 +0300
Message-ID: <1301978344.2608.28.camel@koala>
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

Hi,

On Mon, 2011-04-04 at 11:19 -0700, Grant Erickson wrote:
> When handling user space read or write requests via mtd_{read,write},
> exponentially back off on the size of the requested kernel transfer
> buffer until it succeeds or until the requested transfer buffer size
> falls below the page size.
> 
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
> 
>   v2: Added __GFP_NOWARN flag and made common retry loop a function
>       as recommended by Artem.
> 
> Signed-off-by: Grant Erickson <marathon96@gmail.com>
> ---
>  drivers/mtd/mtdchar.c |   66 +++++++++++++++++++++++++++++++++---------------
>  1 files changed, 45 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 145b3d0d..df9be51 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -166,11 +166,44 @@ static int mtd_close(struct inode *inode, struct file *file)
>  	return 0;
>  } /* mtd_close */
>  
> -/* FIXME: This _really_ needs to die. In 2.5, we should lock the
> -   userspace buffer down and use it directly with readv/writev.
> -*/
> +/* Back in April 2005, Linus wrote:
> + * 
> + *   FIXME: This _really_ needs to die. In 2.5, we should lock the
> + *   userspace buffer down and use it directly with readv/writev.
> + *
> + * The implementation below, using mtd_try_alloc, mitigates allocation
> + * failures when the sytem is under low-memory situations or if memory

s/sytem/system/

> + * is highly fragmented at the cost of reducing the performance of the
> + * requested transfer due to a smaller buffer size.
> + *
> + * A more complex but more memory-efficient implementation based on
> + * get_user_pages and iovecs to cover extents of those pages is a
> + * longer-term goal, as intimated by Linus above. However, for the
> + * write case, this requires yet more complex head and tail transfer
> + * handling when those head and tail offsets and sizes are such that
> + * alignment requirements are not met in the NAND subdriver.
> + */
>  #define MAX_KMALLOC_SIZE 0x20000
>  
> +static void *mtd_try_alloc(size_t *size)
> +{
> +	const gfp_t flags = (GFP_KERNEL | __GFP_NOWARN);

I still think you'll damage the performance when you try to do

kmalloc(128KiB, flags)

because as I wrote in my previous e-mail your system will start doing
the following to free memory for you:

1. write-back dirty FS data = overall slowdown = e.g., background mp3
   playback glitches
2. drop FS caches = slow down later because the system will have to
   re-read the dropped data from the media later.
3. not really sure, needs checking if this is the case, but I think
   the kernel may start swapping out apps.

This is why I suggested to use the following flags here:

	gfp_t flags = __GFP_NOWARN | __GFP_WAIT | __GFP_NORETRY;

> +	size_t try;
> +	void *kbuf;
> +
> +	try = min_t(size_t, *size, MAX_KMALLOC_SIZE);
> +
> +	do {
> +		kbuf = kmalloc(try, flags);
> +	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));

So, you try 128KiB, 64KiB, 32KiB, 16KiB, 8KiB and fail, it is OK. But
4KiB is the last resort allocation. If it fails, you do want to see
scary kmalloc warning, so you should not use __GFP_NOWARN for this last
allocation. Also, you do want kmalloc to try hard, so for this last
PAGE_SIZE allocation you want to use GFP_KERNEL flags.

> +
> +	if (kbuf) {
> +		*size = try;
> +	}

Braces are not necessary here. But actually the whole if is not needed -
just make the function interface so that if it returns NULL then *size
is undefined and the user of this function should not look at it. I
think it is the case in your code.

I mean, just 

	*size = try;
	return kbuf;

> +
> +	return kbuf;
> +}
> +
>  static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
>  {
>  	struct mtd_file_info *mfi = file->private_data;
> @@ -179,6 +212,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
>  	size_t total_retlen=0;
>  	int ret=0;
>  	int len;
> +	size_t size;
>  	char *kbuf;
>  
>  	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
> @@ -189,23 +223,16 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
>  	if (!count)
>  		return 0;
>  
> -	/* FIXME: Use kiovec in 2.5 to lock down the user's buffers
> -	   and pass them directly to the MTD functions */
> +	size = count;
I think you can do this assignment when you declare 'size';

>  
> -	if (count > MAX_KMALLOC_SIZE)
> -		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
> -	else
> -		kbuf=kmalloc(count, GFP_KERNEL);
> +	kbuf = mtd_try_alloc(&size);
>  
>  	if (!kbuf)
>  		return -ENOMEM;

No need to put extra new lines, too many of them make the code less
readable. I think allocating and checking should have not space in
between.

>  
>  	while (count) {
>  
> -		if (count > MAX_KMALLOC_SIZE)
> -			len = MAX_KMALLOC_SIZE;
> -		else
> -			len = count;
Please, kill the extra white-space after "while" as well.

> +		len = min_t(size_t, count, size);
>  
>  		switch (mfi->mode) {
>  		case MTD_MODE_OTP_FACTORY:
> @@ -268,6 +295,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
>  {
>  	struct mtd_file_info *mfi = file->private_data;
>  	struct mtd_info *mtd = mfi->mtd;
> +	size_t size;
>  	char *kbuf;
>  	size_t retlen;
>  	size_t total_retlen=0;
> @@ -285,21 +313,16 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
>  	if (!count)
>  		return 0;
>  
> -	if (count > MAX_KMALLOC_SIZE)
> -		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
> -	else
> -		kbuf=kmalloc(count, GFP_KERNEL);
> +	size = count;
> +
> +	kbuf = mtd_try_alloc(&size);
>  
>  	if (!kbuf)
>  		return -ENOMEM;
>  
>  	while (count) {
>  
> -		if (count > MAX_KMALLOC_SIZE)
> -			len = MAX_KMALLOC_SIZE;
> -		else
> -			len = count;
> +		len = min_t(size_t, count, size);
>  
>  		if (copy_from_user(kbuf, buf, len)) {
>  			kfree(kbuf);

Similar requests for this "symmetric" piece of code.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
