Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzdGZ-0006Yn-E0
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 03:21:12 +0000
Received: by mail-pd0-f172.google.com with SMTP id y13so8325782pdi.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 19:20:50 -0800 (PST)
Date: Fri, 12 Dec 2014 19:20:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: chenjie6@huawei.com
Subject: Re: [PATCH] [RESEND] jffs2: bugfix of summary length
Message-ID: <20141213032047.GQ21347@ld-irv-0074>
References: <1418324624-29697-1-git-send-email-chenjie6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418324624-29697-1-git-send-email-chenjie6@huawei.com>
Cc: akpm@linux-foundation.org, lizefan@huawei.com,
 linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 zengweilin@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 12, 2014 at 03:03:44AM +0800, chenjie6@huawei.com wrote:
> From: chenjie <chenjie6@huawei.com>

Can you put your real name here? You have it (presumably) correct in the
sign-off.

> 
> When power is off, the magic of summary is writed but the length not 
> so the length is 0xffffffff, sumlen maybe very large. 
> The kmalloc() failed  and mount failed.

Did you catch this during power-cut testing? On real hardware or
emulation?

> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen Jie <chenjie6@huawei.com>
> ---
>  fs/jffs2/scan.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
> index 7654e87..6187e56 100644
> --- a/fs/jffs2/scan.c
> +++ b/fs/jffs2/scan.c
> @@ -510,6 +510,9 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
>  				sumlen = c->sector_size - je32_to_cpu(sm->offset);
>  				sumptr = buf + buf_size - sumlen;
>  
> +				if (sumlen > c->sector_size)
> +					goto full_scan;

Can you add a comment above this to suggest why this would occur?

> +
>  				/* Now, make sure the summary itself is available */
>  				if (sumlen > buf_size) {
>  					/* Need to kmalloc for this. */
> @@ -544,6 +547,7 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
>  		}
>  	}
>  
> +full_scan:
>  	buf_ofs = jeb->offset;
>  
>  	if (!buf_size) {

I'll admit, I'm not much of a JFFS2 developer. I'll have to take a
little closer look at this before I'm comfortable taking this, esp. with
the -stable tag.

Brian
