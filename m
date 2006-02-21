Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBSwL-0007uh-4F
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 03:32:13 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1140509194.16321.21.camel@fuzzie.sanpeople.com>
References: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
	<20060220153536.GD7092@home.fluff.org>
	<1140465547.2480.764.camel@localhost.localdomain>
	<1140509194.16321.21.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Tue, 21 Feb 2006 09:32:42 +0100
Message-Id: <1140510762.2480.847.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben-mtd@fluff.org>
Subject: Re: NAND driver for AT91RM9200
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-21 at 10:06 +0200, Andrew Victor wrote:
> Hopefully the driver is now acceptable for addition to the MTD CVS /
> mainline kernels.  Thanks.

Can you please fix up the lines with >80 characters ?

> +	/* Allocate memory for the device structure */
> +	host = kmalloc(sizeof(struct at91_nand_host), GFP_KERNEL);
> +	if (!host) {
> +		printk(KERN_ERR "at91_nand: failed to allocate device structure.\n");
> +		return -ENOMEM;
> +	}
> +	memset(host, 0, sizeof(struct at91_nand_host));

Please use kzalloc

	tglx
