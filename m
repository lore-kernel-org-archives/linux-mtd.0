Received: from albatros.havelsan.com.tr ([195.142.233.60])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189l58-0005L4-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 11:44:21 +0000
Message-ID: <000901c28657$25f25370$3064000a@NUR>
From: "nur" <nurpinar@havelsan.com.tr>
To: <linux-mtd@lists.infradead.org>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <20021104142950.GO16306@pc.ilinx> <20021104171339.GB13152@wohnheim.fh-wedel.de>
Subject: Unable to handle kernel NULL pointer dereference at virtual address 0000000c
Date: Thu, 7 Nov 2002 14:13:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

1. During boot, I faced this problem right after DiskOnChip Millennium is
recognized

Is this a kernel bug or mtd drivers cause it?
I searched through google to find something and there were several messages
without any solution.
One of them was, David Woodhouse's mtdblock.c correction. As I have newer
version of it, there is no use to test.


2. Is it ok if I compile kernel with DiskOnChip Millennium support for a
system having DiskOnChip Millennium Module?

Thanks, regards

Nur.
