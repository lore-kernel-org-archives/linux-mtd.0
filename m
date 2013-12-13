Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrXOc-0005g3-LG
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 18:23:31 +0000
Received: by mail-ie0-f178.google.com with SMTP id lx4so3375193iec.9
 for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2013 10:23:09 -0800 (PST)
Date: Fri, 13 Dec 2013 10:23:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] mtd: sh_flctl: Use devm_* managed allocators
Message-ID: <20131213182306.GA27149@ld-irv-0074.broadcom.com>
References: <1385548064-27234-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385548064-27234-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
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

On Wed, Nov 27, 2013 at 11:27:44AM +0100, Laurent Pinchart wrote:
> This simplifies error and cleanup code paths.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This patch has been in l2-mtd.git, but I forgot to warn you. Thanks for
the patch!

Brian
