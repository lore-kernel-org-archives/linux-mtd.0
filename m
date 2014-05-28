Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpYF5-0004TJ-B9
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 07:25:43 +0000
Received: by mail-pa0-f46.google.com with SMTP id kq14so10571680pab.33
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 00:25:22 -0700 (PDT)
Date: Wed, 28 May 2014 00:25:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [PATCH 09/27] mtd: nand: pxa3xx: show device structure in sysfs
Message-ID: <20140528072513.GA4285@norris-Latitude-E6410>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-10-git-send-email-holler@ahsoftware.de>
 <1401160341.192042842@f271.i.mail.ru>
 <53842A53.1060404@ahsoftware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53842A53.1060404@ahsoftware.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 27, 2014 at 08:01:55AM +0200, Alexander Holler wrote:
> Am 27.05.2014 05:12, schrieb Alexander Shiyan:
> >Should we add "driver.owner = THIS_MODULE" field for struct platform_driver in this case?
> 
> Yes. I assumed all drivers/modules already had an owner. I will
> check them all and will send a v2 for those which don't have one. I
> wonder what this field is used for if it works without. ;)

Looks like the mtd->owner essentially filters down to a try_module_get()
(called in the get_mtd_device() API) which ensures that MTD users (e.g.,
mtdblock, UBI, etc.) hold a refcount on the driver module. If the owner
is not set properly by a driver, then try_module_get() just does a
silent no-op, so the user is none the wiser... until they try to rmmod
their MTD driver while it's being used by UBI/UBIFS!

Regards,
Brian
