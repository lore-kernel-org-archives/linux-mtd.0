Received: from ihemail2.lucent.com ([135.245.0.35])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KqrSx-00016E-Jw
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 15:42:15 +0000
Received: from ilexp03.ndc.lucent.com (h135-3-39-50.lucent.com [135.3.39.50])
	by ihemail2.lucent.com (8.13.8/IER-o) with ESMTP id m9HFg8cb020358
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Oct 2008 10:42:12 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Mark bad eraseblock back to good
Date: Fri, 17 Oct 2008 10:41:38 -0500
Message-ID: <8F3CB692693422439A8F95F2D06F73E1E4D9DF@ILEXC3U01.ndc.lucent.com>
From: "Spinelli, Claudio \(Claudio\)" <claudio@alcatel-lucent.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using a nand flash that has a lot of marked bad eraseblock. I think
that are marked bad from previous mistake in my nand flash driver.
Does anybody have a modified flash_eraseall that marks bad eraseblock
back to good. Or any scripts that does that?

Thanks
Claudio
