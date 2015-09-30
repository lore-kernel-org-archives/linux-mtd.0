Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhNgU-0004pi-TO
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 20:09:03 +0000
Received: by pacex6 with SMTP id ex6so50083666pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 13:08:42 -0700 (PDT)
Date: Wed, 30 Sep 2015 13:08:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH 1/3] mtd: brcmnand: refactor bcm63138 SoC layering
Message-ID: <20150930200839.GI143959@google.com>
References: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 05:05:04PM -0700, Brian Norris wrote:
> Removes an unnecessary allocation and saves a little bit of pointer
> chasing.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed these 3 to l2-mtd.git
