Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbHRr-0004G5-4L
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 19:26:19 +0000
Received: by bwf12 with SMTP id 12so2165517bwf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 12:26:12 -0700 (PDT)
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: david.wagner@free-electrons.com
Date: Mon, 27 Jun 2011 22:26:08 +0300
In-Reply-To: <1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1309202771.24805.11.camel@koala>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-24 at 15:34 +0200, david.wagner@free-electrons.com
wrote:
> +	/* Stolen from mtd_blkdevs.c */
> +	/* Create processing thread */
> +	dev->thread = kthread_run(ubi_ubiblk_thread, dev, "%s%d_%d",
> +				  "kubiblkd", dev->ubi_num, dev->vol_id);
> +	if (IS_ERR(dev->thread)) {
> +		ret = PTR_ERR(dev->thread);
> +		goto out_thread;
> +	}

Why we need a kernel thread? Could you please describe when exactly it
is needed and why we cannot avoid having it?

> +	ret = register_blkdev(0, "ubiblk");
> +	if (ret <= 0) {
> +		pr_err("UBIBLK: could not register_blkdev\n");
> +		return -ENODEV;
> +	}
> +	major = ret;
> +	pr_info("UBIBLK: device's major: %d\n", major);
> +
> +	mutex_init(&devtable_lock);
> +	ret = ubi_register_volume_notifier(&ubiblk_notifier, 0);
> +	if (ret < 0)
> +		return ret;

You should probably de-register the blkdev when you fail here.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
