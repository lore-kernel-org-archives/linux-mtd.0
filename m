Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t99q-0001lG-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 15:23:42 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t99p-0001lA-00
	for mtd@infradead.org; Fri, 27 Apr 2001 15:23:41 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 14t99j-0005fq-00
	for mtd@infradead.org; Fri, 27 Apr 2001 15:23:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Absent Configure.help
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Apr 2001 15:23:35 +0100
Message-ID: <21813.988381415@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I just added some help text. I've not bothered with some of the mapping 
drivers - please could the owners of those fix it up accordingly. 

If you have suggested improvements to the text I've thrown together, please 
feel free to send patches. But at least there's something there now.

Still missing (afaict) are:

CONFIG_MTD_CFI_FLAGADM
CONFIG_MTD_ARM
CONFIG_MTD_IQ80310
CONFIG_MTD_CSTM_MIPS_IXX
CONFIG_MTD_CSTM_MIPS_IXX_BUSWIDTH
CONFIG_MTD_CSTM_MIPS_IXX_LEN
CONFIG_MTD_CSTM_MIPS_IXX_START
CONFIG_MTD_DBOX2
CONFIG_MTD_SBC_GXX

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
