Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197f90-0002yN-BV
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 18:31:54 +0100
Date: Mon, 21 Apr 2003 19:32:02 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian T." <btuch@usa.net>
Message-ID: <20030421173202.GA1027@wohnheim.fh-wedel.de>
References: <015701c30823$c19438e0$150a0ac0@jbmsoft.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <015701c30823$c19438e0$150a0ac0@jbmsoft.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mount a jffs2 image
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 April 2003 11:33:35 -0500, Brian T. wrote:
> 
> I was wondering if there is a way to mount a jffs2 image on a system which
> has no mtd devices, such as the system I use (Redhat 7.1) to build an
> embedded distro.  I am using a 2.4.20 mtd patched kernel, but I get errors
> when trying to mount it on mtd devices (since they are not there).  "mount"
> tells me to try using "-o /dev/loop0" but that locks the system up.  Thanks!

Loopback creates a block device, not an mtd device. So this behaviour
is kind of expected. The system shouldn't lock up, that part should
get fixed. I'll see if I can reproduce it here.

A loopback variant for mtd does not exist, you have to write it
yourself if you want it.

You can still use mtdram, mtdblock or slram to create an mtd device an
your host, copy the image to that device and use it from there.

To the original question, either therotical mtdloopback or mtdram and
friends give you an mtd device. No mtd device, no cookies.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
