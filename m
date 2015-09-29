Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh1U0-0008Iq-Ed
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 20:26:40 +0000
Received: by pacex6 with SMTP id ex6so15750060pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 13:26:20 -0700 (PDT)
Date: Tue, 29 Sep 2015 13:26:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Furquan Shaikh <furquan@google.com>,
 Stephen Barber <smbarber@chromium.org>, Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH] mtd: spi-nor: add support for w25q128fw
Message-ID: <20150929202617.GL31505@google.com>
References: <1442614094-38680-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442614094-38680-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 03:08:14PM -0700, Brian Norris wrote:
> Tested only with single I/O, but the datasheet says it supports dual and
> quad.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git
