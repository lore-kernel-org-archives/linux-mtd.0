Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBgel-0007zw-Qb
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 05:05:52 +0000
Received: by ewy3 with SMTP id 3so1437750ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Apr 2011 22:05:50 -0700 (PDT)
Subject: Re: [PATCH] mtd: mtd_blkdevs: fix error path in blktrans_open
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
In-Reply-To: <1303103096-4958-1-git-send-email-dedekind1@gmail.com>
References: <1303103096-4958-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 08:02:31 +0300
Message-ID: <1303102951.2815.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Turner <admin@islandsoftware.co.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 08:04 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> The 'blktrans_open()' does not handle possible '__get_mtd_device()' failures
> because it does not check the error code. Moreover, the 'dev->tr->open()'
> failures are not handled correctly because in this case the function just
> goes ahead and gets the mtd device but returns an error. Instead, it should
> _not_ try to get the mtd device, then it should put back the module and kref.
> 
> This patch fixes the issue. Note, I only compile-test it but did not test.
> This patch was inspired bug report about a similar issue in 2.6.34 kernels
> sent by Mike Turner <admin@islandsoftware.co.uk> to the MTD mailing list:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-April/034980.html
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Fixed typos in the commit message:

This patch fixes the issue. Note, I only compile-tested it. This patch was
inspired by a bug report about a similar issue in 2.6.34 kernels
sent by Mike Turner <admin@islandsoftware.co.uk> to the MTD mailing list:

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
