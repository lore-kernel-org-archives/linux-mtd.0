Received: from scan1.fhg.de ([153.96.1.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1616el-0007xX-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 13:52:47 +0000
Received: from scan1.fhg.de (localhost [127.0.0.1])
	by scan1.fhg.de (8.11.1/8.11.1) with ESMTP id fA6E22W28443
	for <linux-mtd@lists.infradead.org>; Tue, 6 Nov 2001 15:02:02 +0100 (MET)
Received: from iese.iese.fhg.de (iese.iese.fhg.de [153.96.133.2])
	by scan1.fhg.de (8.11.1/8.11.1) with ESMTP id fA6E21P28435
	for <linux-mtd@lists.infradead.org>; Tue, 6 Nov 2001 15:02:01 +0100 (MET)
Received: from iese.fhg.de (pc144.iese.fhg.de [153.96.133.70])
	by iese.iese.fhg.de (8.9.3/8.9.3) with ESMTP id PAA24165
	for <linux-mtd@lists.infradead.org>; Tue, 6 Nov 2001 15:02:00 +0100 (MET)
Message-ID: <3BE7ED58.EEB937BA@iese.fhg.de>
Date: Tue, 06 Nov 2001 15:02:00 +0100
From: Alexander Kubicki <kubicki@iese.fhg.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: PCMCIA linear Flash (5V read/write)
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,

I´m using a compatible AMD Flash D-Series 4MB PCMCIA Card from Kingmax
(http://www.tecsys.de/memory_frame.htm)
I want to erase it blockwise or whole card and write to it adresswise as
a raw device.
The tool "wrflash" (http://www.telos.de/download/default_e.htm#alios (in
alios_source)) is designed for this purpose but crashes because of a
segmentation fault. The same with ftl_format (only for testing)

The card is recognized by linux (cardctl info, cardctl ident, ftl_check
/dev/mem0c0c).
Other PCMCIA-Cards (CompactFlash with Adapter, Adaptec-SCSI) work fine.

I use SuSE Linux 7.2 (standard SUSE Kernel 2.4.4  / cardmgr 3.1.25)

Can you provide some information?
Thanks in advance

Alexander
