Received: from mail-yh0-x22f.google.com ([2607:f8b0:4002:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2V7n-0002gc-Gv
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 00:43:44 +0000
Received: by mail-yh0-f47.google.com with SMTP id v1so7241078yhn.34
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 17:43:21 -0700 (PDT)
Date: Wed, 2 Jul 2014 17:43:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: bf5xx_nand: drop no-op PM support
Message-ID: <20140703004312.GA7537@ld-irv-0074>
References: <1400613386-8502-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400613386-8502-1-git-send-email-computersforpeace@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Fabio Estevam <festevam@gmail.com>,
 Mike Frysinger <vapier.adi@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 20, 2014 at 12:16:26PM -0700, Brian Norris wrote:
> This driver's suspend/resume hooks are no-ops, so just remove them.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Julia Lawall <Julia.Lawall@lip6.fr>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Mike Frysinger <vapier.adi@gmail.com>

Pushed to l2-mtd.git.

Brian
