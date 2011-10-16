Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFRJL-0001Wg-NX
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 14:03:32 +0000
Received: by wyg8 with SMTP id 8so740410wyg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 07:03:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] jffs2: implement mount option parsing and
	compression overriding
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
Date: Sun, 16 Oct 2011 17:03:00 +0300
In-Reply-To: <20111015125006.685efc30@queued.net>
References: <20111015125006.685efc30@queued.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318773789.7278.7.camel@sauron>
Mime-Version: 1.0
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
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

please, cc the fs-devel mailing list when you sumbit v2.

On Sat, 2011-10-15 at 12:50 -0700, Andres Salomon wrote:
> Currently jffs2 has compile-time constants (and .config options)
> controlling whether or not the various compression/decompression
> drivers are built in and enabled.  This is fine for embedded
> systems, but it clashes with distribution kernels.  Distro kernels
> tend to turn on everything; this causes OpenFirmware to fall
> over, as it understands ZLIB-compressed inodes.  Booting a kernel
> that has LZO compression enabled, writing to the boot partition,
> and then rebooting causes OFW to fail to read the kernel from
> the filesystem.  This is because LZO compression has priority
> when writing new data to jffs2, if LZO is enabled.
> 
> This patch adds mount option parsing, and a single supported
> option ("compr=none").  This adds the flexibility of being
> able to specify which compressor overrides on a per-superblock
> basis.  For now, we can simply disable compression;
> additional flexibility coming soon.
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>

You forgot to implement .show_options method of
'struct super_operations' - it is needed to make sure 'compr=none'
is shown when you do 'cat /proc/mounts'.


> +	err = jffs2_parse_options(c, data);
> +	if (err) {
> +		printk(KERN_ERR "JFFS2 error: invalid or unknown mount option\n");

'jffs2_parse_options()' prints the error message, do not duplicate it
please.

> +		return -EINVAL;
> +	}
> +
> +	return jffs2_do_remount_fs(sb, flags, data);
> +}
> +
>  static const struct super_operations jffs2_super_operations =
>  {
>  	.alloc_inode =	jffs2_alloc_inode,
> @@ -166,6 +234,13 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
>  	c->os_priv = sb;
>  	sb->s_fs_info = c;
>  
> +	ret = jffs2_parse_options(c, data);
> +	if (ret) {
> +		printk(KERN_ERR "JFFS2 error: invalid or unknown mount option\n");

Ditto - kill this printk please.


-- 
Best Regards,
Artem Bityutskiy
