Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zafm-0000fA-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:39:18 +0100
Received: from gateway.mvista.com ([63.192.220.206] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Zafk-0000f4-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:39:16 +0100
Message-ID: <38DF728E.3F04C812@mvista.com>
Date: Mon, 27 Mar 2000 06:39:10 -0800
From: Scott Anderson <sanders@mvista.com>
MIME-Version: 1.0
To: Alexander Larsson <alex@cendio.se>
CC: mtd@infradead.org, Bjorn Wesen <bjorn.wesen@axis.com>,
        SeokKuon Kwon <kwonsk@mutech.co.kr>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD
References: <Pine.LNX.4.10.10003271032020.3368-100000@tammy.signum.se>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson wrote:
> While i haven't read the M-systems patent I think the Axis fs doesn't
> violate it, because it uses no translation array. It is a fully
> log-structured filesystem directly on the flash memory, and not a flash to
> block device translator.

Let me give a bit more background.  I have *not* looked at Axis' filesystem
so my "guesses" should not be viewed as authoritative.  Figuring out the
patent implications was something that I hadn't yet gotten around to yet.

Thanks to Alexander, I may not have to.  I'm under the impression that Axis'
file system implements wear-leveling, so if there isn't an FTL, then the
file system itself must rotate through free blocks to prevent a given sector
from being worn out.  Is this correct?  If not, would you mind educating me?

Thanks!

    Scott Anderson		
    scott_anderson@mvista.com	MontaVista Software Inc.
    (408)328-9214		490 Potrero Ave.
    http://www.mvista.com	Sunnyvale, CA  94086


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
