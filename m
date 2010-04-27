Received: from mail-yw0-f190.google.com ([209.85.211.190])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6dqz-0000V3-AW
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 06:01:05 +0000
Received: by ywh28 with SMTP id 28so6435652ywh.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Apr 2010 23:01:03 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Apr 2010 11:31:03 +0530
Message-ID: <r2naecf5e531004262301m8691d8b4h78b5a5dfdbef9a6d@mail.gmail.com>
Subject: Query on Onfi standard support and multiplane commands support in
	linux
From: Sasa Sasa <sasak.1983@gmail.com>
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

Hi,

I am using micron mlc nand which is based on ONFI standard. But in
current linux kernel, as if now there is no support for onfi standard
and also the new commands like program page multiplane or read page
multiplane commands support is not present in nand driver.

Are there any patches available or plan to add support in linux kernel?

Regards
Sasa
