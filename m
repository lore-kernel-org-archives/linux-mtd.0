Received: from 206-248-137-77.dsl.teksavvy.com ([206.248.137.77]
	helo=mail.isoar.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3fM2-0003ZO-BX
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 22:52:00 +0000
Received: from [10.0.200.99] (vpn02.rossvideo.com [209.5.118.98])
	by mail.isoar.ca (8.14.1/8.13.8) with ESMTP id m53MoAb6027434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 3 Jun 2008 18:50:14 -0400
Message-ID: <4845CAA2.3070207@isoar.ca>
Date: Tue, 03 Jun 2008 18:50:10 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: BCH for NAND ECC
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is anyone looking at BCH for NAND ECC?  If so, I'll let the experts have
at it.

Otherwise...

I can't really find any examples for NAND usage, and am inching my way
through the theory.

Am I correct in that BCH(2096, 2048, 9) would do for 4 correctable
errors in a 256 byte block?  Assuming I understand any of it, that would
be 6 bytes of ECC per block.

--
Andrew E. Mileski
