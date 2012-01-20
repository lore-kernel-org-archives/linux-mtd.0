Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoKxI-0003eA-9u
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2012 20:21:04 +0000
Message-ID: <4F19CC8E.6080908@freescale.com>
Date: Fri, 20 Jan 2012 14:20:30 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: Re: [PATCH] mtd/nand:Fix wrong usage of is_blank() in
 fsl_ifc_run_command
References: <1326859991-7469-1-git-send-email-prabhakar@freescale.com>
In-Reply-To: <1326859991-7469-1-git-send-email-prabhakar@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Poonam Aggrwal <poonam.aggrwal@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2012 10:13 PM, Prabhakar Kushwaha wrote:
> +		for (i = sector; i <= sector_end; i++) {
> +			errors = check_read_ecc(mtd, ctrl, eccstat, i);
> +
> +			if (errors == 15) {
> +				/*
> +				 * Uncorrectable error.
> +				 * OK only if the whole page is blank.
> +				 *
> +				 * We disable ECCER reporting due to...

s/due to.../due to/

Otherwise looks good.

-Scott
