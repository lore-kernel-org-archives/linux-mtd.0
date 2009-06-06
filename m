Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCyz0-0001IF-Dy
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 16:43:10 +0000
Date: Sun, 07 Jun 2009 01:42:55 +0900 (JST)
Message-Id: <20090607.014255.59491227.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [PATCH] mtd: remove driver-core BUS_ID_SIZE
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1244305502-20902-1-git-send-email-anemo@mba.ocn.ne.jp>
References: <1244305502-20902-1-git-send-email-anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: kay.sievers@vrfy.org, linux-mtd@lists.infradead.org, gregkh@suse.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun,  7 Jun 2009 01:25:02 +0900, Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> From: Kay Sievers <kay.sievers@vrfy.org>
> 
> The name size limit is gone from the driver-core, the BUS_ID_SIZE
> value will be removed.
> 
> [initial version by kay.sievers, reimplemented by dwmw2, adjusted by anemo]
> Cc: dwmw2@infradead.org
> Cc: linux-mtd@lists.infradead.org
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> ---
>  drivers/mtd/nand/txx9ndfmc.c |   16 ++++++++++++----
>  1 files changed, 12 insertions(+), 4 deletions(-)

Oops, sorry, I have send wrong patch.  Please ignore it.  I will send
right one soon.
