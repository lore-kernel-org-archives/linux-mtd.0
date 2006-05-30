Received: from [62.79.30.252] (helo=dmz4.rosetechnology.dk)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl4xQ-0006Bd-I9
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 10:12:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by dmz4.rosetechnology.dk (Postfix) with ESMTP id 945019BE30
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 May 2006 16:17:03 +0200 (CEST)
Received: from dmz4.rosetechnology.dk ([127.0.0.1])
	by localhost (dmz4.rosetechnology.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 07972-10 for <linux-mtd@lists.infradead.org>;
	Tue, 30 May 2006 16:16:53 +0200 (CEST)
Received: from [192.168.36.139] (unknown [192.168.1.101])
	by dmz4.rosetechnology.dk (Postfix) with ESMTP id 67D469BE00
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 May 2006 16:16:53 +0200 (CEST)
Message-ID: <447C5226.5030800@rosetechnology.dk>
Date: Tue, 30 May 2006 16:09:42 +0200
From: Henrik Bork Steffensen <hbs@rosetechnology.dk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Unlocked flash is re-locked by unknow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
We have this custom arm based board were we ran Linux 2.4 for 3 years,
now we are moving to 2.6 and has problems with our NOR Flash.

After boot the flash is locked which is normal for this chip.
Then we run flash_unlock and mounts the jffs2 fs.
At this point we can create /remove files.
But after a some time (or some actions) we get write errors.
If we re-run flash_unlock, everything works fine again for
some time (or some actions), then it locks again....

We have tried to figure out which action lock's the device without
success...

We have tried kernel 2.6.16.5 and 2.6.17-rc4 with and without
mtd patch (stable and git).

The flash is: AT49BV320 (4MByte, NOR, almost-CFI-compliant)
It is auto discovered by cfi.
The chip claims to be original Intel flash, but it has another
mapping of its capabilities bits (which is soo nice). We have made
an ugly fix to this issue by changing the bitmap which is read
from the device. Removing this code has no effect on the described
problem, just thought you should now :-)

This is not a HW problem since booting 2.4 makes it work again.

Please provide any hint, a simple link to will be fine.

Thanks in advance.

-- 
med venlig hilsen / best regards / Mit freundlichen Grüßen

Henrik Bork Steffensen

RoseTechnology A/S
http://www.rosetechnology.dk
