Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ExQBC-00014X-Se
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 09:45:32 -0500
From: Richard Purdie <rpurdie@rpsys.net>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060113114817.GG29663@stusta.de>
References: <20060113114817.GG29663@stusta.de>
Content-Type: text/plain
Date: Fri, 13 Jan 2006 14:45:02 +0000
Message-Id: <1137163503.6644.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC: 2.6 patch] MTD_NAND_SHARPSL and MTD_NAND_NANDSIM should
	be tristate's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-01-13 at 12:48 +0100, Adrian Bunk wrote:
> MTD_NAND=m and MTD_NAND_SHARPSL=y or MTD_NAND_NANDSIM=y are illegal 
> combinations that mustn't be allowed.
> 
> This patch fixes this bug by making MTD_NAND_SHARPSL and 
> MTD_NAND_NANDSIM tristate's.
> 
> Additionally, it fixes some whitespace damage at these options.
> 
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
> 
> This patch was already sent on:
> - 31 Dec 2005
> 


I can ack the MTD_NAND_SHARPSL part of the patch.

Richard
