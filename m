Received: from gateway-1237.mvista.com ([63.81.120.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBidl-0000UX-Nm
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 20:18:03 -0500
Message-ID: <43FBB6FF.4070203@mvista.com>
Date: Tue, 21 Feb 2006 16:57:35 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: "Vladimir A. Barinov" <vbarinov@ru.mvista.com>
References: <43A2F819.1040106@ru.mvista.com> <43C69EC2.2070601@mvista.com>
	<43F1D439.60205@ru.mvista.com>
In-Reply-To: <43F1D439.60205@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] PNX8550 NAND flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vladimir -- a couple comments.

> +	PNX8550_XIO_FLASH_CTRL = reg_nand;
> +	barrier();
> +}

barrier() at the end of a function shouldn't be needed, function exit is 
an implicit optimizer flush?


> +	pnx8550_nand_alloc_transfer_buffer();
> +
> +	memcpy(transferBuffer, buf, len);

Something should check for NULL return from kmalloc in both places this 
is called.

> +	/* Scan to find existence of the device */
> +	if (nand_scan(&pnx8550_mtd, 1)) {
> +		printk(KERN_ERR "No NAND devices\n");
> +		return -ENXIO;
> +	}
> +
> +	if (!transferBuffer) {
> +		printk(KERN_ERR
> +		    "Unable to allocate NAND data buffer for PNX8550\n");
> +		return -ENOMEM;
> +	}

Not sure why transferBuffer was expected to be allocated at this point 
(only when first read/write_buf called, scan does read_byte)?


-- 
Todd
