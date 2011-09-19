Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5VrS-0000bT-EC
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 04:53:43 +0000
Received: by fxg7 with SMTP id 7so4358421fxg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Sep 2011 21:53:41 -0700 (PDT)
Subject: Re: [PATCH] ti816x: add support for nand on ti8168 evm
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Saxena, Parth" <parth.saxena@ti.com>
Date: Mon, 19 Sep 2011 07:56:20 +0300
In-Reply-To: <1315486982-30109-1-git-send-email-parth.saxena@ti.com>
References: <parth.saxena@ti.com>
	<1315486982-30109-1-git-send-email-parth.saxena@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316408187.24366.52.camel@sauron>
Mime-Version: 1.0
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-09-08 at 18:33 +0530, Saxena, Parth wrote:
> Add partition table for NAND device on TI8168 EVM
> and initialise the NAND module.
> 
> Signed-off-by: Saxena, Parth <parth.saxena@ti.com>
> Signed-off-by: Basheer, Mansoor Ahamed <mansoor.ahamed@ti.com>
> ---
> 
> This patch is tested on top of linux-omap/master and
> Hemant's patches submitted recently.
> 
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg53457.html
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg54296.html
> 
>  arch/arm/mach-omap2/board-ti8168evm.c |   39 +++++++++++++++++++++++++++++++++
>  1 files changed, 39 insertions(+), 0 deletions(-)

Please, send this patch to Tony, I think it should go in via the omap
tree, not via the MTD tree.

-- 
Best Regards,
Artem Bityutskiy
