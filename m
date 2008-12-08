Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9gCb-0003cV-MV
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 13:31:10 +0000
Date: Mon, 8 Dec 2008 13:31:06 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Re: UBI/DVB ioctl conflict?
Message-ID: <20081208133106.GA16354@shareable.org>
References: <20081207095811.13b51cca@zod.rchland.ibm.com>
	<1228717226.13686.89.camel@sauron>
	<200812081041.14178.laurentp@cse-semaphore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812081041.14178.laurentp@cse-semaphore.com>
Cc: v4l-dvb-maintainer@linuxtv.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, arnd@arndb.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Laurent Pinchart wrote:
> Correct me if I'm wrong, but doesn't this only matters for devices
> that would implement both the UBI and DVB API on the same inode ?
> That would be quite unlikely.

Overlapping ioctls prevent strace(1) from showing ioctls properly.

For example, here's something you see often in strace of programs
using stdio, when it calls isatty():

ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbfaaa864) = -1 ENOTTY (Inappropriate ioctl for device)

Or if it is a terminal:

ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {c_iflags=0x6d02, c_oflags=0x5, c_cflags=0x4bf, c_lflags=0x8a3b, c_line=0, c_cc="\x03\x1c\x7f\x15\x04\x00\x01\xff\x11\x13\x1a\xff\x12\x0f\x17\x16\xff\x00\x00"}) = 0

-- Jamie
