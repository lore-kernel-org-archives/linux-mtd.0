Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDkdy-0006oV-6I
 for linux-mtd@lists.infradead.org; Thu, 13 Feb 2014 00:59:10 +0000
Received: by mail-ob0-f176.google.com with SMTP id gq1so11319282obb.7
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2014 16:58:48 -0800 (PST)
Date: Wed, 12 Feb 2014 16:58:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: fix off-by-one read retry mode counting
Message-ID: <20140213005845.GO18440@ld-irv-0074>
References: <1392252394-32512-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392252394-32512-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 12, 2014 at 04:46:34PM -0800, Brian Norris wrote:
> A flash may support N read retry voltage threshold modes, numbered 1
> through N (where mode 0 represents the initial state). However,
> nand_setup_read_retry() prematurely quits with an error when mode == N.

Scratch that; apparently N retry modes means we can use feature address
0 through N-1. So the off-by-one error is actually in
nand_do_read_ops(). I'll send a v2 shortly.

Brian
