Received: from astro.phpwebhosting.com ([66.33.60.221])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16QygG-0007Cv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 22:37:16 +0000
Message-Id: <5.1.0.14.1.20020116172516.00ac8c68@mail.wavix.com>
Date: Wed, 16 Jan 2002 17:47:58 -0500
To: "linux MTD mailing list" <linux-mtd@lists.infradead.org>
From: Mark Sienkiewicz <ms@wavix.com>
Subject: Re: open question on flash speed/app blocking
In-Reply-To: <000e01c19ec6$b2cd5980$0100007f@localdomain.wni.com.wireles
 snetworksinc.com>
References: <02011512182209.16722@kilauea.iders.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 12:47 PM 1/16/2002 -0700, Herman Oosthuysen wrote:
>Hmm, the problem is not writing to flash per se, but rather garbage
>collection, which requires the erase of dirty Flash sectors.
...
 >If your system has to write to flash every few seconds, then consider using
>a file system that has a large write cache, to enable you to survive the
>periods when the system is busy erasing a sector.

Or you can use a system that starts erasing sectors well in advance of
needing them, so you never need to wait for the erase operation.

For example, suppose the only thing you need to store in the flash is a
stream of records where you only need the most recent XXX bytes.  You could
make a circular buffer in the flash, and start an erase operation any time
there are not at least N already-erased sectors ahead of where you are
writing.  If your data rate has a known upper bound, you can compute N from
the maximum erase time on the spec sheet for your flash chip.

That doesn't exactly make a filesystem, but it is very easy to do from user
mode.  I have a similar application:  I save a big chunk of data at shutdown
time.  At boot time, I find the newest record and restore it, but I also
find the _oldest_ record and start erasing it.  At shutdown time, I don't
need to erase anything -- it is already erased.

I'm not that familiar with jffs2, but if I remember correctly, it has a
filesystem parameter for how many empty flash sectors it must maintain.
Maybe if you set it higher than the minimum needed to make garbage
collection work, it will erase things early enough to avoid blocking anybody.
If you want to use jffs2, it would be worth looking into.

Mark S.
