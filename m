Received: from fw2.prolan.hu ([193.68.50.107])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RlfCx-0000EN-7o
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 11:22:09 +0000
Received: from fw2.prolan.hu (localhost.localdomain [127.0.0.1])
 by localhost (Postfix) with ESMTP id B86CF26C152
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 12:22:04 +0100 (CET)
Received: from saturn2.intranet.prolan.hu (webmail.prolan.hu [193.91.83.237])
 by fw2.prolan.hu (Postfix) with ESMTP id AF13F26C146
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 12:22:04 +0100 (CET)
Message-ID: <4F1013DC.8040902@prolan.hu>
Date: Fri, 13 Jan 2012 12:22:04 +0100
From: Peter Rusko <rusko.peter@prolan.hu>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: linux/mtd/gpmi-nand.h: No such file or directory
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I can't compile the gpmi-nand module. Currently I'm using the
pengutronix/imx repository, but I've tried the master branch in
mtd-2.6-git and got the same results:

   CC      drivers/mtd/nand/gpmi-nand/gpmi-nand.o
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:24:33: fatal error:
linux/mtd/gpmi-nand.h: No such file or directory
compilation terminated.

Where can I find that header?

-- 
Ruskó Péter
Fejlesztőmérnök

Prolan Zrt. / Prolan Co.
Hungary 2011 Budakalász, Szentendrei út 1-3.
Tel./Phone: +36 20 954 3118
Fax: +36 26 540 420
E-mail: rusko.peter@prolan.hu
Web: www.prolan.hu
Timezone:CET
