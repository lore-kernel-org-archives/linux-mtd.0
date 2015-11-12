Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwxFj-0002ER-T1
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 19:09:48 +0000
Received: by pabfh17 with SMTP id fh17so73361717pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 11:09:27 -0800 (PST)
Date: Thu, 12 Nov 2015 11:09:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard =?iso-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd-utils: lib: mtd_read: Take the buffer offset into
 account when reading
Message-ID: <20151112190924.GD8456@google.com>
References: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marcus,

On Tue, Oct 06, 2015 at 02:13:23PM +0200, Marcus Prebble wrote:
> Hi mtd-list,
> 
> Assuming the read() call does not return zero and the result is less
> than len, the current implementation will overwrite the data already
> read in buf which doesn't seem correct.

In addition, this means we might not actually fill up the entire buffer,
since 2 or more short read()'s might get us to exit the loop with a
cumulative value in 'rd', but only a partially-filled buffer. That could
cause a user to try and handle garbage/uninitialized data.

> Suggested patch attached (git format-patch)
> 
> -Marcus

> From 5dccbbd87604665e896472d52f3351c14c24d2b3 Mon Sep 17 00:00:00 2001
> From: Marcus Prebble <prebble@axis.com>
> Date: Mon, 5 Oct 2015 17:32:54 +0200
> Subject: [PATCH] mtd_read: Take the buffer offset into account when reading
> 
> Subsequent calls to read() within the loop will now no longer
> overwrite the existing contents of buf.
> ---
>  lib/libmtd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index 60b4782..bf6d71f 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -1072,10 +1072,10 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
>  				  mtd->mtd_num, seek);
>  
>  	while (rd < len) {
> -		ret = read(fd, buf, len);
> +		ret = read(fd, buf + rd, len - rd);
>  		if (ret < 0)
>  			return sys_errmsg("cannot read %d bytes from mtd%d (eraseblock %d, offset %d)",
> -					  len, mtd->mtd_num, eb, offs);
> +					  len - rd, mtd->mtd_num, eb, offs + rd);
>  		rd += ret;
>  	}
>  

Patch looks OK. Did you test it? Have you seen MTD drivers that will
return short reads?

Brian
