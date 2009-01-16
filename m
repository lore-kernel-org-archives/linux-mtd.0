Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNwAG-0008KK-MW
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 21:23:43 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from [IPv6:::1] ([74.59.45.108]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KDL004AX21QK7C0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 16:22:39 -0500 (EST)
Message-id: <0664C0A7-7654-4A20-A43C-ED4930185274@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: dedekind@infradead.org
In-reply-to: <1231949854.5973.82.camel@localhost.localdomain>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
Date: Fri, 16 Jan 2009 16:23:26 -0500
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231949854.5973.82.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

sorry my primary MX was acting up badly, I just got a bunch of spooled  
mail...

On 2009-01-14, at 11:17, Artem Bityutskiy wrote:
> 1. Try to remove the "sync" parameter of "mount -o remount,rw,sync".
> BTW, -o sync makes your rsync work much slower than if you had async
> mount and call sync after rsync is done.

Ah! Continuing on my nandsim testbed, it appears that re-mounting with  
sync is indeed responsible, so:
ro -> rw,sync = bad (breaks in ~20 rounds)
ro -> rw = good (survived 630 rounds before I moved on)
rw,sync = good (survived 370 rounds and counting...)

I can live with ro -> rw; `rsync & sync`; rw -> ro; reboot

I intend to use UBIFS on a solar+battery powered device, so I really  
want to opt-out of write-back caching altogether, write performance is  
less important to me than reliability. Since a rw,sync initial mount  
seems to work fine, I will be using that on my writable data volume.

> 2. Try to avoid re-mounting the fs into RO mode, but just call "sync".

AFAIK, most init scripts will remount the rootfs read-only at  
shutdown, it's pretty much due process since if it's not remounted  
read-only, the rootfs would remain dirty (I don't think '/' is ever  
unmounted). Anyway, it doesn't look like the rw -> ro direction is  
causing any problems.

> 3. When you reboot, I guess your boot scripts try to mount the FS in  
> R/O
> mode first. Try to tweak them and mount the FS read-write for the  
> first
> time.

It's the kernel that mounts read-only first. I do want my rootfs to be  
read-only during normal operations, and I have no kernel cmdline  
arguments control from the userland.

On 2009-01-14, at 11:23, Artem Bityutskiy wrote:
> Hmm, could you please check if -f is essential here. I mean, can you
> still reproduce the bug if you reboot cleanly, with unmount. When you
> reboot uncleanly, UBIFS starts so called "recovery" process, so I want
> to check whether recovery may be guilty.

I have no recovery at all in any of my test cases. Because I remount  
read-only before I reboot -f, the filesystem is clean.

Many thanks for your help on this.

Regards,
-david
