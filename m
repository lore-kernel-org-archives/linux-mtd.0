Received: from oproxy5.bluehost.com ([2605:dc00:100:2::a5]
 helo=oproxy5-pub.bluehost.com)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjBxC-0006F6-5i
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 16:15:55 +0000
Message-ID: <4FE88E9A.4040605@xenotime.net>
Date: Mon, 25 Jun 2012 09:15:22 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH] ubifs: Fix build warning
References: <1340637580-12711-1-git-send-email-aletes.xgr@gmail.com>
In-Reply-To: <1340637580-12711-1-git-send-email-aletes.xgr@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/25/2012 08:19 AM, Alexandre Pereira da Silva wrote:

> Fix:
> fs/ubifs/dir.c: In function 'ubifs_rename':
> fs/ubifs/dir.c:972:15: warning: 'saved_nlink' may be used uninitialized
> in this function
> 
> Initilize saved_nlink to 0

Does nlink need to be init at all?  is the warning bogus or valid?

If the warning is bogus, the preferred solution is:

#include <linux/compiler-gcc.h>
...
	unsigned int uninitialized_var(nlink);


> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> ---
>  fs/ubifs/dir.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index a6d42ef..d5b8cb1e 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -969,7 +969,7 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
>  	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
>  			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
>  	struct timespec time;
> -	unsigned int saved_nlink;
> +	unsigned int saved_nlink = 0;
>  
>  	/*
>  	 * Budget request settings: deletion direntry, new direntry, removing



-- 
~Randy
