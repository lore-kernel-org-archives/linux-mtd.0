Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9Qi0-0003OM-3H
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 11:40:24 -0500
Date: Thu, 10 Mar 2005 17:40:24 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310164024.GD4910@synertronixx3>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310152212.GB4910@synertronixx3>
	<Pine.LNX.4.58.0503101554220.5450@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0503101554220.5450@phoenix.infradead.org>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 15:54 +0000 schrieb Artem B. Bityuckiy:

> OK, why does this mean JFFS2 is guilty of this? Why don't you suspect your 
> drivers? Why don't you suspect that you flashed your (say, correct) image 
> incorrectly?

The image is created in different ways, copied, dd'ed, mkfs.jffs2. Same
error picture.
All other constellations in software on this Hardware are working
perfect.
Kernel XIP out of this Flash device with this settings runs perfect.

No matter if partitions are cat'ed or dd'ed or files copied and such:
identical md5sums read back. 

I tested cramfs as rootfilesystem which works ok also.

> Just configure your kernel properly: switch on the "Test driver using RAM" 
> (MTD_MTDRAM) option in your kernel configuration. Type "modprobe mtdram" 
> if you have configured it as the kernel module.
> 
> If you do this your JFFS2 will work over emulated 4MiB in-RAM flash and 
> this will help you to exclude driver problems.

No clue until now. On Host-PC or on the embedded system?

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
