Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vpb1N-0000pc-D8
 for linux-mtd@lists.infradead.org; Sun, 08 Dec 2013 09:51:29 +0000
Received: from leonp.plris.com (leonp.plris.com [192.168.50.57])
 by plris.com (Postfix) with ESMTP id CBDE9A866B
 for <linux-mtd@lists.infradead.org>; Sun,  8 Dec 2013 11:51:07 +0200 (IST)
From: Leon Pollak <leonp@plris.com>
To: linux-mtd@lists.infradead.org
Subject: Erase error does not mark smth in BBT
Date: Sun, 08 Dec 2013 11:51:07 +0200
Message-ID: <1885453.87ds9Vg2nc@leonp.plris.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, all.

I am studying the code in nand_base.c 
I thought that when erase command ends with an error, the corresponding 
block will be marked as bad or in OOB or in BBT or in both.
I think I walked through the code carefully, but did not find this 
BBT/OOB treatment.

Please, help me - where is my error?

BR
-- 
Leon
