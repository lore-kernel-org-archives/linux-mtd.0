Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OQCVF-00074Q-Rp
	for linux-mtd@lists.infradead.org; Sun, 20 Jun 2010 04:51:30 +0000
Received: by pxi11 with SMTP id 11so808933pxi.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 19 Jun 2010 21:51:28 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 20 Jun 2010 12:51:28 +0800
Message-ID: <AANLkTim7PFSDEQT0H_s3LvGNGpPHxhr1uuXBE6csGlpj@mail.gmail.com>
Subject: a question about mtd partition information
From: schorn dong <schor.dong@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: schor.dong@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
I have a question about MTD partition.
My NAND controller is PCI device, so MTD driver need use pci register
interrface.
I want to add mtd partition features in my MTD driver. But I don't
want to list the
mtd_partition structure in MTD driver. Since I think this is the
platform relevant.
Different platform with the same NAND controller may have different partitions.

Here is my question: If I don't list mtd_partition structure in MTD
driver, which file
is the best one for me to list this structure?
