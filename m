Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.epico.si)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoKgJ-000646-DH
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 10:40:53 -0400
Received: from [192.168.0.3] (telperion.ee.epico.si [192.168.0.3])
	by lorien.ee.epico.si (8.12.11.20060308/8.12.11) with ESMTP id
	l4GEeesf013932
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 16:40:40 +0200
Message-ID: <464B17F3.9040804@users.sourceforge.net>
Date: Wed, 16 May 2007 16:40:51 +0200
From: Savin Zlobec <savinz@users.sourceforge.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problems with ST NAND512W3A nand flash
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

Hi All!

I am working on a AT91RM9200 based board with ST NAND512W3A2B flash.
Kernel version is 2.6.19.7 with patches from maxim.org.za/at91_26.html.
Everything works perfectly, except for boot time NAND chip
identification which fails every once in a while. NAND signature
is 0x20 0x76, but sometimes I get 0x20 0x20. My first guess was
timing problems, but I've double checked everything and all signals
are inside the specs. I've also tested the chip with shorter and
longer setup, hold and pulse times for read and write, but without
any success. Trying different kernels didn't help either.

Any ideas and/or comments would be very much appreciated.


Thanks,
savin
