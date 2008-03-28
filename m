Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JfK36-0002ZT-Bi
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 19:15:37 +0000
Message-ID: <47ED43E1.3010104@freescale.com>
Date: Fri, 28 Mar 2008 14:15:45 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH] mtd/nand/fsl_elbc_nand: workaround for hangs during nand
	write [was: Re: [PATCH] mtd/nand/fsl_elbc_nand: workaround for hangs
	on MPC837X]
References: <20080328184303.GA25882@localhost.localdomain>
	<47ED3EC5.8030508@freescale.com>
	<20080328191054.GA30765@localhost.localdomain>
In-Reply-To: <20080328191054.GA30765@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> From: Anton Vorontsov <avorontsov@ru.mvista.com>
> Subject: mtd/nand/fsl_elbc_nand: workaround for hangs during nand write
> 
> Using current driver elbc sometimes hangs during nand write. Reading back
> last byte helps though (thanks to Scott Wood for the idea).
> 
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
