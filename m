Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Q1s-0005Ko-Mr
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:42:13 +0000
Received: by mail-pa0-f42.google.com with SMTP id lf10so11019775pab.15
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:41:51 -0700 (PDT)
Date: Mon, 21 Jul 2014 19:41:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 0/2] mtd: nand: add basic SDR NAND timings infrastructure
Message-ID: <20140722024148.GA7537@ld-irv-0074>
References: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 11, 2014 at 09:49:40AM +0200, Boris BREZILLON wrote:
> These two patches add SDR NAND timings definition and ONFI timing mode to
> NAND timings converter.
> 
> This infrastructure will be used by NAND controller drivers to configure
> their signal timings according to NAND chip capabilities.

Pushed both to l2-mtd.git, with the modification I noted in patch 2.
Thanks!

Brian
