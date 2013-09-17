Received: from mail-qe0-x229.google.com ([2607:f8b0:400d:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLky2-0007bJ-Hi
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 02:24:43 +0000
Received: by mail-qe0-f41.google.com with SMTP id ff1so3417322qeb.28
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 19:24:21 -0700 (PDT)
Date: Mon, 16 Sep 2013 19:24:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] mtd: onenand: omap: remove two unused functions
Message-ID: <20130917022417.GN4550@ld-irv-0074.broadcom.com>
References: <1375899409.7303.61.camel@x61.thuisdomein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375899409.7303.61.camel@x61.thuisdomein>
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 07, 2013 at 08:16:49PM +0200, Paul Bolle wrote:
> Nothing calls omap2_onenand_rephase(). And __adjust_timing() is only
> called by omap2_onenand_rephase(). Remove these two unused functions.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Completely untested.

Compile-tested successfully here. And it gets rid of a few sparse warnings:

  drivers/mtd/onenand/omap2.c:592:5: warning: no previous prototype for 'omap2_onenand_rephase' [-Wmissing-prototypes]
  drivers/mtd/onenand/omap2.c:592:5: warning: symbol 'omap2_onenand_rephase' was not declared. Should it be static? [sparse]

Applied to l2-mtd.git. Thanks!

Brian
