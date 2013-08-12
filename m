Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8uMk-0004jh-Eg
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 15:49:07 +0000
Date: Mon, 12 Aug 2013 12:48:44 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 14/15] mtd: nand: pxa3xx: Increase data buffer size
Message-ID: <20130812154843.GB5460@localhost>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376163305-5591-15-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130811033045.GA16906@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130811033045.GA16906@norris.computersforpeace.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 10, 2013 at 08:30:45PM -0700, Brian Norris wrote:
> On Sat, Aug 10, 2013 at 04:35:04PM -0300, Ezequiel Garcia wrote:
> > Devices with 4 KiB pages (plus OOB data) can be detected, so we increase
> > the data buffer size. A better solution would be to allocate a buffer
> > depending on the detected page size, but that's not possible given
> > we need the buffer prior to the device detection.
> 
> Another possibility (for future work, maybe) is that you allocate a
> smaller buffer that fits what you need for "device detection" (I presume
> it's just for ONFI parameter page commands?), then reallocate the buffer
> between nand_scan_ident() and nand_scan_tail() according to page size.
> There are some other similar buffers throughout NAND that use a fixed
> NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE.
> 

That sounds better. I spent a considerable amount of time trying to find
a better solution.

I'll drop this one from the next version and I'll re-work following your
idea.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
