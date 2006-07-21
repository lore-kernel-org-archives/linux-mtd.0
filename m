Received: from roc.holo.8d.com ([64.254.227.115])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G40jU-0003gG-Ok
	for linux-mtd@lists.infradead.org; Fri, 21 Jul 2006 15:32:25 -0400
Message-ID: <44C12C0C.9080505@8d.com>
Date: Fri, 21 Jul 2006 15:33:32 -0400
From: Raphael Assenat <raph@8d.com>
MIME-Version: 1.0
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] CM-x270 NAND flash support
References: <44BC7AF4.7010304@compulab.co.il>
In-Reply-To: <44BC7AF4.7010304@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Rapoport wrote:
> +
> +/* This macro needed to ensure in-order operation of GPIO and local
> + * bus. Without both asm command and dummy uncached read there're
> + * states when NAND access is broken. I've looked for such macro(s) in
> + * include/asm-arm but found nothing approptiate.
> + * dmac_clean_range is close, but is makes cache invalidation
> + * unnecessary here and it cannot be used in module
> + */
> +#define DRAIN_WB() \
> +	do { \
> +		unsigned char dummy; \
> +		asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
> +		dummy=*((unsigned char*)UNCACHED_ADDR); \
> +	} while(0)
I think you should add the volatile keyword to the typecast:

dummy=*((volatile unsigned char*)UNCACHED_ADDR);

In the cm-x255 nand flash driver, I had problems without it (read errors, ecc errors, 
etc). Maybe the compiler is optimising this read away thinking it does nothing useful?

Regards,
Raphael Assenat
