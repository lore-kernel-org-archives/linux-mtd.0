Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bv9Pc-0004Iq-6y
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2004 02:50:09 -0400
To: Gopi Palaniappan <gpalani1@yahoo.com>
References: <20040811030608.90864.qmail@web61202.mail.yahoo.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 12 Aug 2004 00:50:05 -0600
In-Reply-To: <20040811030608.90864.qmail@web61202.mail.yahoo.com>
Message-ID: <m3d61w6eaq.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD partition offset info via /proc/mtd & ioctl(MEMGETINFO)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gopi Palaniappan <gpalani1@yahoo.com> writes:

> I didn't see any comments about my previous posting...
> I was wondering if I needed to provide additional
> info?

I had a similar desire. But I wanted the physical starting address of the
mtd devices.

Modify mtd_info_user especially to stick a field in the middle a no-go
that breaks the user space ABI.  And will seriously annoy people.

In talking with Dave we came up with two possible solutions.  Put
the physical starting address into the name so it is displayed in /proc/mtd.
And longer term we can look at using sysfs to export that information.

I have just modified the map drivers amd76xrom and ichxrom to add that
information to the name field of /proc/mtd.

That should be a simple and expedient way to get things moving.
I am puzzled though why you would need partition offset information,
I thought the purpose of partitions was to remove the need for worrying about
offsets into the flash chip.

Eric
