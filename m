Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D7d2Z-0001aV-LG
	for linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 12:26:12 -0500
Received: from [80.229.56.123] (helo=central.bult.co.uk)
	by ptb-relay03.plus.net with esmtp (Exim) id 1D7d2X-0005Pv-03
	for linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 17:26:09 +0000
Received: from squizzey.bult.co.uk (squizzey [10.1.0.4])
	by central.bult.co.uk (Postfix) with ESMTP id 502FF2464C
	for <linux-mtd@lists.infradead.org>;
	Sat, 5 Mar 2005 17:24:58 +0000 (Local time zone must be set--see zic
	manual page)
From: Gareth Bult <gareth@linux.co.uk>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sat, 05 Mar 2005 17:26:09 +0000
Message-Id: <1110043569.11425.63.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

A little while back I re-wrote blkmtd.c effectively to provide proper
"write" access to jffs2 filesystems mounted on standard Linux block
devices.

The driver seems to have worked well (for me) and after many thousands
of downloads of FlashLinux, I've not had any reports of JFFS2 problems
or corruption.

It appears that someone has "cleaned up" this driver and it now appears
as an option in the standard kernel tree for 2.6.11.

Unfortunately it doesn't appear to work. As soon as you mount a JFFS2
filesystem on it and try to write data, corruption sets in resulting is
a fairly sharp system crash.

Copying back the source from the original driver I submitted to this
list and recompiling the kernel (with a one line change) appears to
yield a working system again.

So, two questions;
a.	Did anyone actually test the code after cleaning it up?
b.	Were there any life changing improvements that I really
	*need* to make to the original code?

tia
Gareth

-- 
Gareth Bult <gareth@linux.co.uk>
