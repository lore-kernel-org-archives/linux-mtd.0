Received: from bh-25.webhostbox.net ([208.91.199.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpQvG-0007jG-8v
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 01:13:35 +0000
Subject: Re: [PATCH -next] mtd: fsl-quadspi: Never build on SPARC
To: Brian Norris <computersforpeace@gmail.com>, Han Xu <b45815@freescale.com>
References: <1445437906-23633-1-git-send-email-linux@roeck-us.net>
 <20151023010757.GI13239@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5629899C.5040404@roeck-us.net>
Date: Thu, 22 Oct 2015 18:13:00 -0700
MIME-Version: 1.0
In-Reply-To: <20151023010757.GI13239@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/2015 06:07 PM, Brian Norris wrote:
> + Han
>
> On Wed, Oct 21, 2015 at 07:31:46AM -0700, Guenter Roeck wrote:
>> Attempts to build fsl-quadspi on SPARC fail with
>>
>> drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
>> drivers/mtd/spi-nor/fsl-quadspi.c:369:1: error:
>> 	'LUT_0' undeclared (first use in this function)
>> drivers/mtd/spi-nor/fsl-quadspi.c:418:1: error:
>> 	pasting "LUT_" and "(" does not give a valid preprocessing token
>> drivers/mtd/spi-nor/fsl-quadspi.c:418:2: error:
>> 	implicit declaration of function 'LUT_'
>
> I don't think this is only a SPARC problem. The macro concatenation is
> generally suspect.
>
> I see that READ and WRITE are problems at least. If something like
> <linux/fs.h> gets included somehow, then these tokens resolve to
> integers or expressions before they fall through to literal
> concatentation, so we get 'LUT_0' or 'LUT_(1ULL << __REQ_WRITE)' instead
> of 'LUT_READ' and 'LUT_WRITE'.
>
You are right, that deserves a better fix. I'll leave it up to you.

Thanks,
Guenter
