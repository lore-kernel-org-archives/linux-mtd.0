Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjlZB-0002BF-Ak
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 03:36:14 +0000
Received: by pwj2 with SMTP id 2so2087517pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 19:36:07 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 23 Feb 2010 09:06:07 +0530
Message-ID: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
Subject: MLC nand driver for linux
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

Regarding MLC nand devices, Is there any change or support required in
exiting kernel drivers basically nand_base and mtd drivers etc or they
simply support this device. Like for onenand there are different read
and write calls for mlc as we see in onenand_base.c file.

Regards
Sasa
