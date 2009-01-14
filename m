Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN8R4-0000mj-Ui
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 16:17:45 +0000
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Bergeron <mho.linux-mtd@b2n.ca>
In-Reply-To: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Jan 2009 18:17:34 +0200
Message-Id: <1231949854.5973.82.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just upgraded few of my tests to do re-mount testing, and
remounting works fine - I couldn't find any problem.

On Wed, 2009-01-07 at 23:13 -0500, David Bergeron wrote:
> I've cooked up a minimalist test trying to eliminate possible  
> interference.
> The following steps will trigger the corruption almost every time. No  
> errors
> or warnings are produced during this procedure, every step behaves as  
> expected:
> 
> boot kernel ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs ro init=/bin/ 
> bash
> 
> # mount -t proc none /proc
> # ifconfig ...
> # mount -o remount,rw,sync /
> # rsync -aHxvi --delete ... /
> # mount -o remount,ro /
> # reboot -d -f

I wonder what does -d option mean. Could you please try to play with
things like:

1. Try to remove the "sync" parameter of "mount -o remount,rw,sync".
BTW, -o sync makes your rsync work much slower than if you had async
mount and call sync after rsync is done.
2. Try to avoid re-mounting the fs into RO mode, but just call "sync".
3. When you reboot, I guess your boot scripts try to mount the FS in R/O
mode first. Try to tweak them and mount the FS read-write for the first
time.

Please, see what happens, may be this will give us some clue.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
