Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhBMe-0005I7-4b
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 04:50:41 +0000
Message-ID: <5285A7FF.1000901@oracle.com>
Date: Fri, 15 Nov 2013 12:50:07 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: shaggy@kernel.org
Subject: Re: [PATCH 6/6] jfs: simplify lmLogSync() via
 list_last_entry_or_null()
References: <5285A483.3040009@oracle.com>
In-Reply-To: <5285A483.3040009@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, oleg@redhat.com,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dave and all,

Please ignore this patch from this series.

On 11/15 2013 12:35 PM, Jeff Liu wrote:
> From: Jie Liu <jeff.liu@oracle.com>
> 
> Simplify the code in lmLogSync() via list_last_entry_or_null().
> 
> Signed-off-by: Jie Liu <jeff.liu@oracle.com>
> ---
>  fs/jfs/jfs_logmgr.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
> index 7b565d0..2f90779 100644
> --- a/fs/jfs/jfs_logmgr.c
> +++ b/fs/jfs/jfs_logmgr.c
> @@ -963,13 +963,9 @@ static int lmLogSync(struct jfs_log * log, int hard_sync)
>  
>  	if (log->sync == log->syncpt) {
>  		LOGSYNC_LOCK(log, flags);
> -		if (list_empty(&log->synclist))
> -			log->sync = log->lsn;
> -		else {
> -			lp = list_entry(log->synclist.next,
> -					struct logsyncblk, synclist);
> -			log->sync = lp->lsn;
> -		}
> +		lp = list_last_entry_or_null(&log->synclist, struct logsyncblk,
> +					     synclist);
Here it could be simplified via list_first_entry_or_null(), my apology for this mistake.
> +		log->sync = lp ? lp->lsn : log->lsn;
>  		LOGSYNC_UNLOCK(log, flags);
>  
>  	}
> 

Thanks,
-Jeff
