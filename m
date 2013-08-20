Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBvTh-0002f5-Cr
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 23:36:46 +0000
Received: by mail-pa0-f45.google.com with SMTP id bg4so80811pad.18
 for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2013 16:36:21 -0700 (PDT)
Date: Tue, 20 Aug 2013 16:36:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2] m25p80 / fast read
Message-ID: <20130820233613.GA28382@ld-irv-0074.broadcom.com>
References: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 20, 2013 at 09:54:38AM +0200, Sascha Hauer wrote:
> 
> Changes since v1:
> 
> - rebase on git.infradead.org/l2-mtd.git
> - improve description for patch 2/3

Thanks for these.

> Sascha
> 
> ----------------------------------------------------------------
> Markus Niebel (1):
>       mtd: m25p80: add support for mr25h10
> 
> Sascha Hauer (2):
>       mtd: m25p80: Pass flags through CAT25_INFO macro
>       mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe to enable
> 
>  drivers/mtd/devices/m25p80.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Pushed to l2-mtd.git.

Brian
