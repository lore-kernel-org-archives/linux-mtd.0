Received: from mail-qe0-x22c.google.com ([2607:f8b0:400d:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYk52-0006av-Nu
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 22:05:37 +0000
Received: by mail-qe0-f44.google.com with SMTP id 6so5260902qeb.31
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 15:05:14 -0700 (PDT)
Date: Tue, 22 Oct 2013 15:05:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: bcm47xxpart: handle malloc failures
Message-ID: <20131022220511.GO23337@ld-irv-0074.broadcom.com>
References: <1381697629-31272-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381697629-31272-1-git-send-email-hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, zajec5@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 13, 2013 at 10:53:49PM +0200, Hauke Mehrtens wrote:
> Handle return NULL in malloc.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Pushed to l2-mtd.git. Thanks!

Brian
