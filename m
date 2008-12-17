Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCzzw-0004Dk-6a
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 17:15:48 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KC1001SE6MARCA0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 12:15:47 -0500 (EST)
Date: Wed, 17 Dec 2008 12:15:46 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] MTD: fix dataflash 64-bit divisions
In-reply-to: <1229532627.17960.37.camel@sauron>
Message-id: <alpine.LFD.2.00.0812171205290.30035@xanadu.home>
References: <1229532627.17960.37.camel@sauron>
Cc: David Brownell <david-b@pacbell.net>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Dec 2008, Artem Bityutskiy wrote:

> -	if ((instr->addr + instr->len) > mtd->size
> -			|| (instr->len % priv->page_size) != 0
> -			|| (instr->addr % priv->page_size) != 0)
> +	if (instr->addr + instr->len > mtd->size)
> +		return -EINVAL;
> +	tmp = instr->len;
> +	if (do_div(tmp, priv->page_size))
> +		return -EINVAL;
> +	tmp = instr->addr;
> +	if (do_div(tmp, priv->page_size))
>  		return -EINVAL;

Is it possible to have priv->page_size not a power of two?  If no then 
the above test is becoming rather costly, and something like:

	if ((instr->len | instr->addr) & (priv->page_size - 1))
		return -EINVAL;

would be much cheaper.

> -		pageaddr = instr->addr / priv->page_size;
> +		tmp = instr->len;
> +		do_div(tmp, priv->page_size);
> +		pageaddr = tmp;

Here I suggest you include <linux/math64.h> and use this instead:

	pageaddr = div_u64(instr->addr, priv->page_size);


Nicolas
