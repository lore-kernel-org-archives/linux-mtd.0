Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgzy-0003Us-2z
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 14:04:50 +0000
Message-ID: <542D5B69.4050609@codeaurora.org>
Date: Thu, 02 Oct 2014 17:04:25 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 2/4] UBI: Fastmap: Calc fastmap size correctly
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-3-git-send-email-richard@nod.at>
In-Reply-To: <1412029248-22454-3-git-send-email-richard@nod.at>
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

On 9/30/2014 1:20 AM, Richard Weinberger wrote:
> We need to add fm_sb too.
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   drivers/mtd/ubi/fastmap.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 0431b46..2b0d8d6 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -24,7 +24,8 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
>   {
>   	size_t size;
>
> -	size = sizeof(struct ubi_fm_hdr) + \
> +	size = sizeof(struct ubi_fm_sb) + \
> +		sizeof(struct ubi_fm_hdr) + \
>   		sizeof(struct ubi_fm_scan_pool) + \
>   		sizeof(struct ubi_fm_scan_pool) + \
>   		(ubi->peb_count * sizeof(struct ubi_fm_ec)) + \
>

Reviewed-by: Tanya Brokhman <tlinder@codeaurora.org>

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
