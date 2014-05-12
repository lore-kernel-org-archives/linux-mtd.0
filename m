Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjwgY-0004A8-Fp
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 20:18:54 +0000
Received: by mail-ie0-f174.google.com with SMTP id at1so4160581iec.33
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 13:18:32 -0700 (PDT)
Date: Mon, 12 May 2014 13:18:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: elm: compile suspend/resume only with PM_SLEEP
Message-ID: <20140512201828.GP28907@ld-irv-0074>
References: <1397720349-5825-1-git-send-email-wsa@the-dreams.de>
 <20980858CB6D3A4BAE95CA194937D5E73EAC497C@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC497C@DBDE04.ent.ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Wolfram Sang <wsa@the-dreams.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2014 at 06:00:58AM +0000, Pekon Gupta wrote:
> >From: Wolfram Sang <wsa@sang-engineering.com>
> >
> >Fixes:
> >drivers/mtd/devices/elm.c:480:12: warning: 'elm_suspend' defined but not used [-Wunused-function]
> >drivers/mtd/devices/elm.c:488:12: warning: 'elm_resume' defined but not used [-Wunused-function]
> >
> >Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>
> >
> Acked-by: Pekon Gupta <pekon@ti.com>

Pushed to l2-mtd.git. Thanks!

> I think it's safe to mark it for stable also
> CC: <stable@vger.kernel.org> # 3.12.x+

No, build warnings are clearly clearly not candidates for -stable.

Brian
