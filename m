Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL3pX-0001kg-Hv
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 10:16:01 +0000
Date: Fri, 9 Nov 2018 11:15:48 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Make sure SFDP-based 4B_OPCODE
 support detection works correctly
Message-ID: <20181109111548.6b9d2f3d@bbrezillon>
In-Reply-To: <6fa42403-3a20-cdbe-caa7-d90c88b51e27@microchip.com>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <10fab1c5-1a40-9d7a-b9d4-ce48afa1635d@microchip.com>
 <20181108180842.48ce6d1b@bbrezillon>
 <6fa42403-3a20-cdbe-caa7-d90c88b51e27@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 Nov 2018 09:57:13 +0000
<Tudor.Ambarus@microchip.com> wrote:

> >> When SNOR_F_4B_OPCODES comes from bfpt, addr_width is set to 4. For the id-based
> >> caps detection, when mtd->size > 0x1000000, we set nor->addr_width = 4 too.
> >>
> >> The only uncovered case would be when
> >>         } else if (info->addr_width) {
> >>                 nor->addr_width = info->addr_width;
> >>
> >> but this can be solved by reordering the else if cases.
> >>
> >>         if (nor->addr_width) {
> >>                 /* already configured from SFDP */
> >>         } else if (mtd->size > 0x1000000) {
> >> 		...
> >>         } else if (info->addr_width) {
> >>                 nor->addr_width = info->addr_width;
> >>         } else {
> >>                 nor->addr_width = 3;
> >>         }
> >>
> >> What do you think?  
> > 
> > I'd rather not change that in this patch, but feel free to propose
> > a patch on top of mine to simplify the logic if you think it's
> > needed.
> >   
> 
> yeah, it can be made in a separate patch.

If you're okay with the current version, can you add a R-b?

Thanks,

Boris
