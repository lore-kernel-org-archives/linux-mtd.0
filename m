Received: from mail-oa0-x231.google.com ([2607:f8b0:4003:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoKU1-0002Qe-5c
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 21:59:49 +0000
Received: by mail-oa0-f49.google.com with SMTP id i4so17146174oah.8
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 13:59:27 -0800 (PST)
Date: Wed, 4 Dec 2013 13:59:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: nand: mxc_nand: Check the return value from
 clk_prepare_enable()
Message-ID: <20131204215923.GD27149@ld-irv-0074.broadcom.com>
References: <1385952602-20977-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385952602-20977-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 02, 2013 at 12:50:02AM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> clk_prepare_enable() may fail, so let's check its return value and propagate it
> in the case of error.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
