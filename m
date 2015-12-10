Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6ojk-0007N7-1p
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 00:05:32 +0000
Received: by pfdd184 with SMTP id d184so37810474pfd.3
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 16:05:11 -0800 (PST)
Date: Wed, 9 Dec 2015 16:05:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mkfs.ubifs: use gid from table instead 2x uid
Message-ID: <20151210000508.GE144338@google.com>
References: <1408726141-25608-1-git-send-email-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408726141-25608-1-git-send-email-bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the archaeology hat on...

On Fri, Aug 22, 2014 at 06:49:01PM +0200, Sebastian Andrzej Siewior wrote:
> If the devtable is used then the tool uses uid twice and doesn't
> consider gid at all. This changes it to use gid & uid.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  mkfs.ubifs/mkfs.ubifs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index 200c8a5..d7a252c 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -1535,7 +1535,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
>  
>  		memcpy(&fake_st, &root_st, sizeof(struct stat));
>  		fake_st.st_uid  = nh_elt->uid;
> -		fake_st.st_uid  = nh_elt->uid;
> +		fake_st.st_gid  = nh_elt->gid;
>  		fake_st.st_mode = nh_elt->mode;
>  		fake_st.st_rdev = nh_elt->dev;
>  		fake_st.st_nlink = 1;

LGTM. Applied to mtd-utils.git
