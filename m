Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BSxRx-0006am-HN
	for linux-mtd@lists.infradead.org; Wed, 26 May 2004 08:24:04 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004052608340008304
	for <linux-mtd@lists.infradead.org>; Wed, 26 May 2004 08:34:00 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812A2@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 26 May 2004 08:25:23 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: INFTL/DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

  I have a DOC Mil plus 32Mb chip on a arm core board.  When I load the
inftl modules it places the 94 block device in the /proc/devices file but
doesn't find the DOC.  I am not sure if my problem is that I don't have a
memory map for the device?  When I load the diskonchip module the chip is
found by the first part but the address doesn't seem to get passed to the
nand_scan section.  What am I missing so that the DOC gets seen by the inftl
module?  Do I need a memory map if I am trying to ,mount the device
manually?  If so, should I be adding a map for the device in the maps
directory in the board specific source code? 

Thanks
John
