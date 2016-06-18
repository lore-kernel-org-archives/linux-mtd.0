Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEIvt-0005w6-8e
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 16:17:18 +0000
Subject: Re: [PATCH v3] ubifs: silence error output if MS_SILENT is set
To: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org
References: <5765615E.5010409@nod.at> <20160618155318.GA4285@makrotopia.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576573F5.8040507@nod.at>
Date: Sat, 18 Jun 2016 18:16:53 +0200
MIME-Version: 1.0
In-Reply-To: <20160618155318.GA4285@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.06.2016 um 17:53 schrieb Daniel Golle:
> This change completes
> commit 90bea5a3f0bf680b87b90516f3c231997f4b8f3b
> which already implements support for MS_SILENT except for that one
> error message which is still being displayed despite MS_SILENT being
> set. Suppress that error message as well in case MS_SILENT is set.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: logic was accidentally inverted, fix that.
> v3: add patch description
> 
>  fs/ubifs/super.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 7034995..736dd58 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2108,8 +2108,9 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
>  	 */
>  	ubi = open_ubi(name, UBI_READONLY);
>  	if (IS_ERR(ubi)) {
> -		pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
> -		       current->pid, name, (int)PTR_ERR(ubi));
> +		if (!(flags & MS_SILENT))
> +			pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
> +			       current->pid, name, (int)PTR_ERR(ubi));
>  		return ERR_CAST(ubi);
>  	}

I'll queue this patch for v4.8.

Thanks,
//richard
