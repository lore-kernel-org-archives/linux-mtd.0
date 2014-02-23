Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOoB-000107-80
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:28:47 +0000
Received: by mail-pa0-f41.google.com with SMTP id fa1so5067134pad.14
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:28:25 -0800 (PST)
Date: Sat, 22 Feb 2014 18:28:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Propagate the error if platform_get_irq()
 fails
Message-ID: <20140223022823.GF11836@norris-Latitude-E6410>
References: <1392347374-8481-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392347374-8481-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 01:09:34AM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Check the return value from platform_get_irq() and propagate it in the case of
> error.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
