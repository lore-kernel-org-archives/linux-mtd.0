Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNlL7-0001NO-Ay
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 17:21:54 +0000
Received: by pdrh1 with SMTP id h1so29438436pdr.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 10:21:30 -0700 (PDT)
Date: Fri, 7 Aug 2015 10:21:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] JFFS2: Prevent CPU starvation during garbage collection.
Message-ID: <20150807172127.GB60523@google.com>
References: <1438749630-1656-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438749630-1656-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ David

I'm not maintaining JFFS2, but if it's exceedingly obvious (this patch
might qualify), I might take patches.

On Wed, Aug 05, 2015 at 04:40:30PM +1200, Mark Tomlinson wrote:
> The JFFS2 garbage collection checks every file on the system for correct
> checksums and cleaning up anything that it needs to. It sleeps for 50ms
> between each file, but within each file it remains busy.
> 
> As far as I can tell, there is no reason to not reschedule while checking a
> file, by putting a cond_resched() inside jfffs2_build_inode_fragtree(). In
> fact, jffs2_get_inode_nodes() will call cond_resched(), which is done
> immediately before jffs2_build_inode_fragtree().
> 
> With this extra cond_resched() between reading file blocks, there is a
> dramatic improvement in latency for any processes which are running during
> this initial garbage collection phase.
> 
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
>  fs/jffs2/readinode.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index 28e0aab..78c526a 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
> @@ -536,6 +536,7 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
>  				jffs2_free_tmp_dnode_info(this);
>  			}
>  			this = vers_next;
> +			cond_resched();
>  		}
>  	}
>  	return 0;

Obligatory question: did you test this?

Brian
