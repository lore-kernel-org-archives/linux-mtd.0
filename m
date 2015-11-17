Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZylEA-0007KF-SW
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 18:43:42 +0000
Received: by pacdm15 with SMTP id dm15so16537433pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 10:43:18 -0800 (PST)
Date: Tue, 17 Nov 2015 10:43:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mxc_nand: Remove bit-or operation with zero
Message-ID: <20151117184315.GH8456@google.com>
References: <1447775930-11439-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447775930-11439-1-git-send-email-fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 01:58:50PM -0200, Fabio Estevam wrote:
> Doing a bit-or operation with zero is pointless.
> 
> Remove this unneeded bit-or.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Applied to l2-mtd.git
