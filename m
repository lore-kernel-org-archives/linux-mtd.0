Received: from de01egw02.freescale.net ([192.88.165.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jc1gA-000095-Ox
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 17:02:19 +0000
Date: Wed, 19 Mar 2008 12:02:10 -0500
From: Scott Wood <scottwood@freescale.com>
To: Mike Hench <mhench@engagenet.com>
Subject: Re: [PATCH] MPC8313 NAND fixes
Message-ID: <20080319170210.GD7962@ld0162-tx32.am.freescale.net>
References: <6629C06B144F5C4098DFF95C4FF9DAF702BA1D02@mailsrv.engagenet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6629C06B144F5C4098DFF95C4FF9DAF702BA1D02@mailsrv.engagenet.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 19, 2008 at 10:28:19AM -0500, Mike Hench wrote:
> 
> From: Mike Hench 
> Sent: Wednesday, March 19, 2008 10:22 AM
> To: 'mhench@wi.rr.com'
> Subject: [PATCH] MPC813 NAND fixes

This patch is whitespace-mangled.  Also, please don't post HTML.

> -           unsigned int irq_status; /* status read from LTESR by irq
> handler */
> 
> +          volatile unsigned int irq_status; /* status read from LTESR
> by irq handler */

This change is not needed; both out_be32() and wait_event() act as
optimization barriers.

> @@ -379,13 +379,13 @@ static int fsl_elbc_run_command(struct m
> 
>                      in_be32(&lbc->fbar), in_be32(&lbc->fpar),
> 
>                      in_be32(&lbc->fbcr), priv->bank);
> 
>  
> 
> +          ctrl->irq_status = 0;
> 
>             /* execute special operation */
> 
>             out_be32(&lbc->lsor, priv->bank);
> 
>  
> 
>             /* wait for FCM complete flag or timeout */
> 
> -           ctrl->irq_status = 0;

ACK this change.

>             wait_event_timeout(ctrl->irq_wait, ctrl->irq_status,
> 
> -                              FCM_TIMEOUT_MSECS * HZ/1000);
> 
> +                             (FCM_TIMEOUT_MSECS * HZ)/1000);

This change is a no-op.  Multiplication and division are evaluated at the
same precedence, left-to-right.

>             if (mtd->writesize == 512) {
> 
>                         priv->page_size = 0;
> 
> -                       clrbits32(&lbc->bank[priv->bank].or,
> ~OR_FCM_PGS);
> 
> +                      clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);

D'oh!  Thanks for finding this.
ACK this change.

> -           /* The default u-boot configuration on MPC8313ERDB causes
> errors;
> 
> -           * more delay is needed.  This should be safe for other
> boards
> 
> -           * as well.
> 
> -           */
> 
> -           setbits32(&lbc->bank[priv->bank].or, 0x70);

And this one.

-Scott
