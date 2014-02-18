Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFfWF-0001GC-4e
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 07:55:08 +0000
Message-ID: <1392710080.21319.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 2/3] ubi-utils: Add ubiblkvol tool
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 18 Feb 2014 09:54:40 +0200
In-Reply-To: <1392581041-8099-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-3-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-02-16 at 17:04 -0300, Ezequiel Garcia wrote:
> With the addition of block device access to UBI volumes, we now
> add a simple userspace tool to access the new ioctls.

I noticed you call this driver "block device access to UBI volumes" or
even "block device interface of UBI volumes". I am not sure we picked
the best terminology. Could we please discuss this a bit. Here are my
thoughts.

Essentially, what you have implemented is a R/O block driver. This
driver works on top of UBI volumes. It uses simple "1-to-1" mapping,
which is basically its media format.

Someone, in theory, may implement a more sophisticated block driver
which would be an R/W driver with good random I/O performance. This
driver would not use 1-to-1 mapping. It would have internal block
mapping tables, and garbage-collector.

There may be multiple drivers like this implemented.

These multiple drivers would have the same user interface - the block
API. But very different implementation, and different incompatible media
format.

What would be our terminology then, I wonder. What do yo think:

* If your driver is ubiblock, how would those be called, any idea?
* How would we distinguish between them when doing 'modprobe' ?
* How would we specify which one to use when using "ubiblkvol" ?

BTW, I am not sure "ubiblkvol" is a good name, may be you have other
ideas? Absent better ideas, may be calling it 'ubiblock' would be
better, just like the name of the driver? This would at least use less
of the "namespace".

Thoughts?

-- 
Best Regards,
Artem Bityutskiy
