Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JfJi1-0001zd-7D
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 18:53:49 +0000
Message-ID: <47ED3EC5.8030508@freescale.com>
Date: Fri, 28 Mar 2008 13:53:57 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] mtd/nand/fsl_elbc_nand: workaround for hangs on MPC837X
References: <20080328184303.GA25882@localhost.localdomain>
In-Reply-To: <20080328184303.GA25882@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> @@ -495,6 +495,16 @@ static void fsl_elbc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
>  	}
>  
>  	memcpy_toio(&ctrl->addr[ctrl->index], buf, len);
> +#ifdef CONFIG_PPC_MPC837x
> +	/*
> +	 * This is workaround for the weird elbc hangs on the MPC837X CPUs,
> +	 * Scott Wood says: "...perhaps difference in how long it takes a
> +	 * write to make it through the localbus compared to a write to IMMR
> +	 * is causing problems, and sync isn't helping for some reason."
> +	 * Reading back the last byte helps though.
> +	 */
> +	in_8(&ctrl->addr[ctrl->index] + len - 1);
> +#endif

Let's do it regardless of chip -- odds are the issue exists on all 
implementations, and it's just a function of what frequencies things are 
running at.

-Scott
