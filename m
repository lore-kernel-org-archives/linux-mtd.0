Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhL5b-00076w-Dq
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 17:22:47 +0000
Received: by pacex6 with SMTP id ex6so46513964pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 10:22:27 -0700 (PDT)
Date: Wed, 30 Sep 2015 10:22:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Alexey Klimov <klimov.linux@gmail.com>
Subject: Re: [PATCH] mtd: nand: vf610_nfc: include missing pincrl/consumer.h
Message-ID: <20150930172224.GE143959@google.com>
References: <1443632066-69967-1-git-send-email-computersforpeace@gmail.com>
 <900ceb41b4f9e4319d42e035cd1dd7ff@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900ceb41b4f9e4319d42e035cd1dd7ff@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 30, 2015 at 10:02:03AM -0700, Stefan Agner wrote:
> On 2015-09-30 09:54, Brian Norris wrote:
> > This must have been implicitly included on the builds I tested. Reported
> > by numerous test bots:
> 
> Same for me. Thanks for the fix.
> 
> Acked-by: Stefan Agner <stefan@agner.ch>

Applied to l2-mtd.git
