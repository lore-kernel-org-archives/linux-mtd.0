Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrdS-0001aI-GY
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:51:14 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so3299917pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:50:53 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:50:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: fsl-quadspi: Propagate the error from
 of_modalias_node()
Message-ID: <20141022085050.GL16128@brian-ubuntu>
References: <1413570669-30738-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413570669-30738-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 b45815@freescale.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2014 at 03:31:08PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> The 'map_failed' label will return 'ret', so we need to assign the error
> code to 'ret', otherwise the probe function will return success.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Applied to l2-mtd.git

Brian
