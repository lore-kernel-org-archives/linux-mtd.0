Received: from ms-smtp-01.texas.rr.com ([24.93.36.229])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19GKYR-0000SZ-Vl
	for <linux-mtd@lists.infradead.org>; Thu, 15 May 2003 16:22:00 +0100
Received: from dirt (cs6668146-73.austin.rr.com [66.68.146.73])
	h4FFMF8b023679	for <linux-mtd@lists.infradead.org>;
	Thu, 15 May 2003 10:22:15 -0500 (CDT)
Date: Thu, 15 May 2003 10:10:03 -0500
From: Earl Manning <emanning@austin.rr.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20030515101003.471557de.emanning@austin.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Generating a NAND Image
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there a way to get a complete image off of a NAND part?  I have a partition describing the complete chip, but I need the OOB data inline with the rest of the data.  We need to send the data off to have it pre-burned in the flash chips.

Thanks,
Earl
