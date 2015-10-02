Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zhwub-0006Ui-Gg
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 09:45:58 +0000
Message-ID: <560E50B6.5060103@cn.fujitsu.com>
Date: Fri, 2 Oct 2015 17:39:02 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
References: <1443631303-22057-1-git-send-email-sudipm.mukherjee@gmail.com>
In-Reply-To: <1443631303-22057-1-git-send-email-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/01/2015 12:41 AM, Sudip Mukherjee wrote:
> We should prevent user to erasing mtd device with an unaligned offset
> or length.
>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
>
> I am not sure if I should add the Signed-off-by of
> Dongsheng Yang <yangds.fnst@cn.fujitsu.com> . He is the original author
> and he should get the credit for that.

But I had sent a a patch out to fix this problem before your v1.

http://lists.infradead.org/pipermail/linux-mtd/2015-September/062234.html

Yang
>
>   drivers/mtd/devices/mtdram.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> index 8e28508..21b6a05 100644
> --- a/drivers/mtd/devices/mtdram.c
> +++ b/drivers/mtd/devices/mtdram.c
> @@ -32,8 +32,35 @@ MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
>   // We could store these in the mtd structure, but we only support 1 device..
>   static struct mtd_info *mtd_info;
>
> +static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +	int ret = 0;
> +	uint64_t temp_len, rem;
> +
> +	/* Start address must align on block boundary */
> +	temp_len = ofs;
> +	rem = do_div(temp_len, mtd->erasesize);
> +	if (rem) {
> +		pr_debug("%s: unaligned address\n", __func__);
> +		ret = -EINVAL;
> +	}
> +
> +	/* Length must align on block boundary */
> +	temp_len = len;
> +	rem = do_div(temp_len, mtd->erasesize);
> +
> +	if (rem) {
> +		pr_debug("%s: length not block aligned\n", __func__);
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
>   static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
>   {
> +	if (check_offs_len(mtd, instr->addr, instr->len))
> +		return -EINVAL;
>   	memset((char *)mtd->priv + instr->addr, 0xff, instr->len);
>   	instr->state = MTD_ERASE_DONE;
>   	mtd_erase_callback(instr);
>
