Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoNAE-0004Tt-FX
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 20:01:11 +0000
Date: Thu, 17 Sep 2009 21:00:54 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] Samsung SoCs: OneNAND support
Message-ID: <20090917200054.GB12766@n2100.arm.linux.org.uk>
References: <20090917081659.GA28591@july>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090917081659.GA28591@july>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 17, 2009 at 05:16:59PM +0900, Kyungmin Park wrote:
> +#include <asm/io.h>

Please make sure that you use linux/io.h

> +static int s3c_onenand_probe(struct platform_device *pdev)
> +{
> +	struct onenand_platform_data *pdata;
> +	struct onenand_chip *this;
> +	struct mtd_info *mtd;
> +	struct resource *r;
> +	int size, err;
> +	unsigned long ahb_addr = 0, ahb_addr_size;
> +
> +	if (!(cpu_is_s3c64xx() || cpu_is_s5pc1xx()))
> +		return -ENODEV;

Isn't it normal to leave these kind of decisions to the declaration of
the devices, rather than encoding it into the driver?
