Received: from pony2pub.arc.nasa.gov ([128.102.31.42])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AoVfE-0000E4-4G
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2004 22:38:32 +0000
Received: from [128.102.173.254] (HELO sg-sdl-eng-1.mail.arc.nasa.gov)
	by pony2pub.arc.nasa.gov (CommuniGate Pro SMTP 4.1.8)
	with ESMTP-TLS id 7045564 for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2004 14:38:04 -0800
Message-Id: <5.2.1.1.2.20040204135815.0151a418@mail.arc.nasa.gov>
Date: Wed, 04 Feb 2004 14:44:45 -0800
To: linux-mtd@lists.infradead.org
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: INFTL bad block table support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've got a DOC 2000 TSOP that I'd really like to use for booting an i386 
system.

Using the 2004/2/2 CVS, I see that bad block table support is still missing 
from the
INFTL driver.  If I comment out the if statement in docprobe.c that 
disables INFTL
support for doc2000 TSOP, I can see and mount the existing partitions on my 
device,
though I get various messages about formatting and erase errors for blocks 
in the BBT.

I would be glad to test code for INFTL BBT support if anyone wants to pass 
it to me.

I've looked briefly at docprobe.c, doc2000.c, inftlcore.c and 
inftlmount.c.  According to
the archives, it may not be a large effort to implement BBT awareness.  Can 
someone
give me some pointers as to what needs to be done and in which functions?

Many thanks,
Ted Hildum
