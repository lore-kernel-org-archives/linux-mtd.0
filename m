Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GPTId-0006Aw-C4
	for linux-mtd@lists.infradead.org; Tue, 19 Sep 2006 01:17:20 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id k8J0E7nI012107
	for <linux-mtd@lists.infradead.org>; Mon, 18 Sep 2006 20:14:07 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k8J0E779271400
	for <linux-mtd@lists.infradead.org>; Mon, 18 Sep 2006 20:14:07 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k8J0E7Yn020541
	for <linux-mtd@lists.infradead.org>; Mon, 18 Sep 2006 20:14:07 -0400
Subject: Re: [PATCH 2/4] pmc551 remove unnecessary braces
From: Josh Boyer <jdub@us.ibm.com>
To: Jiri Slaby <jirislaby@gmail.com>
In-Reply-To: <91292912129122wcf1@karneval.cz>
References: <91292912129122wcf1@karneval.cz>
Content-Type: text/plain
Date: Mon, 18 Sep 2006 19:16:19 -0500
Message-Id: <1158624979.3600.31.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mark Ferrell <mferrell@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-09-19 at 00:47 +0200, Jiri Slaby wrote:
> 
> diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
> index 6d4d5a4..0ee22ca 100644
> --- a/drivers/mtd/devices/pmc551.c
> +++ b/drivers/mtd/devices/pmc551.c
> @@ -137,11 +137,11 @@ #endif
>  
>  	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr);
>  
> -	if (soff_hi == eoff_hi || mtd->size == priv->asize) {
> +	if (soff_hi == eoff_hi || mtd->size == priv->asize)
>  		/* The whole thing fits within one access, so just one shot
>  		   will do it. */
>  		memset(ptr, 0xff, instr->len);
> -	} else {
> +	else {
>  		/* We have to do multiple writes to get all the data
>  		   written. */
>  		while (soff_hi != eoff_hi) {

I actually find this change to make the code less readable.  Yes, the
braces aren't technically necessary, but the else requires them, and the
comment block before the memset makes this multi-line.

This whole patch is highly user preference, but I'd rather these braces
stay.


> @@ -700,9 +695,8 @@ static int __init init_pmc551(void)
>  
>  		if ((PCI_Device = pci_find_device(PCI_VENDOR_ID_V3_SEMI,
>  						  PCI_DEVICE_ID_V3_SEMI_V370PDC,
> -						  PCI_Device)) == NULL) {
> +						  PCI_Device)) == NULL)
>  			break;
> -		}

1) If you're going for coding style, the assignment within the if
condition needs to be moved outside of it.

2) If you're not going to fix 1, then leave the braces.

josh
