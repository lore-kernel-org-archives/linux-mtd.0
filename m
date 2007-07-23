Subject: Re: [PATCH] Add NAND chip lock/unlock support
From: David Woodhouse <dwmw2@infradead.org>
To: "Steven J. Hill" <sjhill@realitydiluted.com>
In-Reply-To: <469EE912.6080307@realitydiluted.com>
References: <469EE912.6080307@realitydiluted.com>
Content-Type: text/plain
Date: Mon, 23 Jul 2007 11:52:30 +0100
Message-Id: <1185187950.14697.197.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-07-18 at 23:31 -0500, Steven J. Hill wrote:
> +       /* check if lock/unlock functions are supported *

Unterminated comment?

> +       if (!chip->lock)
> +               mtd->lock = NULL;
> +       else
> +               mtd->lock = chip->lock; 

Entirely needless conditional.

-- 
dwmw2
