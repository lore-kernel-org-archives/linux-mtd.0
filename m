Received: from f24.law9.hotmail.com ([64.4.9.24] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17exUP-00008n-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 13:43:05 +0100
From: "yuan cain" <armlinuxkernel@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Intel I28F160B3T flash support on Linux JFFS2
Date: Wed, 14 Aug 2002 12:42:32 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <F24C6HixqDCZx4FR0rm000001f4@hotmail.com>
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

Hi all,
       I am now using Intel I28F160B3 flash chip with uClinux 2.4.17 but 
currectly  JEDEC probe can't   notice the  flash chip.  I tracd  but find 
that the base addres is not the same I want it to probe, the physical 
address of the flash is 0x1400000. Below is the message when boot up:
....
Output from jedec_probe.
In function mtd_do_chip_probe,call genprobe_ident_chips next.
In function genprobe_ident_chips, call genprobe_new_chip() next.
In function genprobe_new_chip, show the parameter as below:
Cain: output from jedec_probe_chip. The base address is 0x0.
Search for id:(e1a0 e1a0) interleave(1) type(2)
Search for id:(e1a0 e1a0) interleave(1) type(2)
JEDEC: Found no S3C4510B Flash device at location 0x1400000
JEDEC  probe failed.
...

Any advices?   TIA!!





_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger: 
http://messenger.microsoft.com/cn
