Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5ac-0003de-Ez
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:40:51 +0000
Message-ID: <1363257704.11441.102.camel@sauron.fi.intel.com>
Subject: Re: [RFC "v2"] mtd: nand: reintroduce NAND_NO_READRDY as
 NAND_NEED_READRDY
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 14 Mar 2013 12:41:44 +0200
In-Reply-To: <1363193491-1843-1-git-send-email-computersforpeace@gmail.com>
References: <1363193491-1843-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Alexander Shiyan <shc_work@mail.ru>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-13 at 09:51 -0700, Brian Norris wrote:
> +			if (chip->options & NAND_NEED_READRDY) {
> +				/* Apply delay or wait for ready/busy pin */
> +				if (!chip->dev_ready)
> +					udelay(chip->chip_delay);
> +				else
> +					nand_wait_ready(mtd);
> +			}

Am I right that this is a small page NAND-specific thing? If yes, can we
just this magic to all small page NANDs without introducing the option?

Also, irrespectively of the final solution, let's do it this way:

1. Create a patch against the 3.9-rc2, not l2-mtd.git, and test it.
2. Add Cc stable, just like David asked.
2. Bug David to merge it.
3. I rebase the l2 tree on top of that.

-- 
Best Regards,
Artem Bityutskiy
