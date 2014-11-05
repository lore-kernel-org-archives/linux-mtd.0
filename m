Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2me-00031W-V1
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:46:09 +0000
Message-ID: <1415202307.958.125.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 06/35] UBI: Fastmap: Ensure that all fastmap work is
 done upon WL shutdown
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 05 Nov 2014 17:45:07 +0200
In-Reply-To: <1414586758-9972-7-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-7-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-10-29 at 13:45 +0100, Richard Weinberger wrote:
> ...otherwise the deferred work might run after datastructures
> got freed and corrupt memory.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/wl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index bd2e8d5..a06e31e 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -2047,6 +2047,9 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>  void ubi_wl_close(struct ubi_device *ubi)
>  {
>  	dbg_wl("close the WL sub-system");
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +	flush_work(&ubi->fm_work);
> +#endif

I see in patch 35 you introduced the init function. Could you please
introduce fastmap init/close functions earlier, and add this line to the
fastmap close function instead of adding yet another ifdef to wl.c.
