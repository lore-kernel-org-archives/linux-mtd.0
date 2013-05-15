Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcaWX-00077X-Td
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 12:09:38 +0000
Message-ID: <1368619917.15764.99.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 01/11] mtd: add datasheet's ECC information to
 nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 15 May 2013 15:11:57 +0300
In-Reply-To: <1368607232-2210-2-git-send-email-b32955@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 16:40 +0800, Huang Shijie wrote:
> + * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
> + *			Minimum amount of bit errors per @ecc_step guaranteed to
> + *			be correctable. If unknown, set to zero.
> + * @ecc_step:		[INTERN] ECC step required by the @ecc_strength,
> + *                      also from the datasheet. It is the recommended ECC step
> + *			size, if known; if unknown, set to zero.

Here and in other places you talk about "datasheet". Do you assume that
the real ECC strength/step used by NAND chips may be different? Or you
assume it must be the same?

-- 
Best Regards,
Artem Bityutskiy
