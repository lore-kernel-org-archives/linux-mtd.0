Received: from mail.oco.net ([216.171.163.254] helo=oco.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEXjU-0002X7-Sy
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2003 17:34:17 +0000
Message-ID: <3F9EA810.6010905@celerity.net>
Date: Tue, 28 Oct 2003 09:32:00 -0800
From: Chris Ellec <cellec@celerity.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: INFTL problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a WinSystems devel board with a DOC on it. Dinfo from MSystems 
reports a DOC 2000 at address D800 with 256 MB and an INFTL format.

I apllied the latest CVS patches to 2.4.22, but I can't seem to detect 
the chip.

I followed the doc in CVS and compiled as modules with the following 
options:

-------------------  from .config  ---------------------------
#
# Memory Technology Devices (MTD)
CONFIG_MTD=m
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_CHAR=m
CONFIG_MTD_BLOCK=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=m

# Self-contained MTD device drivers
CONFIG_MTD_DOC2000=m
CONFIG_MTD_DOCPROBE=m
CONFIG_MTD_DOCPROBE_ADDRESS=0

#
# NAND Flash Device Drivers
CONFIG_MTD_NAND_IDS=m
------------- end of .config  ----------------------------

Then I do
# modprobe -a doc2000  inftl mtdchar mtdblock
# modprobe -a docprobe
/lib/modules/2.4.22/kernel/driver/mtd/devices/docprobe.o: init_module: 
Resource temporarily unavailable
insmod docprobe failed


in /var/log/messages I get:
INFL: inftlcore.c $Revision 1.14 inftlmount.c $Revision 1.12
No Recognized DiskOnChip found


Now what do I do ?

Chris.
