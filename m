Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFWlK-0002Ol-MK
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 19:20:31 +0000
Date: Thu, 28 Apr 2011 20:20:17 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v6 1/3] MTD : add the common code for GPMI controller
	driver
Message-ID: <20110428192017.GO17290@n2100.arm.linux.org.uk>
References: <1303267549-18377-1-git-send-email-b32955@freescale.com>
	<1303267549-18377-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1303267549-18377-2-git-send-email-b32955@freescale.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 20, 2011 at 10:45:47AM +0800, Huang Shijie wrote:
> +static inline int acquire_clock(struct gpmi_nfc_data *this, struct clk **clock)
> +{
> +	struct clk *c;
> +
> +	c = clk_get(&this->pdev->dev, NULL);
> +	if (IS_ERR(c)) {
> +		log("Can't own clock");
> +		return PTR_ERR(c);
> +	}
> +	*clock = c;
> +	return 0;
> +}
> +
> +static void release_clock(struct gpmi_nfc_data *this, struct clk *clock)
> +{
> +	clk_put(clock);
> +}

Do you really need to abstract like this?  It appears to just complicate
the code unnecessarily.

> +#define log(a, ...) printk(KERN_INFO "[ %s : %.3d ] "a"\n", \
> +			__func__, __LINE__,  ## __VA_ARGS__)

Also, I don't like this log() function.  You can do the same with:

#define pr_fmt(fmt) "[ %s : %.3d ] " fmt, __func__, __LINE__

and use pr_info() instead.  Note that it's generally frowned upon to
hide the \n inside the pr_fmt().
