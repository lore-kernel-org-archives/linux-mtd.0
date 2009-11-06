Received: from mail-px0-f203.google.com ([209.85.216.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N6OmN-0006ll-OB
	for linux-mtd@lists.infradead.org; Fri, 06 Nov 2009 13:23:08 +0000
Received: by pxi41 with SMTP id 41so698019pxi.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Nov 2009 05:23:02 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Nov 2009 18:53:02 +0530
Message-ID: <52760a310911060523x6853acb2rbb92818324e920d8@mail.gmail.com>
Subject: scantest : READOOB Issue
From: Adish Kuvelker <adkuvi@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have developed a NAND driver for an ARM9-based processor with
Samsung K9F2G08U0M NAND Flash. Since the Flash chip doesn't support
the  NAND_CMD_READOOB command I had skipped the development for this.
We are now subjecting this driver to MTD tests. But while doing the
MTD scantest I found that the test requires reading the OOB section
through the NAND_CMD_READOOB command.

Do I have to develop the support for this command in my code in order
to have a MTD compliant driver? Will the absence of support for this
result in the driver being non-compliant?

Regards;
Aadish
