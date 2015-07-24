Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIis4-0007lJ-Cx
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:43:05 +0000
Received: by pdjr16 with SMTP id r16so18178986pdj.3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 12:42:43 -0700 (PDT)
Date: Fri, 24 Jul 2015 12:42:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com,
 Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH v3 0/8] mtd: spi-nor: fsl-quadspi fix and added i.mx7d
 and i.mxul support
Message-ID: <20150724194240.GK8876@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 25, 2015 at 02:06:20AM +0800, Frank.Li@freescale.com wrote:
> From: Frank Li <Frank.Li@freescale.com>
> 
> rebase to l2-mtd/next
> 
> Resend whole serial patch

Han Xu (listed in MAINTAINERS) has graciously ack'd all of your patches.
In the future, please include those next to the Signed-off-by's when you
resend, unless you've had to make major changes.

I also notice that you failed to CC him. scripts/get_maintainer.pl
should have suggested you include him.

Brian
