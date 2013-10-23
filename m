Received: from mail-qe0-x22f.google.com ([2607:f8b0:400d:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ1Xw-0002ub-VE
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 16:44:37 +0000
Received: by mail-qe0-f47.google.com with SMTP id b4so644898qen.6
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 09:44:15 -0700 (PDT)
Date: Wed, 23 Oct 2013 09:44:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: Re: [PATCH] driver/mtd/ifc: Read Status while programming NAND flash
Message-ID: <20131023164411.GV23337@ld-irv-0074.broadcom.com>
References: <1380780401-6640-1-git-send-email-prabhakar@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380780401-6640-1-git-send-email-prabhakar@freescale.com>
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 03, 2013 at 11:36:41AM +0530, Prabhakar Kushwaha wrote:
> as per controller description,
>   "While programming a NAND flash, status read should never skipped.
>    Because it may happen that a new command is issued to the NAND Flash,
>    even when the device has not yet finished processing the previous request.
>    This may result in unpredictable behaviour."
> 
> IFC controller never polls for R/B signal after command send. It just return
> control to software. This behaviour may not occur with NAND flash access.
> because new commands are sent after polling R/B signal. But it may happen
> in scenario where GPCM-ASIC and NAND flash device are working simultaneously.
> 
> Update the controller driver to take care of this requirement
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
