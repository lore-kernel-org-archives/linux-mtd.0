Received: from n20.bullet.mail.mud.yahoo.com ([68.142.206.147])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4SmS-0008Lw-EX
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 04:42:58 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl
Date: Wed, 13 May 2009 21:42:29 -0700
References: <>
	<1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905132142.29697.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 May 2009, Troy Kisky wrote:
> +static const struct nand_ecclayout atmel_oobinfo_large __initdata = {

Doesn't this give you section warnings?  __initconst is what
I usually end up needing in such cases...

Also, for the davinci_nand driver this is going to need to
switch away from the ecclayout struct in the driver-private
area ... that's in a patch that (still) hasn't merged into
the MTD tree, but was stored there for the same reason that
you're submitting this patch:  the original code, using the
annoying ECC_HW_SYNDROME support, computed the layout.

- Dave
