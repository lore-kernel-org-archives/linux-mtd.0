Received: from [119.145.14.65] (helo=szxga02-in.huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9P0S-0006Fo-BL
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 01:36:41 +0000
Message-ID: <53CDBFDB.6080300@huawei.com>
Date: Tue, 22 Jul 2014 09:35:23 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] UBIFS: add a log overlap assertion
References: <1405514528-14649-1-git-send-email-dedekind1@gmail.com>
 <1405514528-14649-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1405514528-14649-2-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/16 20:42, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add an assertion which checkes that the head of the log never overlaps with the
> tail of the log.
> 
> Suggested-by: hujianyang <hujianyang@huawei.com>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  fs/ubifs/misc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
> index ee7cb5e..81bbf79 100644
> --- a/fs/ubifs/misc.h
> +++ b/fs/ubifs/misc.h
> @@ -297,6 +297,7 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
>  	if (lnum > c->log_last)
>  		lnum = UBIFS_LOG_LNUM;
>  
> +	ubifs_assert(lnum != c->ltail_lnum);
>  	return lnum;
>  }
>  
> 

Hi Artem,

I just come back to work today.

I have to tell you this patch seems wrong. I've tested this patch
and saw lots of 'assert_failed()'. We use ubifs_next_log_lnum()
as an iterator to scan the hole log area and the return value of
this function may equal to c->ltail_lnum.

see:
	fixup_free_space() in fs/ubifs/sb.c line 712
	ubifs_log_post_commit() in fs/ubifs/log.c line 520
and so on.


How about my former patch or a new patch like this?


diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 7e818ec..c14628f 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -244,6 +244,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)

 	if (c->lhead_offs > c->leb_size - c->ref_node_alsz) {
 		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+		ubifs_assert(c->lhead_lnum != c->ltail_lnum);
 		c->lhead_offs = 0;
 	}

@@ -408,6 +409,7 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 	/* Switch to the next log LEB */
 	if (c->lhead_offs) {
 		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
+		ubifs_assert(c->lhead_lnum != c->ltail_lnum);
 		c->lhead_offs = 0;
 	}

-- 
1.8.1.4
