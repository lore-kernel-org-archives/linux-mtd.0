Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQvoQ-0003Sg-CW
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:04:42 +0000
Message-ID: <1410170635.10764.123.camel@sauron.fi.intel.com>
Subject: Re: UBI, no sub-pages support
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Angelo Dureghello <angelo70@gmail.com>
Date: Mon, 08 Sep 2014 13:03:55 +0300
In-Reply-To: <53F334D9.5030902@gmail.com>
References: <53F334D9.5030902@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-08-19 at 13:28 +0200, Angelo Dureghello wrote:
> Another question is: is there a UBI performance loss using pages as
> minimal I/O (no subpages) or i can consider it insignificant ?

I can only comment on this question - you should not lose performance,
but you'll have more NAND flash space consumed by UBI for its own
purposes, comparing to what you'd have if you had sub-pages.

IOW, sub-pages are mostly lessening the UBI space overhead.

The MTD web page has a section about the space overhead with some more
information.

-- 
Best Regards,
Artem Bityutskiy
