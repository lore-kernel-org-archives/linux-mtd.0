Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cOppo-00071R-6e
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 17:58:50 +0000
Date: Wed, 4 Jan 2017 18:58:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/15] mtd: nand: move Micron specific init logic in
 nand_micron.c
Message-ID: <20170104185827.18574c2d@bbrezillon>
In-Reply-To: <4f82a1e8-be0b-4dd5-f26e-b97af80029cd@gmail.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-11-git-send-email-boris.brezillon@free-electrons.com>
 <51f2f7a3-56a7-1117-ab15-dd8eb59a4373@gmail.com>
 <20170104181314.4f9a0c40@bbrezillon>
 <4f82a1e8-be0b-4dd5-f26e-b97af80029cd@gmail.com>
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

On Wed, 4 Jan 2017 18:22:31 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 01/04/2017 06:13 PM, Boris Brezillon wrote:
> > On Wed, 4 Jan 2017 16:15:46 +0100
> > Marek Vasut <marek.vasut@gmail.com> wrote:
> >   
> >> On 01/03/2017 02:01 PM, Boris Brezillon wrote:  
> >>> Move Micron specific initialization logic into nand_micron.c. This is
> >>> part of the "separate vendor specific code from core" cleanup process.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>    
> >>
> >> [...]
> >>  
> >>> diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
> >>> new file mode 100644
> >>> index 000000000000..ddb9adf12c21
> >>> --- /dev/null
> >>> +++ b/drivers/mtd/nand/nand_micron.c
> >>> @@ -0,0 +1,83 @@
> >>> +/*
> >>> + * Copyright (C) 2013 Boris Brezillon <boris.brezillon@free-electrons.com>    
> >>
> >> 2013-2017 ?  
> > 
> > 2017, indeed.
> >   
> >>  
> >>> + * This program is free software; you can redistribute it and/or modify
> >>> + * it under the terms of the GNU General Public License as published by
> >>> + * the Free Software Foundation; either version 2 of the License, or
> >>> + * (at your option) any later version.
> >>> + *
> >>> + * This program is distributed in the hope that it will be useful,
> >>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> + * GNU General Public License for more details.
> >>> + */
> >>> +
> >>> +#include <linux/mtd/nand.h>
> >>> +
> >>> +struct nand_onfi_vendor_micron {
> >>> +	u8 two_plane_read;
> >>> +	u8 read_cache;
> >>> +	u8 read_unique_id;
> >>> +	u8 dq_imped;
> >>> +	u8 dq_imped_num_settings;
> >>> +	u8 dq_imped_feat_addr;
> >>> +	u8 rb_pulldown_strength;
> >>> +	u8 rb_pulldown_strength_feat_addr;
> >>> +	u8 rb_pulldown_strength_num_settings;
> >>> +	u8 otp_mode;
> >>> +	u8 otp_page_start;
> >>> +	u8 otp_data_prot_addr;
> >>> +	u8 otp_num_pages;
> >>> +	u8 otp_feat_addr;
> >>> +	u8 read_retry_options;
> >>> +	u8 reserved[72];
> >>> +	u8 param_revision;
> >>> +} __packed;    
> >>
> >> Is this __packed really needed?
> >>  
> > 
> > I'm just copying an existing structure. And yes, it's probably unneeded
> > since all fields are u8, and the struct size in a multiple of 8 bytes,
> > but it shouldn't hurt either. 
> >   
> Could you send a patch to drop it, please ? :)
> 

Is there a strong reason to drop this attribute? All ONFI related
structs are using it to make sure the layout is not changed by the
compiler, and be able to cast a buffer container the ONFI param page
content to one of the nand_onfi_xxx struct.

Yes, this is currently not needed (at least for this struct), but I'd
prefer to keep nand_onfi_xxx definitions consistent if you don't mind,
unless you see a good reason to avoid using this __packed attribute.
