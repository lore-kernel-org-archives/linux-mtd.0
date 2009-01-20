Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LP7Xl-0001tj-D6
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 03:44:52 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from eris.born2network.net ([74.59.45.108])
	by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KDR008RR3QO2OE0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 22:44:48 -0500 (EST)
Message-id: <3A5BB4FC-6A13-4B8A-94B2-80FCF75E2BBF@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: dedekind@infradead.org
In-reply-to: <1232355362.31319.16.camel@localhost.localdomain>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
Date: Mon, 19 Jan 2009 22:44:48 -0500
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231397205.6608.119.camel@localhost.localdomain>
	<A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
	<1232355362.31319.16.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2009-01-19, at 3:56, Artem Bityutskiy wrote:
> Just tried to reproduce this on my x86_64 host without success.


Well, today I had a bit of a breakthrough.

Put the nandsim + rsync loop on the side for now, and let's go back to  
a slightly evolved version of my original scenario.

boot kernel ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs ro init=/root/ 
updater.sh

/root/updater.sh:
#!/bin/sh -x

mount -t proc none /proc
ifconfig eth0 ...
mount -o remount,rw /
rsync -aHx --delete systemA /
rsync -aHx --delete systemB /
sync
exec /bin/sh -c "mount -o remount,ro /; reboot -df;"
-EOF-

no more 'sync' flag, but still an orphan LEB 0:0 on first run, every  
time, 100% reproducibility. (reboot -d just means don't update /var/ 
log/wtmp)

So to break it, it's necessary to re-mount rw,SYNC in the nandsim  
context, but not in the rootfs update scenario (a stripped down  
version of a procedure I've used on jffs2 for two years now)
I've always been puzzled by the lower reproducibility rates in the  
nandsim context, because I could replace nandsim with the real flash  
and run the same steps (exactly the same hardware, kernel, userland,  
rsync, sync data, nand flash, volume layout and what not) The only  
difference? one scenario is a live rootfs, and the other is not...

Which finally lead me to the real cause:
It turns out that my test script /root/updater.sh differed between  
systemA and systemB, so it was being replaced by rsync *while being  
opened & running*.

Indeed, once the script was identical on both rsync targets, UBIFS no  
longer broke. (I believe at the time of my first report, my rsync  
binary itself was different..)

So here's my sysadmin grade speculation (I'm no filesystem guru):
- A script is executed & open
- It is soon deleted and replaced by a new one but cannot be released  
just yet
- There is little time between the file becoming unreferenced and the  
filesystem becoming read-only
- [wild speculation] Something goes wrong, the LEB it used had to be  
orphaned but it's too late, some bad pointer gives LEB 0 the axe

Now clearly nothing is executed or left open for a long time in the  
nandsim + rsync based test, I guess the remount w/sync flag is helping  
get the edge case. Try to add the "--delay-updates" option to rsync to  
have unlinking rushed at the end. Maybe the slower arm hardware (cm- 
x270) I'm using is more prone to this.

I'll try to come up with a sure fire & simple way to replicate this on  
nandsim without the rsync hassle.

will keep you posted

Best regards,
-david
