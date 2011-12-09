Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=TX2EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ649-0005X4-TX
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 19:25:06 +0000
Message-ID: <4EE2608B.4000103@freescale.com>
Date: Fri, 9 Dec 2011 13:24:59 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <shuo.liu@freescale.com>
Subject: Re: [PATCH 2/2 v4] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1323423775-26951-1-git-send-email-shuo.liu@freescale.com>
 <1323423775-26951-2-git-send-email-shuo.liu@freescale.com>
In-Reply-To: <1323423775-26951-2-git-send-email-shuo.liu@freescale.com>
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
> From: Liu Shuo <shuo.liu@freescale.com>
> 
> Freescale FCM controller has a 2K size limitation of buffer RAM. In order
> to support the Nand flash chip whose page size is larger than 2K bytes,
> we read/write 2k data repeatedly by issuing FIR_OP_RB/FIR_OP_WB and save
> them to a large buffer.
> 
> Signed-off-by: Liu Shuo <shuo.liu@freescale.com>
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>
> ---
> v4 : allocate (8+1)k buffer for large page chip.
> 
>  drivers/mtd/nand/fsl_elbc_nand.c |  246 ++++++++++++++++++++++++++++++++++----
>  1 files changed, 221 insertions(+), 25 deletions(-)

Again, I think we need to sort out the bad block migration first -- at
least how we're going to mark the chip as having been migrated, so the
driver can check for it.

-Scott
