Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NFkeF-00038M-Qy
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 08:33:24 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>, <akpm@linux-foundation.org>
References: <200911172245.nAHMjk8X001820@imap1.linux-foundation.org>
	<1259581084.19465.381.camel@macbook.infradead.org>
In-Reply-To: <1259581084.19465.381.camel@macbook.infradead.org>
Subject: RE: [patch 1/4] mtd-nand: davinci: Correct 4-bit error correction
Date: Wed, 2 Dec 2009 13:59:53 +0530
Message-ID: <00de01ca7329$9f092330$dd1b6990$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: nsnehaprabha@ti.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 30, 2009 at 17:08:04, David Woodhouse wrote:
> On Tue, 2009-11-17 at 14:45 -0800, akpm@linux-foundation.org wrote:
> > +       /*
> > +        * ECC_STATE field reads 0x3 (Error correction complete) immediately
> > +        * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
> > +        * begin trying to poll for the state, you may fall right out of your
> > +        * loop without any of the correction calculations having taken place.
> > +        * The recommendation from the hardware team is to wait till ECC_STATE
> > +        * reads less than 4, which means ECC HW has entered correction state.
> > +        */
> > +       do {
> > +               ecc_state = (davinci_nand_readl(info,
> > +                               NANDFSR_OFFSET) >> 8) & 0x0f;
> > +               cpu_relax();
> > +       } while (ecc_state < 4); 
> 
> Please can this have a timeout. Infinite loops waiting for hardware are
> generally a bad idea.
> 

David,

I'll add the timeout and re-submit this patch.

Thanks,
Sudhakar
