Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Woyvw-00012a-VS
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 17:43:37 +0000
Received: by mail-pb0-f50.google.com with SMTP id ma3so7952379pbc.23
 for <linux-mtd@lists.infradead.org>; Mon, 26 May 2014 10:43:16 -0700 (PDT)
Date: Mon, 26 May 2014 10:43:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: lpddr: fix Kconfig dependency, for I/O accessors
Message-ID: <20140526174312.GD5241@norris-Latitude-E6410>
References: <1400704153-26626-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400704153-26626-1-git-send-email-computersforpeace@gmail.com>
Cc: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 21, 2014 at 01:29:13PM -0700, Brian Norris wrote:
> Not all architectures implement a writel_relaxed() accessor. Hopefully
> this will change eventually, but for now, this means lpddr2_nvm.c can't
> compile on some architectures.
> 
> Let's add an ARM dependency for now, and leave a comment so maybe we can
> change this in the future.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>

Pushed to l2-mtd.git, to stop people from reporting build failures on
x86.

Brian
