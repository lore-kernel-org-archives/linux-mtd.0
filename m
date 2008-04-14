Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlQKg-0004V9-So
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 15:10:59 +0000
Message-Id: <2DD737A1-A0DA-4D74-8F2B-6885FB434021@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
In-Reply-To: <20080311172328.GA7727@localhost.localdomain>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [PATCH 1/8] [POWERPC] fsl_elbc_nand: factor out localbus defines
Date: Mon, 14 Apr 2008 10:10:50 -0500
References: <20080311172106.GA4766@localhost.localdomain>
	<20080311172328.GA7727@localhost.localdomain>
Cc: Scott Wood <scottwood@freescale.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mar 11, 2008, at 12:23 PM, Anton Vorontsov wrote:
> This is needed to support other localbus peripherals, such as
> NAND on FSL UPM.
>
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> ---
>
> Would be great if someone from the MTD community will ack this patch
> to go through powerpc trees.
>
> Thanks,
>
> drivers/mtd/nand/fsl_elbc_nand.c |  219 + 
> +-----------------------------------
> include/asm-powerpc/fsl_lbc.h    |  223 +++++++++++++++++++++++++++++ 
> +++++++++
> 2 files changed, 235 insertions(+), 207 deletions(-)
> create mode 100644 include/asm-powerpc/fsl_lbc.h

applied.

- k
