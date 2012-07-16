Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqg1J-00058T-4n
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 07:47:15 +0000
Date: Mon, 16 Jul 2012 09:43:24 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: physmap_of: Add "map-indirect" DT property
Message-ID: <20120716094324.5099746d@wker>
In-Reply-To: <1341303991-6219-1-git-send-email-sr@denx.de>
References: <1341303991-6219-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Albrecht Dress <albrecht.dress@arcor.de>, linux-mtd@lists.infradead.org,
 Stephan Gatzka <Stephan.Gatzka@hbm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

On Tue,  3 Jul 2012 10:26:31 +0200
Stefan Roese <sr@denx.de> wrote:

> On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause
> problems with JFFS2 usage, as the local bus (LPB) doesn't support
> unaligned accesses as implemented in the JFFS2 code via memcpy().
> By defining "map-indirect", the flash will not be exposed directly
> to the MTD users (e.g. JFFS2) any more.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Stephan Gatzka <Stephan.Gatzka@hbm.com>
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Albrecht Dress <albrecht.dress@arcor.de>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt |  7 +++++++
>  drivers/mtd/maps/physmap_of.c                         | 14 ++++++++++++++
>  2 files changed, 21 insertions(+)

The patch looks good, so

Acked-by: Anatolij Gustschin <agust@denx.de>

Thanks,
Anatolij
