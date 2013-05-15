Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcW5c-0000bl-Is
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 07:25:33 +0000
Message-ID: <1368602870.13665.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V4 1/9] mtd: add more comment for ecc_strength/ecc_size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 15 May 2013 10:27:50 +0300
In-Reply-To: <1366967337-5534-2-git-send-email-b32955@freescale.com>
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-2-git-send-email-b32955@freescale.com>
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

On Fri, 2013-04-26 at 17:08 +0800, Huang Shijie wrote:
> Add more commit for ecc_strength and ecc_size fields.
> We can treat the comment as the initial semantics for the two fields.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Huang, let me drop the 3 patches I already merged. Please, re-send them
in v5. I think this is better because I see you start applying patches
on top of them, which is a bit confusing.

>   * @cellinfo:		[INTERN] MLC/multichip data from chip ident
>   * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
> + *			The minimum number of bits correctability, if known;
> + *			if unknown, set to 0.

I find this confusing still. How about this comment.

ECC correctability from the datasheet. Minumum amount of bit errors per
@ecc_size guaranteed to be correctable). If unknown, set to zero.


>   * @ecc_size:		[INTERN] ECC size required by the @ecc_strength,
> - *                      also from the datasheet.
> + *                      also from the datasheet. It is the recommended ECC step
> + *			size, if known; if unknown, set to 0.

Silly question, why you call this one "ecc_size", and not "ecc_step"?

-- 
Best Regards,
Artem Bityutskiy
