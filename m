Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpEbn-00053L-2N
 for linux-mtd@lists.infradead.org; Sat, 07 Dec 2013 09:55:36 +0000
Date: Sat, 7 Dec 2013 10:55:07 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH v6 12/17] mtd: mpc5121_nfc: adjust for OF based clock
 lookup
Message-ID: <20131207105507.7bbf4283@crub>
In-Reply-To: <1385851897-23475-13-git-send-email-gsi@denx.de>
References: <1385851897-23475-1-git-send-email-gsi@denx.de>
 <1385851897-23475-13-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 30 Nov 2013 23:51:32 +0100
Gerhard Sittig <gsi@denx.de> wrote:

> after device tree based clock lookup became available, the NAND
> flash driver need no longer use the previous global "nfc_clk" name,
> but should use the "ipg" clock name specific to the OF node
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Gerhard Sittig <gsi@denx.de>
> ---
>  drivers/mtd/nand/mpc5121_nfc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to next. Thanks!

Anatolij
