Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zl4C-0005Gv-LI
	for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2003 23:46:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <E19zkca-0001jO-CD@phoenix.infradead.org>
References: <E19zkca-0001jO-CD@phoenix.infradead.org>
Message-Id: <1063838749.2690.0.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 17 Sep 2003 23:45:49 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/chips cfi_cmdset_0002.c,1.76,1.77
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-09-17 at 23:18 +0100, Thayne Harbaugh wrote:

> +	cli();
>  	if (fast) { /* Unlock bypass */
>  		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, NULL);
>  	}
> @@ -597,6 +614,7 @@
>  	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
>  	}
>  	cfi_write(map, datum, adr);
> +	sti();

You just broke the 2.6 build.

-- 
dwmw2
