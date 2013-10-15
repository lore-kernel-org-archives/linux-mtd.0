Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW86Q-0006n7-Nc
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 17:08:15 +0000
Received: by mail-ob0-f174.google.com with SMTP id wm4so6107448obc.5
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2013 10:07:52 -0700 (PDT)
Date: Tue, 15 Oct 2013 10:07:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Priyanka Jain <Priyanka.Jain@freescale.com>
Subject: Re: [PATCH][v2] mtd: m25p80: Add support for Micron N25Q512A memory
Message-ID: <20131015170742.GR23337@ld-irv-0074.broadcom.com>
References: <1381815545-4518-1-git-send-email-Priyanka.Jain@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381815545-4518-1-git-send-email-Priyanka.Jain@freescale.com>
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 11:09:05AM +0530, Priyanka Jain wrote:
> Micron N25Q512A is a spi flash memory with following features:
> -64MB size, 1.8V, Mulitple I/O, 4KB Sector erase memory.
> -Memory is organised as 1024(64KB) main sectors.
> -Each sector is divided into 256 pages.
> -Register set/Opcodes are similar to other N25Q family products.
> 
> Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>

Applied to l2-mtd.git. Thanks!

Brian
