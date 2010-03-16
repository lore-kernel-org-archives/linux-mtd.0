Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrQKT-0000qG-Em
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 06:32:42 +0000
Received: by pwj2 with SMTP id 2so2481547pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Mar 2010 23:32:36 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 16 Mar 2010 12:02:36 +0530
Message-ID: <630851df1003152332v69c49385g10e9202a0b5c0147@mail.gmail.com>
Subject: running mtd_stresstest
From: Murali N <nalajala.murali@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am trying to run 'mtd_stresstest' on my nand driver.But it is
failing currently.
I have a query that what is the size of the "len" that is being
request while read/write data in this test case?
As far my understanding it is not generating the 'len' ( rand_len() )
as multiple of underlying flash page size!!!
My driver assumes/expected the 'len' field as multiple size of pages?
To make it run the "mtd_stresstest" on my driver do i need tweak the code?
Is test should pass ( without making any modifications ) on nand
driver which is compliance to the MTD specification?

can anyone clarify my doubts

Regards,
Murali N
