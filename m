Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWTnC-00050v-VT
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 11:27:31 +0000
Message-ID: <4A718390.4080103@linutronix.de>
Date: Thu, 30 Jul 2009 13:27:12 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Stoyan Gaydarov <sgayda2@uiuc.edu>
Subject: Re: [PATCH 2/4] [mtd] fixed faulty check
References: <1248949506-20827-1-git-send-email-sgayda2@uiuc.edu>
In-Reply-To: <1248949506-20827-1-git-send-email-sgayda2@uiuc.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kay.sievers@vrfy.org, David.Woodhouse@intel.com, gregkh@suse.de,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stoyan Gaydarov wrote:
> This patche fixes a spelling error that has resulted from copy and pasting. The location of the error was found using a semantic patch but the semantic patch was not trying to find these errors. After looking things over it seemed logical that this change was needed. Please review it and then include the patch if it is in fact the correct change.
> 
> Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
> ---
>  drivers/mtd/maps/physmap_of.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 39d357b..2cc0b0d 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -215,7 +215,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
>  		goto err_out;
>  
>  	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
> -	if (!info)
> +	if (!mtd_list)
>  		goto err_out;
>  
>  	dev_set_drvdata(&dev->dev, info);
Yes, !mtd_list should be checked instead of !info. This is correct. 
However in error case you have to free info as well.
Can please make another patch?

Sebastian
