Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrDlm-0001I0-SZ
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 17:40:19 +0000
Received: by vws11 with SMTP id 11so635431vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 10:40:13 -0700 (PDT)
Subject: Re: [PATCH 2/2 l2-mtd-2.6/dunno] NAND: fix almost all checkpatch
	warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201009021356.00275.ffainelli@freebox.fr>
References: <201009021356.00275.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 20:40:03 +0300
Message-ID: <1283449203.1694.4.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I appreciate clean-up patches, but I do not like few things in this one:

On Thu, 2010-09-02 at 13:56 +0200, Florian Fainelli wrote:
>  		/* send the command to read the particular ecc bytes */
>  		/* take care about buswidth alignment in read_buf */
> -		aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
> +		aligned_pos = eccpos[start_step * chip->ecc.bytes] &
> +								~(busw - 1);
>  		aligned_len = eccfrag_len;
>  		if (eccpos[start_step * chip->ecc.bytes] & (busw - 1))
>  			aligned_len++;
> -		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
> +		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] &
> +								(busw - 1))

This is not pretty, How about a temporary variable, e.g.

i = (start_step + num_steps) * chip->ecc.bytes;
if (eccpos[i] & (busw - 1))

> -				memcpy(buf, chip->buffers->databuf + col, bytes);
> +				memcpy(buf, chip->buffers->databuf + col,
> +									bytes);

This is not nice as well, too many indentations for 'bytes'

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
