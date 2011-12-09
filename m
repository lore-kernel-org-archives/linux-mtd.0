Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=TX2EHSOBE009.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ62k-0005RV-MF
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 19:23:39 +0000
Message-ID: <4EE26035.60408@freescale.com>
Date: Fri, 9 Dec 2011 13:23:33 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <shuo.liu@freescale.com>
Subject: Re: [PATCH 1/2] mtd/nand : set Nand flash page address to FBAR and
 FPAR correctly
References: <1323423775-26951-1-git-send-email-shuo.liu@freescale.com>
In-Reply-To: <1323423775-26951-1-git-send-email-shuo.liu@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org, leoli@freescale.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/09/2011 03:42 AM, shuo.liu@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> If we use the Nand flash chip whose number of pages in a block is greater
> than 64(for large page), we must treat the low bit of FBAR as being the
> high bit of the page address due to the limitation of FCM, it simply uses
> the low 6-bits (for large page) of the combined block/page address as the
> FPAR component, rather than considering the actual block size.
> 
> Signed-off-by: Liu Shuo <b35362@freescale.com>
> Signed-off-by: Jerry Huang <Chang-Ming.Huang@freescale.com>
> Signed-off-by: Tang Yuantian <b29983@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
