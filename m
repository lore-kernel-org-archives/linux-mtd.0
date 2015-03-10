Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVInk-0001ZJ-AO
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 11:58:21 +0000
Received: from [127.0.0.1] (unknown [192.168.0.126])
 by mx.dave-tech.it (Postfix) with ESMTPS id 25E2695
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 12:57:54 +0100 (CET)
Message-ID: <54FEDC42.2060407@dave-tech.it>
Date: Tue, 10 Mar 2015 12:57:54 +0100
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: mtd_mailinglist <linux-mtd@lists.infradead.org>
Subject: RFC: detect and manage power cut on MLC NAND
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear All,

for testing and research purpose, I'm working with an Embedded Linux
product which mounts an MLC NAND.

I know that one of the trouble with MLC flash on Linux with UBI/UBIFS is
the power cut management (ref.
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits)

IIUC the solution inside MTD/UBI/UBIFS is not so simple and thus not so
quick to implement.

I'm wondering if anyone of you already think about managing power cut in
a different way: many embedded/industrial products already have some
big/huge bypass capacitor that are able to keep the system alive for
hundreds of milliseconds (this is useful for power supply
micro-interruptions), which are commonly enough to complete the latest
NAND operation.
Most of the has a GPIO/IRQ that tells whenever such a power cut happens,
so the kernel can take some actions with it (e.g., in our case, complete
the last NAND operation and prevent from starting newer operation, which
may corrupt the NAND pages).

WDYT about this?
If it sounds reasonable is there any suggestion where to place such a code?

Best Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
