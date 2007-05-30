Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HtL3p-0004DM-KF
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 06:05:47 -0400
Received: from toronto.xi-lite.net (localhost.localdomain [127.0.0.1])
	by toronto.xi-lite.net (Postfix) with ESMTP id 92A3E658106
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 May 2007 10:05:38 +0000 (GMT)
Received: from mail.xi-lite.com (unknown [193.34.35.248])
	by toronto.xi-lite.net (Postfix) with ESMTP id 7F535658106
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 May 2007 10:05:38 +0000 (GMT)
Message-ID: <465D4B8A.3050701@parrot.com>
Date: Wed, 30 May 2007 12:01:46 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 memory usage and OOM killer
References: <465A89D6.2050708@parrot.com>
In-Reply-To: <465A89D6.2050708@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET a écrit :
> Hi,
> 
> On a system with 16 MB of ram  (6700KB free at the time of mounting), I
> have a 50 MB jffs2 partition with a big file on it (30 MB). This file
> was uploaded with xmodem, and a dump of the partition show that the
> inode node are very small (128 o).
> 
> 
> After the file was uploaded on the jffs2 partition and a reboot :
> 
> if I do a rw mount, the partition is mounted, but jffs2 memory usage
> increase until it eats all the memory and the system die (see jffs2_oom1
> attachement).
> 
> if I do a ro mount, the partition is mounted (use 2MB of RAM), but if I
> list directory, jffs2 start to eat all memory until OOM killer is called
> (see jffs2_oom attachement).
> 
> 
> I know that jffs2 eats some memory, but I am impressed that it can eat
> so much memory.
> 
Using git jffs2, allow to mount the fs without OOM. Now jfss2 eats 3MB.


Matthieu
