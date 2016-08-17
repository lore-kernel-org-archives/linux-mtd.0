Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZzct-0001sE-Rq
 for linux-mtd@lists.infradead.org; Wed, 17 Aug 2016 12:07:23 +0000
Received: by mail-pa0-x242.google.com with SMTP id ez1so7039397pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Aug 2016 05:06:59 -0700 (PDT)
Subject: Re: [PATCH] ubifs: Fix xattr generic handler usage
To: Richard Weinberger <richard@nod.at>
References: <1469994143-13977-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org
From: Dongsheng Yang <dongsheng081251@gmail.com>
Message-ID: <57B4535C.1020201@gmail.com>
Date: Wed, 17 Aug 2016 20:06:52 +0800
MIME-Version: 1.0
In-Reply-To: <1469994143-13977-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/01/2016 03:42 AM, Richard Weinberger wrote:
> UBIFS uses full names to work with xattrs, therefore we have to use
> xattr_full_name() to obtain the xattr prefix as string.
>
> Cc: <stable@vger.kernel.org>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Fixes: 2b88fc21ca ("ubifs: Switch to generic xattr handlers")
> Signed-off-by: Richard Weinberger <richard@nod.at>
Tested-by: Dongsheng Yang <dongsheng081251@gmail.com>

It make ubifs passes generic/020 in xfstests.

Yang
> ---
>   fs/ubifs/xattr.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index b5fc279..c63710f 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -575,7 +575,8 @@ static int ubifs_xattr_get(const struct xattr_handler *handler,
>   	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
>   		inode->i_ino, dentry, size);
>   
> -	return  __ubifs_getxattr(inode, name, buffer, size);
> +	name = xattr_full_name(handler, name);
> +	return __ubifs_getxattr(inode, name, buffer, size);
>   }
>   
>   static int ubifs_xattr_set(const struct xattr_handler *handler,
> @@ -586,6 +587,8 @@ static int ubifs_xattr_set(const struct xattr_handler *handler,
>   	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
>   		name, inode->i_ino, dentry, size);
>   
> +	name = xattr_full_name(handler, name);
> +
>   	if (value)
>   		return __ubifs_setxattr(inode, name, value, size, flags);
>   	else
