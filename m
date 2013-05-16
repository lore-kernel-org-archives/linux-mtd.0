Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcsM7-0001OU-TZ
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 07:12:05 +0000
Message-ID: <1368688465.15764.172.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 01/11] mtd: add datasheet's ECC information to
 nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Thu, 16 May 2013 10:14:25 +0300
In-Reply-To: <51944184.7090107@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-2-git-send-email-b32955@freescale.com>
 <1368619917.15764.99.camel@sauron.fi.intel.com>
 <51944184.7090107@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2013-05-16 at 10:16 +0800, Huang Shijie wrote:
> 于 2013年05月15日 20:11, Artem Bityutskiy 写道:
> > On Wed, 2013-05-15 at 16:40 +0800, Huang Shijie wrote:
> >> + * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
> >> + *			Minimum amount of bit errors per @ecc_step guaranteed to
> >> + *			be correctable. If unknown, set to zero.
> >> + * @ecc_step:		[INTERN] ECC step required by the @ecc_strength,
> >> + *                      also from the datasheet. It is the recommended ECC step
> >> + *			size, if known; if unknown, set to zero.
> > Here and in other places you talk about "datasheet". Do you assume that
> > the real ECC strength/step used by NAND chips may be different? Or you
> > assume it must be the same?
> >
> The two fields are used to store the ecc info from the datasheet.
> The two fields are just for a reference.
> 
> [1] The nand controller may do not use these two fields, it's ok;
>      For example, the datasheet requires "4bits per 512 bytes".
>      The nand controller can uses 8bits per 512 bytes.
> 
> 
> [2] but sometimes the nand controller must use these two fields.
>      For example, the datasheet requires "40bits per 1024 bytes".
>      For the hardware limit, the nand controller(BCH) may supports the 
> 40bits ecc in the maximum.
>      So the nand controller must use these two fields now.

I wonder if it makes sense to name things so that it is clear form the
names whether that is the "theoretical" datasheet values or the real
ones. I would prefer to clearly distinguish between them, in names and
comments. Thoughts?

-- 
Best Regards,
Artem Bityutskiy
