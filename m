Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181Ou8-0006xe-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 11:26:24 +0100
Message-Id: <200210151025.g9FAP9221781@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] add access to AMD secure silicon area
Date: Tue, 15 Oct 2002 11:25:09 +0100
Cc: linux-mtd@lists.infradead.org
References: <200210030816.g938GaW03616@localhost.localdomain> <19345.1034676569@passion.cambridge.redhat.com>
In-Reply-To: <19345.1034676569@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>
> +	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> CFI_DEVICETYPE_X8, NULL); +	cfi_send_gen_cmd(0x55, cfi->addr_unlock2,
> chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL); +	cfi_send_gen_cmd(0x90,
> cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
> +	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
>
> Is this always correct?

It should be, it matches the command sequence in the data sheet for the 
AM29DL322D/323D/324D devices. 

>
> +        /* does this chip even have a secsi area? */
> +	if(cfi->mfr!=1)
> +		return -EINVAL;
> +	switch(cfi->id){
> +	case 0x50:
> +	case 0x53:
> +	case 0x55:
> +	case 0x56:
> +	case 0x5C:
> +	case 0x5F:
> +		break;
> +	default:
> +		return -EINVAL;
>
> Er, is this information not available from the CFI info? I really want to
> avoid having stuff like this in the chip drivers.

Unfortunately not. There's no mention of it at all in the AMD primary vendor 
specific extended query table v1.1 which is used on these devices. I don't 
like this method either but in the absence of CFI info I don't have any 
better ideas.

Clive
