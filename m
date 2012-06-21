Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShleC-0004G1-0B
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 17:58:24 +0000
Message-ID: <4FE360A9.4040102@newsguy.com>
Date: Thu, 21 Jun 2012 10:58:01 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC PATCH v2] MTD: nand: add return value for
 write_page()/write_page_raw() functions in structure of nand_ecc_ctrl.
References: <1339567570-4816-1-git-send-email-josh.wu@atmel.com>
 <4FE13CB2.3000605@atmel.com>
 <CAN8TOE8iDtzw4eTKa6tJ5oBxbaDUxg9nDLaKBhW4D86vGWxGJg@mail.gmail.com>
In-Reply-To: <CAN8TOE8iDtzw4eTKa6tJ5oBxbaDUxg9nDLaKBhW4D86vGWxGJg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: bryan.wu@analog.com, jack.lan@freescale.com, nick.spence@freescale.com,
 dedekind1@gmail.com, dwmw2@infradead.org, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, tglx@linutronix.de, tie-fei.zang@freescale.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/20/2012 11:43 AM, Brian Norris wrote:
> 
> I noticed, for instance, that docg4.c has some strange code involving
> a return in a void function (comment below). If that is the *only*
> existing return statement within an 'ecc_ctrl.write_page'
> implmentation, then this whole patch is unneeded; you can just remove
> the 'return' in docg4.c.
> 
>>> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
>>> index a225e49..0f2ffd7 100644
>>> --- a/drivers/mtd/nand/docg4.c
>>> +++ b/drivers/mtd/nand/docg4.c
> ...
>>> -static void docg4_write_page_raw(struct mtd_info *mtd, struct nand_chip
>>> *nand,
>>> +static int docg4_write_page_raw(struct mtd_info *mtd, struct nand_chip
>>> *nand,
>>>                                 const uint8_t *buf, int oob_required)
>>>  {
>>>        return write_page(mtd, nand, buf, false);
>>>  }
> 
> Hmm, this used to be a void function, returning the result of another
> void function? I would think the compiler would have warned about
> these issues before. Anyway, this is a useless 'return' statement and
> can be killed with no real effect.


Oops, yes, this must have been a careless mistake when I combined the read_page
and read_page_raw functions into one, with wrappers for each case.  Oddly, no
compiler warning.  I'm trying to get around to putting together a patch with a
couple minor fixes for the docg4, and I'll add this to the list.

Thanks Brian,
Mike
