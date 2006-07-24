Date: Mon, 24 Jul 2006 12:18:42 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD performance issues on XIP configuration.
In-Reply-To: <1151415660.17609.132.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.56.0607241153400.23994@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606261628560.8547@pentafluge.infradead.org>
	<1151415660.17609.132.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
Cc: davide.cascone@st.com, nico@cam.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Thanks a lot for commiting the patch which fixes some performance and stability issues in CFI driver.
Is it possible to include the patch for XIP performance issues too? It's very simple and  I think it shouldn't cause any complains. The patch, comments and signed off are added to this letter


Thanks,
Alexey
> > Hi All,
> > 
> > Current implementation of cfi_cmdset_0001 driver has serious performance issues in case of enabled MTD XIP configuration.
> > Performance tests showed RAW write performance on XIP configuration ~60Kb/sec on Sibley (It should be over 400Kb/s)
> > I investigated this problem:
> > When we perform write or lock/unlock operation we call WAIT_TIMEOUT which passes chip_op_time = 0 to function xip_wait_for_operation. When zero timeout is passed to xip_wait_for_operation it automatically sets the usec = 500000 - and we send cpu to idle when it is unnecessary.
> > To fix the issue I corrected the condition for sending CPU to idle.
> > 
> > If you don't have any concerns regarding the following code could you please put it into the repository?
> 
> Code looks fine but please could you resubmit with an appropriate
> Signed-off-by: line?
> 
> And how did you send your mail, btw? You should be sending from
> akorolev@infradead.org rather than at any specific host.
> 


Fix of performance issues on XIP configurations. 
Tests demonstrated very poor write and lock/unlock performance on XIP.
The reason of the failure is related to the incorrect condition of sending CPU to idle.


Signed-off-by: Alexey Korolev <akorolev@infradead.org>
-------------------------------
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-07-19 21:40:04.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-07-24 14:30:28.542343528 +0400
@@ -1001,7 +1001,7 @@
 			map_write(map, CMD(0x70), adr);
 			chip->state = oldstate;
 			start = xip_currtime();
-		} else if (usec >= 1000000/HZ) {
+		} else if (chip_op_time >= 1000000/HZ) {
 			/*
 			 * Try to save on CPU power when waiting delay
 			 * is at least a system timer tick period.
