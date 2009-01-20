Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LP9Lw-0003m3-R1
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 05:40:47 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from eris.born2network.net ([74.59.45.108])
	by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KDR00H2E92JERH0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 00:39:55 -0500 (EST)
Message-id: <B0052D8E-CC54-4920-8654-F15C299F24EB@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: linux-mtd@lists.infradead.org
In-reply-to: <3A5BB4FC-6A13-4B8A-94B2-80FCF75E2BBF@b2n.ca>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
Date: Tue, 20 Jan 2009 00:40:43 -0500
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231397205.6608.119.camel@localhost.localdomain>
	<A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
	<1232355362.31319.16.camel@localhost.localdomain>
	<3A5BB4FC-6A13-4B8A-94B2-80FCF75E2BBF@b2n.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2009-01-19, at 22:44, David Bergeron wrote:
> - There is little time between the file becoming unreferenced and the
> filesystem becoming read-only

> Now clearly nothing is executed or left open for a long time in the
> nandsim + rsync based test, I guess the remount w/sync flag is helping
> get the edge case. Try to add the "--delay-updates" option to rsync to
> have unlinking rushed at the end. Maybe the slower arm hardware (cm-
> x270) I'm using is more prone to this.


I was mistaken here, timing doesn't seem to matter. I added plenty of  
syncs and sleeps.

rsync ...
sync; sync; sleep 4; sync;
exec /bin/sh -xc "lsof; sync; sleep 2; mount -o remount, ro /;
     sync; sleep 2; lsof; reboot -df;"

The deleted shell script is listed by the first lsof but not in the  
second.

right before rebooting fs usage boils down to this:

sh          1 root  cwd       DIR  253,1    1520    1 /
sh          1 root  rtd       DIR  253,1    1520    1 /
sh          1 root  txt       REG  253,1   88220 1113 /bin/dash
sh          1 root  mem       REG  253,1  121636 1685 /lib/ld-2.7.so
sh          1 root  mem       REG  253,1 1168924 1693 /lib/libc-2.7.so
sh          1 root    0u      CHR    5,1           96 /dev/console

It just seems like as soon as rsync changes an opened file, I loose  
the filesystem.

-david
