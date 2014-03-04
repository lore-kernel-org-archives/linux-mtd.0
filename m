Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKov5-0003RV-Ca
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 12:58:04 +0000
Message-ID: <1393937858.6302.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: block: do not use term "attach"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 04 Mar 2014 14:57:38 +0200
In-Reply-To: <1393927373-1472-1-git-send-email-dedekind1@gmail.com>
References: <1393927373-1472-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-03-04 at 12:02 +0200, Artem Bityutskiy wrote:
> + * This feature is compiled in the UBI core, and adds a 'block' parameter
> + * to allow early creation of block devices on top of UBI volumes. Runtime
> + * block creation/removal for UBI volumes is provided through two UBI ioctls:
> + * UBI_IOCVOLATTBLK and UBI_IOCVOLDETBLK.
>   */

I think the ioctl names should also be consistent.
s/AT/CR/, s/DET/RM/, may be?

-- 
Best Regards,
Artem Bityutskiy
