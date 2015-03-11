Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVqL2-00031P-Bp
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 23:46:56 +0000
Received: by paceu11 with SMTP id eu11so15439966pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2015 16:46:35 -0700 (PDT)
Date: Wed, 11 Mar 2015 16:46:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/7] mtd: various fixes caught by Coverity
Message-ID: <20150311234630.GF32500@ld-irv-0074>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 28, 2015 at 02:02:23AM -0800, Brian Norris wrote:
> Several unrelated MTD fixes inspired by Coverity Scan results. I couldn't test
> all of them, but they're all pretty obvious.
> 
> Brian Norris (7):
>   mtd: docg3: drop dead code
>   mtd: onenand: drop dead code
>   mtd: tests: fix more potential integer overflows
>   mtd: nand: fixup bounds checks for nand_{lock,unlock}()
>   mtd: nand: denali: drop dead code
>   mtd: blkdevs: remove dead code
>   mtd: nand: fully initialize mtd_oob_ops

Pushed to l2-mtd.git, with v2 of patch 1.

Brian
