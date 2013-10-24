Received: from mail-oa0-x22c.google.com ([2607:f8b0:4003:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZTCF-0006Rp-Rp
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 22:16:04 +0000
Received: by mail-oa0-f44.google.com with SMTP id l20so173808oag.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 15:15:42 -0700 (PDT)
Date: Thu, 24 Oct 2013 15:15:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3] mtd: nand: pxa3xx: Fix registered MTD name
Message-ID: <20131024221536.GE20061@ld-irv-0074.broadcom.com>
References: <1382217565-11312-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382217565-11312-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

On Sat, Oct 19, 2013 at 06:19:25PM -0300, Ezequiel Garcia wrote:
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
> using the kernel parameter 'mtdparts', where the name is needed.
> 
> Therefore, to avoid regressions in users relying in 'mtdparts' we revert
> the change and use the previous one 'pxa3xx_nand-0'.
> 
> While at it, let's put a big comment and prevent this change from happening
> ever again.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed to linux-mtd.git, in hopes to submit a pull request for 3.12.

David, I have pushed and signed (with my new key) this and Huang's
regression fix to linux-mtd.git. I can send a pull request, or you can
just drop my tag and do it yourself. I'm not sure how long to wait at
this stage in the release cycle...

Brian
