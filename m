Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrXNo-0005cm-VN
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 18:22:41 +0000
Received: by mail-ie0-f169.google.com with SMTP id e14so3381083iej.28
 for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2013 10:22:19 -0800 (PST)
Date: Fri, 13 Dec 2013 10:22:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] mtd: sh_flctl: Fix warnings due to improper casts
Message-ID: <20131213182215.GZ27149@ld-irv-0074.broadcom.com>
References: <1385547448-13747-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385547448-13747-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 27, 2013 at 11:17:28AM +0100, Laurent Pinchart wrote:
> Cast pointers to uintptr_t instead of unsigned int. This fixes warnings
> on platforms where pointers have a different size than int.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/mtd/nand/sh_flctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Changes compared to v1:
> 
> - Cast to uintptr_t instead of unsigned long

This patch has been in l2-mtd.git, but I forgot to alert you. Thanks for
the patch!

Brian
