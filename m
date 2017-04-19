Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0vx9-0001R5-35
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 20:11:52 +0000
Received: by mail-io0-x244.google.com with SMTP id d203so6964592iof.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 13:11:30 -0700 (PDT)
Date: Wed, 19 Apr 2017 13:11:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/35] drivers/mtd: Convert remaining uses of pr_warning
 to pr_warn
Message-ID: <20170419201127.GD20555@google.com>
References: <cover.1487314666.git.joe@perches.com>
 <10bf2a94655fb273ec96ec7b5e93bab8d0c8d17f.1487314667.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bf2a94655fb273ec96ec7b5e93bab8d0c8d17f.1487314667.git.joe@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 16, 2017 at 11:11:37PM -0800, Joe Perches wrote:
> To enable eventual removal of pr_warning
> 
> This makes pr_warn use consistent for drivers/mtd
> 
> Prior to this patch, there were 7 uses of pr_warning and
> 31 uses of pr_warn in drivers/mtd
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Applied to l2-mtd.git
