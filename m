Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSmXG-0005Hq-OV
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 07:12:03 +0000
Subject: Re: Few problems in mtd system
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1261342795.4798.14.camel@maxim-laptop>
References: <290458.39840.qm@web37604.mail.mud.yahoo.com>
	<1261342795.4798.14.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Jan 2010 09:11:21 +0200
Message-Id: <1262848281.21915.42.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	arnd <arnd@arndb.de>, Alex Dubov <oakad@yahoo.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-12-20 at 22:59 +0200, Maxim Levitsky wrote:
> Folks, could you review my other questions about bugs in mtd core, and
> tell your opinion?

The MTD subsystem is nor very inhabitant these days, so you are mostly
on your own. I think you should just try fixing the issues you found,
test them, be careful, and send patches.

I believe MTD subsystem have many issues with "hotpluggable" devices
like your card, simply because no one probably worked seriously on this.
Most MTD devices are on-board chips, so few people care about
plugability.

> Yet another problem I found is inside add_mtd_blktrans_dev.
> This function takes mtd_table_mutex but never releases it.
> This sounds fishy, and deadlocks when it calls 'add_disk(gd);'
> This function (I think in case partitions are detected on device)
opens
> block device, and this takes that lock too
> (blktrans_open->get_mtd_device)> 

I vaguely remember there was a fix for this, may be in 2.6.33-rcX ?


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
