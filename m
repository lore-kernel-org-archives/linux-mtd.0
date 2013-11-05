Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdl2v-0001RS-6T
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 18:08:10 +0000
Received: by mail-ie0-f173.google.com with SMTP id u16so15892952iet.32
 for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2013 10:07:48 -0800 (PST)
Date: Tue, 5 Nov 2013 10:07:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/1] Bad block markers here, there and everywhere
Message-ID: <20131105180743.GM20061@ld-irv-0074.broadcom.com>
References: <1383652821-3557-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383652821-3557-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 05, 2013 at 09:00:20AM -0300, Ezequiel Garcia wrote:
> This commit adds a new option called NAND_BBT_DATA_BBM. The change itself
> is pretty small and simple to understand: when the badblock_pattern sets the
> NAND_BBT_DATA_BBM option, scan_block_fast() reads the data region instead
> of the OOB region.

I think this type of scanning method is better suited to a different
type of solution: implement a custom nand_chip.bad_block() call-back.
Unfortunately, nand_base/nand_bbt are kind of inconsistent, so that some
code paths use nand_chip.bad_block() and some use nand_bbt.c's scanning
code to check for bad block markers, so this is not currently a good
solution.

I've been meaning to follow through with an improved version of this
patch for a while:

  http://lists.infradead.org/pipermail/linux-mtd/2012-June/042571.html

Such a patch provides several benefits, one of them being that drivers
like yours can easily provide a custom BBM location. What do you think?

Brian
