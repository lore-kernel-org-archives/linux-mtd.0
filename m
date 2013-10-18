Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWyze-0006t4-Q1
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 01:36:47 +0000
Received: by mail-ie0-f175.google.com with SMTP id aq17so5471331iec.34
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2013 18:36:24 -0700 (PDT)
Date: Thu, 17 Oct 2013 18:36:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Fix registered MTD name
Message-ID: <20131018013618.GI23337@ld-irv-0074.broadcom.com>
References: <1382001897-2709-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382001897-2709-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 17, 2013 at 06:24:57AM -0300, Ezequiel Garcia wrote:
> In a recent commit:
> 
>   commit f455578dd961087a5cf94730d9f6489bb1d355f0
>   Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>   Date:   Mon Aug 12 14:14:53 2013 -0300
> 
>   mtd: nand: pxa3xx: Remove hardcoded mtd name
> 
>   There's no advantage in using a hardcoded name for the mtd device.
>   Instead use the provided by the platform_device.
> 
> The MTD name was changed to use the one provided by the platform_device.
> However, this can be problematic as some users want to set partitions
> using the kernel parameter 'mtdpart', where the name is needed.
> 
> For that reason, using a simpler and easier to remember name such
> as 'pxa3xx-nand' is certainly a better choice.

Hmm, if we're really interested in the user experience of 'mtdparts'
users, shouldn't we just revert to the old name ("pxa3xx_nand-0") to
avoid breaking systems? Or are there no users that would care?

Brian
