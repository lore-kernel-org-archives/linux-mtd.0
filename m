Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyUch-0006U6-4h
	for linux-mtd@lists.infradead.org; Thu, 06 Jul 2006 10:14:44 -0400
Date: Thu, 6 Jul 2006 16:13:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ville Herva <vherva@vianova.fi>
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work
Message-ID: <20060706141356.GA30171@wohnheim.fh-wedel.de>
References: <20060706082443.GL15078@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060706082443.GL15078@vianova.fi>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 6 July 2006 11:24:44 +0300, Ville Herva wrote:
> 
> Trying to pass kernel command line arguments to block2mtd at boot-time does
> not work currently. block2mtd_setup() is called so early that kmalloc()
> fails nevermind being able to do open_bdev_excl() (which requires rootfs to
> be mounted. This patch only saves the option string at the early boot stage,
> and parses them later when block2mtd_init() is called. If open_bdev_excl()
> fails, open_by_devnum(name_to_dev_t()) is tried instead, which makes it
> possible to initialize the driver before rootfs has been mounted. Also gets
> rid of the superfluous parse_name() that only checks if name is longer than
> 80 chars and copies it to a string that is not kfreed.
> 
> With this patch, I can boot statically compiled block2mtd, and mount jffs2
> as rootfs (without modules or initrd), with lilo config like this:
> 
>    root=/dev/mtdblock0
>    append="rootfstype=jffs2 block2mtd.block2mtd=/dev/hdc2,65536"
> 
> (Note that rootfstype=jffs2 is required, since the kernel only tries
> filesystems without "nodev" attribute by default, and jffs is "nodev").

Looks fairly good as a basis.  A couple of details still remain...

> @@ -426,14 +420,20 @@ static inline void kill_final_newline(ch
>  	return 0;				\
>  } while (0)
>  
> -static int block2mtd_setup(const char *val, struct kernel_param *kp)
> +static int block2mtd_init_called = 0;
> +static char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */
> +
> +
> +static int block2mtd_setup2(void)
>  {
> -	char buf[80+12]; /* 80 for device, 12 for erase size */
> +	char* val = (char*)block2mtd_paramline;

The * usually belongs to the var, not the type.  Also, I believe we
don't need the cast here.
	char *val = block2mtd_paramline;
> +
> +	char buf[80 + 12], *str = buf; /* 80 for device, 12 for erase size */
>  	char *str = buf;

Now we have two variables called "str".

>  	if (token[1]) {
> -		ret = parse_num(&erase_size, token[1]);
> +		int ret = parse_num(&erase_size, token[1]);

Maybe the variable declaration can stay at the top of the function,
just to reduce the amount of churn.

> +static int block2mtd_setup(const char *val, struct kernel_param *kp)
> +{
> +	/* Only save the parameters here. We must parse them later:
> +	   if the param passed from kernel boot command line,
> +	   block2mtd_setup() is called so early that it is not
> +	   possible to resolve the device (even kmalloc() fails).
> +	   Deter that work to block2mtd_setup2(). */
> +
> +	strlcpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
> +
> +	/* If more parameters are later passed in via
> +	   /sys/module/block2mtd/parameters/block2mtd
> +	   and block2mtd_init() has already been called,
> +	   we can parse the argument now. */
> +
> +	if (block2mtd_init_called)
> +		return block2mtd_setup2();

Took me a couple of minutes to understand what you're doing here.
Makes sense.  But passing the parameter to block2mtd_setup2() through
a global variable instead of stack allows races when two people add
device through the /sys/... file.  We could add spinlocks around this
function and block2mtd_init() to solve that.  Or we could decide it's
not worth the effort.

If you can address the first two comments, I'm happy.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
