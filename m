Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143ZD0-0004JG-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 07:41:46 +0000
Received: from mrserver.wte.net ([206.98.206.71] helo=mrserver.cachier.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143ZCy-0004JA-00
	for mtd@infradead.org; Wed, 06 Dec 2000 07:41:44 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: Tripp Lilley <tlilley@perspex.com>
Subject: Re: nftl/DoC Mill. root fs question
Date: Wed, 6 Dec 2000 02:33:00 -0500
Content-Type: text/plain
Cc: mtd@infradead.org, linuxbios@lanl.gov
References: <Pine.LNX.3.96.1001206074454.1800T-100000@mail.perspex.com>
In-Reply-To: <Pine.LNX.3.96.1001206074454.1800T-100000@mail.perspex.com>
MIME-Version: 1.0
Message-Id: <00120602385104.02531@mrserver>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 06 Dec 2000, Tripp Lilley wrote:
> While researching this whole /etc/mtab vs. /proc/mounts issue, I came
> across the following post:
> 
> 	http://www.uwsg.iu.edu/hypermail/linux/kernel/0010.3/0243.html
> 
> which points out some of the "dangers" in using /proc/mounts, and
> specifically mentions the /dev/root issue. Not sure if it's 100%
> applicable, but it might be a good starting point :)
> 
> 
> On Mon, 4 Dec 2000 tyson@rwii.com wrote:
> 

Thanks,
I'm not yet sure how applicable this is because I'm using busybox mount that as
I have discovered recently doesn't keep mtab at all. It always looks into
/proc/mounts. Since proce/mounts reports /dev/root mounteds on / too I'm
confused, mounting root fs rw doesn't change anything but if I'm using /dev/ram0
as root /proc/mounts and mount both report it correctly. At this point I'm at
loss to explain this.

- Levi

-- 
Levi Khatskevitch
CTO
Cachier, Corp.
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
