Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0ASb-000877-WF
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 08:52:58 +0000
Subject: Re: [PATCH] mtd_blkdevs.c: quiet a "symbol shadows" sparse warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E2455C@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901E2455C@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Oct 2009 11:52:15 +0300
Message-Id: <1256028735.29856.142.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-16 at 18:52 -0400, H Hartley Sweeten wrote:
> In register_mtd_blktrans(), the symbol 'ret' is already declared
> as an int at the start of the function.  The inner loop declaration
> is unnecessary.  Quiets the following sparse warning:
> 
>   warning: symbol 'ret' shadows an earlier one
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> 
> ---
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 8ca17a3..b76d6e5 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -379,7 +379,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>  	tr->blkcore_priv->thread = kthread_run(mtd_blktrans_thread, tr,
>  			"%sd", tr->name);
>  	if (IS_ERR(tr->blkcore_priv->thread)) {
> -		int ret = PTR_ERR(tr->blkcore_priv->thread);
> +		ret = PTR_ERR(tr->blkcore_priv->thread);
>  		blk_cleanup_queue(tr->blkcore_priv->rq);
>  		unregister_blkdev(tr->major, tr->name);
>  		kfree(tr->blkcore_priv); 

Applied to my l2-mtd-2.6.git. It starts sound silly, but again this did
not apply cleanly:

[dedekind@eru l2-mtd-2.6.git]$ git am -i -s
sweeten                                                                                                                  
Commit Body
is:                                                                                                                                                      
--------------------------                                                                                                                                           
mtd_blkdevs.c: quiet a "symbol shadows" sparse
warning                                                                                                               

In register_mtd_blktrans(), the symbol 'ret' is already declared
as an int at the start of the function.  The inner loop declaration
is unnecessary.  Quiets the following sparse warning:              

  warning: symbol 'ret' shadows an earlier one

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>   
--------------------------                                     
Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all e           
Commit Body is:                                                
--------------------------                                     
mtd: blkdevs: quiet a "symbol shadows" sparse warning          

In register_mtd_blktrans(), the symbol 'ret' is already declared
as an int at the start of the function.  The inner loop declaration
is unnecessary.  Quiets the following sparse warning:              

  warning: symbol 'ret' shadows an earlier one

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>   
--------------------------                                     
Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all y           
Applying: mtd: blkdevs: quiet a "symbol shadows" sparse warning
error: patch failed: drivers/mtd/mtd_blkdevs.c:379             
error: drivers/mtd/mtd_blkdevs.c: patch does not apply         
Patch failed at 0001 mtd: blkdevs: quiet a "symbol shadows" sparse
warning
When you have resolved this problem run "git am -i
--resolved".           
If you would prefer to skip this patch, instead run "git am -i
--skip".   
To restore the original branch and stop patching run "git am -i
--abort". 
[dedekind@eru l2-mtd-2.6.git]$ patch -p1 < .git/rebase-apply/patch 
patching file drivers/mtd/mtd_blkdevs.c                            
Hunk #1 succeeded at 388 with fuzz 1 (offset 9 lines).             
[dedekind@eru l2-mtd-2.6.git]$ git diff                            
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c 
index 0acbf4f..955226d 100644                                      
--- a/drivers/mtd/mtd_blkdevs.c                                    
+++ b/drivers/mtd/mtd_blkdevs.c                                    
@@ -388,7 +388,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops
*tr)
        tr->blkcore_priv->thread = kthread_run(mtd_blktrans_thread, tr,
                        "%sd", tr->name);
        if (IS_ERR(tr->blkcore_priv->thread)) {
-               int ret = PTR_ERR(tr->blkcore_priv->thread);
+               ret = PTR_ERR(tr->blkcore_priv->thread);
                blk_cleanup_queue(tr->blkcore_priv->rq);
                unregister_blkdev(tr->major, tr->name);
                kfree(tr->blkcore_priv);

Here is the tree:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
