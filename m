Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ag4Fl-0007k6-LL
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2016 05:44:18 +0000
Subject: Re: [PATCH v8 0/3] mtd: Qualcomm NAND controller driver
To: Brian Norris <computersforpeace@gmail.com>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
 <20160310194731.GD2545@google.com>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <56E8F298.5000108@codeaurora.org>
Date: Wed, 16 Mar 2016 11:13:52 +0530
MIME-Version: 1.0
In-Reply-To: <20160310194731.GD2545@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/11/2016 01:17 AM, Brian Norris wrote:
> On Wed, Feb 03, 2016 at 02:29:48PM +0530, Archit Taneja wrote:
>> Add support for the NAND controller driver for SoC's that contain EBI2.
>> For now, the only SoC upstream that has EBI2 is IPQ806x.
>>
>> The previous version added a BBT flag that allowed BBMs to be accessed
>> in raw mode. Adding a flag isn't the right way to fix it, and the
>> proposed fix is to add badblockbits support, and make sure all drivers
>> switch to accessing BBM in raw mode. For now, skip nand_bbt usage, and
>> implement our own versions of chip->block_bad and chip->mark_bad.
>>
>> The first patch in the series contains a nand_base clean up which the
>> driver will utilize.
>>
>> Based over l2-mtd.git
>>
>> The patchset requires the v6 ADM dmaengine patches posted by Andy:
>>
>> https://lkml.org/lkml/2015/3/17/19
>
> Pushed to l2-mtd.git, with the following fixup (the layout->oobavail
> field has been dropped):

Thanks for taking this in and fixing the issues.

Archit

>
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 78dc790ae619..f550a57e6eea 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1733,7 +1733,6 @@ qcom_nand_create_layout(struct qcom_nand_host *host)
>
>   	layout->oobfree[0].offset = (steps - 1) * ecc->bytes + host->bbm_size;
>   	layout->oobfree[0].length = steps << 2;
> -	layout->oobavail = steps << 2;
>
>   	/*
>   	 * the oob bytes in the first n - 1 codewords are all grouped together
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
