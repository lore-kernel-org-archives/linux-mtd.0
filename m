Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZg4s-00048F-Db
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 13:05:51 +0000
Message-ID: <542D4D95.6000503@codeaurora.org>
Date: Thu, 02 Oct 2014 16:05:25 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
 shutdown
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-2-git-send-email-richard@nod.at>
In-Reply-To: <1412029248-22454-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 9/30/2014 1:20 AM, Richard Weinberger wrote:
> ...otherwise the deferred work might run after datastructures
> got freed and corrupt memory.
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   drivers/mtd/ubi/wl.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 20f491713..dc01b1f 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -2029,6 +2029,9 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>   void ubi_wl_close(struct ubi_device *ubi)
>   {
>   	dbg_wl("close the WL sub-system");
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +	flush_work(&ubi->fm_work);

flush_work returns bool. It might be useful to print that value for 
debugging.

> +#endif
>   	cancel_pending(ubi);
>   	protection_queue_destroy(ubi);
>   	tree_destroy(&ubi->used);
>

Thanks
Tanya Brokhman
-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
