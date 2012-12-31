Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TphZg-00072X-OS
 for linux-mtd@lists.infradead.org; Mon, 31 Dec 2012 15:46:50 +0000
Date: Mon, 31 Dec 2012 16:45:59 +0100
From: Jan Kara <jack@suse.cz>
To: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] fs/ext*,f2fs,jffs2,reiserfs: give comments for acl
 size and count calculation
Message-ID: <20121231154559.GG7564@quack.suse.cz>
References: <50DD20B2.6040204@asianux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50DD20B2.6040204@asianux.com>
Cc: jack@suse.cz, torvalds@linux-foundation.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 linux-mtd@lists.infradead.org, jaegeuk.kim@samsung.com,
 Theodore Ts'o <tytso@mit.edu>, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri 28-12-12 12:31:46, Chen Gang wrote:
> 
>   give comments (by Theodore Ts'o)
> 
>     ACL_USER_OBJ ACL_USER*[1] ACL_GROUP_OBJ ACL_GROUP*[1] ACL_MASK[2] ACL_OTHER
> 
>     [1] Where * is the regexp sense of "0 or more times"
>     [2] Only if there is at least one ACL_USER or ACL_GROUP tag;
>         otherwise skip ACL_MASK.
> 
>   use macro instead of hard code number (by Chen Gang)
> 
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
...
> diff --git a/include/linux/posix_acl.h b/include/linux/posix_acl.h
> index 7931efe..d75d2f6 100644
> --- a/include/linux/posix_acl.h
> +++ b/include/linux/posix_acl.h
> @@ -26,6 +26,15 @@
>  #define ACL_MASK		(0x10)
>  #define ACL_OTHER		(0x20)
>  
> +/*
> + * ACL_USER_OBJ ACL_USER*[1] ACL_GROUP_OBJ ACL_GROUP*[1] ACL_MASK[2] ACL_OTHER
> + *
> + * [1] Where * is the regexp sense of "0 or more times"
> + * [2] Only if there is at least one ACL_USER or ACL_GROUP tag;
> + *     otherwise skip ACL_MASK.
> + */
> +#define ACL_MAX_SHORT_ENTRY     (4)
> +
  I agree that defining a constant for this makes sence. Just please be
more verbose with the comment. This is hardly readable for anyone not
knowing what's going on in advance. Also braces around 4 are superfluous.
Add something like the comment below before posix_acl_valid():

/*
 * posix_acl_valid() makes sure ACL format is the following:
 * ACL_USER_OBJ ACL_USER*[1] ACL_GROUP_OBJ ACL_GROUP*[1] ACL_MASK[2] ACL_OTHER
 *
 * [1] Where * is the regexp sense of "0 or more times"
 * [2] If ACL_USER or ACL_GROUP is present, then ACL_MASK must be present.
 */

Then add comment before definition of ACL_MAX_SHORT_ENTRY:
/*
 * posix_acl_valid() makes sure that if there are <= 4 ACL entries, then
 * all of them are short. Otherwise exactly 4 entries are short ones and
 * other have full length. See comment before that function for exact ACL
 * format.
 */

								Honza
>  /* permissions in the e_perm field */
>  #define ACL_READ		(0x04)
>  #define ACL_WRITE		(0x02)
> -- 
> 1.7.10.4
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
