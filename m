Received: from e28smtp07.in.ibm.com ([122.248.162.7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zdvab-0000in-Uk
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 07:32:42 +0000
Received: from /spool/local
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <aneesh.kumar@linux.vnet.ibm.com>;
 Mon, 21 Sep 2015 13:01:28 +0530
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 151CAE0054
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 13:00:59 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
 by d28relay02.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t8L7VHRx51249240
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 13:01:18 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t8L7VH2l007912
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 13:01:17 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>,
 v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH 3/5] 9p: Simplify the xattr handlers
In-Reply-To: <1441367842-25079-4-git-send-email-agruenba@redhat.com>
References: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
 <1441367842-25079-4-git-send-email-agruenba@redhat.com>
Date: Mon, 21 Sep 2015 13:00:57 +0530
Message-ID: <87pp1cdya6.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andreas Gruenbacher <andreas.gruenbacher@gmail.com> writes:

> The generic_{get,set,remove}xattr inode operations use the xattr name prefix to
> decide which of the defined xattr handlers to call, then call the appropriate
> handler's get or set operation.  The name suffix is passed to the get or set
> operations, the prefix is still "there" in the name before the suffix though.
> There is no need to recompose the name in a temporary buffer.
>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/9p/xattr_security.c | 34 ++++------------------------------
>  fs/9p/xattr_trusted.c  | 34 ++++------------------------------
>  fs/9p/xattr_user.c     | 34 ++++------------------------------
>  3 files changed, 12 insertions(+), 90 deletions(-)
>
> diff --git a/fs/9p/xattr_security.c b/fs/9p/xattr_security.c
> index cb247a1..2c9b394 100644
> --- a/fs/9p/xattr_security.c
> +++ b/fs/9p/xattr_security.c
> @@ -22,10 +22,7 @@
>  static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
>  			void *buffer, size_t size, int type)
>  {
> -	int retval;
> -	char *full_name;
> -	size_t name_len;
> -	size_t prefix_len = XATTR_SECURITY_PREFIX_LEN;
> +	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
>  
>  	if (name == NULL)
>  		return -EINVAL;
> @@ -33,26 +30,13 @@ static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
>  	if (strcmp(name, "") == 0)
>  		return -EINVAL;
>  
> -	name_len = strlen(name);
> -	full_name = kmalloc(prefix_len + name_len + 1 , GFP_KERNEL);
> -	if (!full_name)
> -		return -ENOMEM;
> -	memcpy(full_name, XATTR_SECURITY_PREFIX, prefix_len);
> -	memcpy(full_name+prefix_len, name, name_len);
> -	full_name[prefix_len + name_len] = '\0';
> -
> -	retval = v9fs_xattr_get(dentry, full_name, buffer, size);
> -	kfree(full_name);
> -	return retval;
> +	return v9fs_xattr_get(dentry, full_name, buffer, size);
>  }
>  

I look strange, to expect that name argument passed to ->get() will have
the full name details. In any case this need more documentation and a
helper as Christoph suggested

-aneesh
