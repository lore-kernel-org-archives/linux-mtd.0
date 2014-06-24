Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzIq2-0000X5-IC
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 05:00:10 +0000
Message-ID: <1403585976.7903.70.camel@sauron.fi.intel.com>
Subject: Re: UBI: fix rb_tree node comparison in add_map commit buggy?
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Richard Weinberger <richard@nod.at>
Date: Tue, 24 Jun 2014 07:59:36 +0300
In-Reply-To: <53A87AD5.8050305@nod.at>
References: <53A7EF04.7040805@denx.de> <53A809A3.30703@denx.de>
 <53A82077.6090109@nod.at> <53A82609.9090408@denx.de>
 <53A87AD5.8050305@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: hs@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-06-23 at 21:07 +0200, Richard Weinberger wrote:
> I think it would be better to "fix" the whole logic such that low volume ids go into
> the left rb node instead of the right.
> Just to avoid further confusion.
> Artem, do you know why UBI does it the other way around for volume ids?

I do not remember. Probably no particular reason.

I'd suggest to do a quick fix first and submit to Linus for 3.16, and
then people can do whatever logic streamlining for 3.17, makes sense?

-- 
Best Regards,
Artem Bityutskiy
