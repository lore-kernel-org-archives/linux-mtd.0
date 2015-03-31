Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YckJu-0004Fj-FD
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 00:46:19 +0000
Received: by pddn5 with SMTP id n5so2515181pdd.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 17:45:56 -0700 (PDT)
Date: Mon, 30 Mar 2015 17:45:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] mtd: nand: Prevent possible kernel lockup in
 nand_command()
Message-ID: <20150331004553.GG32500@ld-irv-0074>
References: <1424705199-11337-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1424705199-11337-1-git-send-email-rogerq@ti.com>
Cc: nm@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 23, 2015 at 05:26:39PM +0200, Roger Quadros wrote:
> If a NAND device is not really present or pin muxes are not correctly
> configured we can lock up the kernel waiting infinitely for NAND_STATUS
> to be ready.
> 
> This can be easily reproduced on TI's DRA7-evm board by booting it
> without NAND support in u-boot and disabling NAND pin muxes in the kernel.
> 
> Add timeout when waiting for NAND_CMD_RESET completion. As per ONFi v4.0
> tRST can be upto 250ms for EZ-NAND and 5ms for raw NAND.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Tested-by: Nishanth Menon <nm@ti.com>

Pushed to l2-mtd.git. Thanks.

Brian
