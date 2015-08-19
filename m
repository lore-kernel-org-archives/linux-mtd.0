Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrEO-0008Im-Sv
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:27:53 +0000
Received: by pdbmi9 with SMTP id mi9so33106847pdb.3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:27:31 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:27:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/4] mtd: denali: hide core part from user in Kconfig
Message-ID: <20150819002727.GO60523@google.com>
References: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 06, 2015 at 04:04:21PM +0300, Andy Shevchenko wrote:
> There is no need to user to see the core part of the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Pushed all 4 to l2-mtd.git. Thanks.
