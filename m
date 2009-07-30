Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWVIQ-0003Mj-5j
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 13:03:51 +0000
Message-ID: <4A719A27.8050509@linutronix.de>
Date: Thu, 30 Jul 2009 15:03:35 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Stoyan Gaydarov <sgayda2@uiuc.edu>
Subject: Re: [PATCH] [mtd] fixed faulty check
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
In-Reply-To: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
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
> Resubmit of a patch with some additions, see http://lkml.org/lkml/2009/7/30/97
> 
Please add a description of the path here. That's the place where people
are looking for them. The link might be a an additional reference.

> Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
> ---
>  drivers/mtd/maps/physmap_of.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 39d357b..e7ab5f0 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -215,7 +215,8 @@ static int __devinit of_flash_probe(struct of_device *dev,
>  		goto err_out;
>  
>  	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
> -	if (!info)
> +	if (!mtd_list)
> +		kfree(info);
>  		goto err_out;

This is not python, you have to be explicit about braces. Now your code
looks like this:

   	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
	if (!mtd_list)
		kfree(info);
	goto err_out;
>  
>  	dev_set_drvdata(&dev->dev, info);


Sebastian
