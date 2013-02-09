Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U47ap-00030H-24
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2013 10:23:35 +0000
Date: Sat, 9 Feb 2013 10:22:44 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Philip Avinash <avinashphilip@ti.com>
Subject: Re: [PATCH v2 3/4] mtd: devices: elm: Low power transition support
Message-ID: <20130209102243.GH17852@n2100.arm.linux.org.uk>
References: <1360240618-11094-1-git-send-email-avinashphilip@ti.com>
 <1360240618-11094-4-git-send-email-avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1360240618-11094-4-git-send-email-avinashphilip@ti.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: khilman@ti.com, afzal@ti.com, tony@atomide.com,
 artem.bityutskiy@linux.intel.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 hvaibhav@ti.com, gururaja.hebbar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 07, 2013 at 06:06:57PM +0530, Philip Avinash wrote:
> +static int elm_suspend(struct device *dev)
> +{
> +	struct elm_info *info = dev_get_drvdata(dev);
> +	wait_queue_head_t wq;
> +	DECLARE_WAITQUEUE(wait, current);
> +
> +	init_waitqueue_head(&wq);
> +	while (1) {
> +		/* Make sure that ELM not running */
> +		if (info->idle) {
> +			add_wait_queue(&wq, &wait);
> +			schedule();
> +			remove_wait_queue(&wq, &wait);
> +		} else {
> +			break;
> +		}
> +	}

The above code looks really wrong - it will just spin endlessly with the
waitqueues doing nothing useful.  What are you trying to do here?
