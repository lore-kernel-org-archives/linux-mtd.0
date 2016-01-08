Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHbAw-0002WP-7x
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 17:50:10 +0000
Received: by mail-pf0-x243.google.com with SMTP id 65so965571pff.2
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2016 09:49:49 -0800 (PST)
Date: Fri, 8 Jan 2016 09:49:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mtd@lists.infradead.org, Alex Smith <alex@alex-smith.me.uk>
Subject: Re: [PATCH] mtd: jz4780_nand: replace if/else blocks with switch/case
Message-ID: <20160108174947.GN109450@google.com>
References: <1452189188-139318-1-git-send-email-computersforpeace@gmail.com>
 <568FE348.7070805@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568FE348.7070805@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 08, 2016 at 04:26:48PM +0000, Harvey Hunt wrote:
> Hi Brian,
> 
> On 07/01/16 17:53, Brian Norris wrote:
> >Using switch/case helps make this logic more clear and more robust. With
> >this structure:
> >
> >  * it's clear that this driver only support ECC_{HW,SOFT,SOFT_BCH}; and
> >
> >  * we can sanely handle new ECC unsupported modes (right now, this code
> >    makes incorrect assumptions about the possible values in the
> >    nand_ecc_modes_t enum; e.g., what happens with NAND_ECC_HW_OOB_FIRST?)
> >
> >Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >Cc: Alex Smith <alex@alex-smith.me.uk>
> >Cc: Harvey Hunt <harvey.hunt@imgtec.com>
> 
> I've just tested this on a Ci20 and all seems well.
> 
> Tested-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Acked-by: Harvey Hunt <harvey.hunt@imgtec.com>

Great, applied to l2-mtd.git
