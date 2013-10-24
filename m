Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZTFp-0006VW-NS
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 22:19:46 +0000
Received: by mail-ob0-f169.google.com with SMTP id uz6so181837obc.0
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 15:19:24 -0700 (PDT)
Date: Thu, 24 Oct 2013 15:19:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 fix] mtd: gpmi: fix the ecc regression
Message-ID: <20131024221920.GF20061@ld-irv-0074.broadcom.com>
References: <1382602484-12023-1-git-send-email-b32955@freescale.com>
 <1382604496-28118-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382604496-28118-1-git-send-email-b32955@freescale.com>
Cc: tharvey@gateworks.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 04:48:16PM +0800, Huang Shijie wrote:
> The legacy ecc layout is to use all the OOB area by computing the ecc strength
> and ecc step size ourselves.
> 
> The patch "2febcdf mtd: gpmi: set the BCHs geometry with the ecc info"
> makes the gpmi to use the ECC info(ecc strength and ecc step size)
> provided by the MTD code, and creates a different NAND ecc layout
> for the BCH , and use the new ecc layout, this brings a regression to us:
>    We can not mount the ubifs which was created by the old NAND ecc layout.
> 
> This patch fixes this issue by use the legacy ecc layout firstly, if it fails
> we try to use the new ecc layout.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Cc: stable@vger.kernel.org

I fixed up the language a little, dropped the 'stable', and pushed to
linux-mtd.git (in hopes of sending another pull request for 3.12). I'll
see if David wants to weigh in first.

Feel free to send your updated DT binding patch(es).

Brian
