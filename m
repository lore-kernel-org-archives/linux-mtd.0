Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QQyd1-0006df-5Q
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 09:19:15 +0000
Received: by ewy3 with SMTP id 3so1388204ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 02:19:12 -0700 (PDT)
Subject: RE: Setting security XATTR on ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
In-Reply-To: <C7A5B00EFC707A46AB67997D02152167010F582C@mx1.grid-net.com>
References: <1305934601.10340.12.camel@subodh-desktop>
	<1306162677.2785.30.camel@localhost>
	<C7A5B00EFC707A46AB67997D02152167010F582C@mx1.grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 May 2011 12:12:24 +0300
Message-ID: <1306746744.4405.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-27 at 06:08 -0700, Subodh Nijsure wrote:
> Yup I did run UBIFS with debug & extra checks and discovered few issues.
> Found that setxattr/getxattr require that we should have already taken
> host->i_mutex. So I have updated my ubifs_init_security() accordingly.

Great!

> One of the problem turned out to be in change_xattr function, ui->data_len
> was updated at wrong place, and hence when after unmount, mount the
> length of the XATTR was wrong. I test
> 
> Diff below fixes that immediate issue. I tested this with
> As I mentioned, will post entire patch that allows ubifs to work with
> SELinux by end of this week.
> 
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 3299f46..a413278 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -211,11 +211,11 @@ static int change_xattr(struct ubifs_info *c,
> struct inode *host,
>         }
>         memcpy(ui->data, value, size);
>         inode->i_size = ui->ui_size = size;
> -       ui->data_len = size;
> 
>         mutex_lock(&host_ui->ui_mutex);
>         host->i_ctime = ubifs_current_time(host);
>         host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
> +       ui->data_len = size;
>         host_ui->xattr_size += CALC_XATTR_BYTES(size);

Could you please submit a separate patch for this with

Cc: stable@kernel.org

> Now I am looking at much bigger issue where, if I create char device
> and assign it XATTR, on umount the file system is getting marked
> corrupted. This is with testing on NANDSIM, it happens on actual HW
> too. It appears that node_scan doesn't seem to be reading XATTR data
> and accounting for it when computing checksum.

If you send me a test program I might look at this, but no promises.
Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
