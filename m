Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbnGi-00043F-Sh
 for linux-mtd@lists.infradead.org; Mon, 22 Aug 2016 11:19:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by bastet.se.axis.com (Postfix) with ESMTP id 1C96C18091
 for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2016 13:19:23 +0200 (CEST)
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0T1XutNg1Tvl for <linux-mtd@lists.infradead.org>;
 Mon, 22 Aug 2016 13:19:22 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by bastet.se.axis.com (Postfix) with ESMTP id 8893818059
 for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2016 13:19:22 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id 632B418FA
 for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2016 13:19:22 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by boulder.se.axis.com (Postfix) with ESMTP id 587B21779
 for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2016 13:19:22 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
 by thoth.se.axis.com (Postfix) with ESMTP id 56F39304
 for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2016 13:19:22 +0200 (CEST)
Date: Mon, 22 Aug 2016 13:19:17 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Trivial (?) question about nand_command_[lp]()
Message-ID: <alpine.DEB.2.02.1608221313050.6821@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm having a close look at nand_base.c:nand_command(), and there's 
something I can't get my head around: According to the code, when the 
command to be sent is NAND_CMD_SEQIN (0x80), used for programming a page, 
first a read command (READ0, READ1 or READOOB depending on the column 
address) is sent to the flash, followed by the SEQIN proper. Are there 
flashes which require a read command to be sent (with no 
address or data bytes) immediately before Page Program?

A related issue is a difference versus nand_command_lp(). In the latter, 
NAND_NCE is set for every command towards the flash, which makes sense, as 
the chip enable should be active throughout the whole sequence. However, 
in nand_command(), NAND_NCE is only set when neither NAND_ALE nor NAND_CLE 
are set. Is this an older convention in the code that CE is implied for 
small-page flashes when ALE or CLE is set, but not for the large-page 
case?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
