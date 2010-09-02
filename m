Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrDqO-0001wD-K0
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 17:45:01 +0000
Received: by pzk3 with SMTP id 3so264064pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 10:44:59 -0700 (PDT)
Subject: Re: [PATCH 2/2 l2-mtd-2.6/dunno] NAND: fix almost all checkpatch
	warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201009021356.00275.ffainelli@freebox.fr>
References: <201009021356.00275.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 20:44:35 +0300
Message-ID: <1283449475.1694.8.camel@brekeke>
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

On Thu, 2010-09-02 at 13:56 +0200, Florian Fainelli wrote:
> -		aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
> +		aligned_pos = eccpos[start_step * chip->ecc.bytes] &
> +								~(busw - 1);

> -		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
> +		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] &
> +								(busw - 1))

> -				memcpy(buf, chip->buffers->databuf + col, bytes);
> +				memcpy(buf, chip->buffers->databuf + col,
> +									bytes);

Similar.

> -		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
> +		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32))
> +								+ 32 - 1;

May be something like:

chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32));
chip->chip_shift += 32 - 1;

or similar?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
