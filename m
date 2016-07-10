Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM4WI-0006fB-16
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 02:30:58 +0000
Received: by mail-pa0-x22d.google.com with SMTP id hu1so11411836pad.3
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 19:30:37 -0700 (PDT)
Date: Sat, 9 Jul 2016 19:30:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Giorgio <giorgio.nicole@arcor.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: spi-nor: fix wrong "fully unlocked" test
Message-ID: <20160710023033.GA9684@localhost>
References: <1466789894-17535-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466789894-17535-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2016 at 10:38:14AM -0700, Brian Norris wrote:
> In stm_unlock(), the test to determine whether we've fully unlocked the
> flash checks for the lock length to be equal to the flash size. That is
> a typo/think-o -- the condition actually means the flash is completely
> *locked.* We should be using the inverse condition -- that the lock
> length is 0 (i.e., no protection).
> 
> The result of this bug is that we never actually turn off the Status
> Register Write Disable bit, even if the flash is completely unlocked.
> Now we can.
> 
> Fixes: 47b8edbf0d43 ("mtd: spi-nor: disallow further writes to SR if WP# is low")
> Reported-by: Giorgio <giorgio.nicole@arcor.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Applied to l2-mtd.git
