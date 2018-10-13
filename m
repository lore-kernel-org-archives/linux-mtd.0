Subject: Re: [PATCH] ubifs: Fix WARN_ON logic in exit path
To: Richard Weinberger <richard@nod.at>, gregkh@linuxfoundation.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dunlap@infradead.org
References: <20181013081841.13369-1-richard@nod.at>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ab4fe8b1-330d-3aa9-a45b-761f65a31f2c@infradead.org>
Date: Sat, 13 Oct 2018 09:21:40 -0700
MIME-Version: 1.0
In-Reply-To: <20181013081841.13369-1-richard@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/13/18 1:18 AM, Richard Weinberger wrote:
> ubifs_assert() is not WARN_ON(), so we have to invert
> the checks.
> Randy faced this warning with UBIFS being a module, since
> most users use UBIFS as builtin because UBIFS is the rootfs
> nobody noticed so far. :-(
> Including me.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 54169ddd382d ("ubifs: Turn two ubifs_assert() into a WARN_ON()")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Thanks.  Works for me.

> ---
> Greg,
> 
> can you please take this patch directly?
> It fixes a brown paper bug which was introduced in rc1, I'd like to avoid
> having it in a release and going the -stable path.
> 
> Thanks,
> //richard
> ---
>  fs/ubifs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index bf000c8aeffb..fec62e9dfbe6 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2337,8 +2337,8 @@ late_initcall(ubifs_init);
>  
>  static void __exit ubifs_exit(void)
>  {
> -	WARN_ON(list_empty(&ubifs_infos));
> -	WARN_ON(atomic_long_read(&ubifs_clean_zn_cnt) == 0);
> +	WARN_ON(!list_empty(&ubifs_infos));
> +	WARN_ON(atomic_long_read(&ubifs_clean_zn_cnt) != 0);
>  
>  	dbg_debugfs_exit();
>  	ubifs_compressors_exit();
> 


-- 
~Randy
