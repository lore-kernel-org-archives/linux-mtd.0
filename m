Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGgBg-00046E-5W
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 03:22:21 +0000
Message-ID: <53E836A7.8040806@huawei.com>
Date: Mon, 11 Aug 2014 11:21:11 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] UBIFS: fix free log space calculation
References: <1405514528-14649-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1405514528-14649-1-git-send-email-dedekind1@gmail.com>
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

> ---
>  fs/ubifs/log.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
> index ed24422..7e818ec 100644
> --- a/fs/ubifs/log.c
> +++ b/fs/ubifs/log.c
> @@ -106,10 +106,14 @@ static inline long long empty_log_bytes(const struct ubifs_info *c)
>  	h = (long long)c->lhead_lnum * c->leb_size + c->lhead_offs;
>  	t = (long long)c->ltail_lnum * c->leb_size;
>  
> -	if (h >= t)
> +	if (h > t)
>  		return c->log_bytes - h + t;
> -	else
> +	else if (h != t)
>  		return t - h;
> +	else if (c->lhead_lnum != c->ltail_lnum)
> +		return 0;
> +	else
> +		return c->log_bytes;
>  }
>  
>  /**
> 

Hi Artem,

After almost one month test, the error I've reported

UBIFS: background thread "ubifs_bgt0_0" started, PID 2222
UBIFS: recovery needed
UBIFS error (pid 2220): replay_log_leb: first log node at LEB 4:0 is not CS node
UBIFS error (pid 2220): replay_log_leb: log error detected while replaying the log at LEB 4:0
 magic          0x6101831
 crc            0x81e22cd5
 node_type      8 (reference node)
 group_type     0 (no node group)
 sqnum          2375337
 len            64
 lnum           5273
 offs           122880
 jhead          2
UBIFS: background thread "ubifs_bgt0_0" stops

never came out again.

I think this patch really solve that problem. Now I want to show my
analysis and wish you add "Cc stable" for this patch.

With the help of ubidump tool, I got the MST NODEs and LOG NODEs of
the image which is broken.

master node:

look at LEB 1:20480 (106496 bytes left)
scanning master node at LEB 1:20480
	magic          0x6101831
	crc            0x38ff5c67
	node_type      7 (master node)
	group_type     0 (no node group)
	sqnum          15799802
	len            512
	highest_inum   161
	commit number  7954
	flags          0x3
	log_lnum       4
	root_lnum      2258
	root_offs      7048
	root_len       148
	gc_lnum        2324
	ihead_lnum     2258
	ihead_offs     8192
	index_size     2511408
	lpt_lnum       15
	lpt_offs       113571
	nhead_lnum     15
	nhead_offs     114688
	ltab_lnum      15
	ltab_offs      110592
	lsave_lnum     0
	lsave_offs     0
	lscan_lnum     2930
	leb_cnt        6844
	empty_lebs     3362
	idx_lebs       23
	total_free     430188544
	total_dirty    56069504
	total_used     377968720
	total_dead     7032
	total_dark     31196320
look at LEB 1:20992 (105984 bytes left)
scanning padding node at LEB 1:20992
1508 bytes padded at LEB 1:20992, offset now 22528
look at LEB 1:22528 (104448 bytes left)
hit empty space at LEB 1:22528
stop scanning LEB 1 at offset 126976

log nodes:

leb number     first sqnum   first node type    full/not full
   3            15801163         ref node           full
   4            15801288         ref node           full
   5            15801433         ref node           full
   6            15801598         ref node           full
   7            15801966         ref node         not full
   8            15800414         ref node           full
   9            15800538         ref node           full
  10            15800664         ref node           full
  11            15800789         ref node           full
  12            15800915         ref node           full
  13            15801039         ref node           full

The min_io_size of this device is 2048 and the leb_size of it is
126976. Each of leb is full except 7 means no frequently power
cutting happen because log leb will change into next one if the
volume is remount.

We know cs node must in leb 4 as @log_lnum is 4 in mst node. But
it is a ref node as we see it in leb 4. What happened?

Leb 7 has the highest sqnum and it is not full, that means it is
the last log leb before an unclean power off. So we know leb 8 is
the oldest log leb exist. But it has a higher sqnum than mst node,
15799802, that means mst node is written before the oldest node
in current log area.

Each time we write a cs node, we write a new mst node. The sqnum
of this mst node should higher than cs node. So the cs node in
leb 4 is overlapped.

We keep an empty leb in log area by @min_log_bytes to start-up a
new commit. When commit start, we may use this leb and set
@min_log_bytes to zero.

Suppose old ltail_lnum is 5 and lhead_lnum is 3, leb 3 is full and
a new commit start. We write a new cs node at the beginning of leb
4 and set @min_log_bytes to zero. Now, as empty_log_bytes() is wrong,
ubifs_add_bud_to_log() may wrap leb 5, leb 6... At last, overlap
the leb 4 which has the newest cs node and mst_node would point to,
why not? we don't have any assertion or any protection to void this
except the check of empty_log_bytes() with an error shows above.

Now an unfortunately power cut happens, this volume is broken.

I think this patch fixed this problem by correctly protect the log
area. So maybe you can add "Cc stable" before you send it to mainline.

By the way, commit 8989cd69b9d2 "UBIFS: fix a race condition" fix
a real potential race and useful for avoiding errors in log area.
Could you please add "Cc stable" for it too?


Thanks,

Hu
