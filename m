Received: from ns1.ixmail.hkcix.com ([202.181.230.228] helo=ixmail.hkcix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uZwb-0000bD-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2001 14:44:14 +0100
Message-ID: <3BD030F4.300970C9@uniquemodem.com>
Date: Fri, 19 Oct 2001 21:56:04 +0800
From: data <data@uniquemodem.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Problem on recognise the CFI flash chip on SC520CDP
References: <3BCD84E1.4DD484A6@uniquemodem.com> <25716.1003325012@redhat.com>
Content-Type: text/plain; charset=us-ascii
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

Hi David,

We got through the kernel compilation process but we encountered another
problem on recognising the CFI flash chip. I have compared with the boot
up process of other people. They usually have the CFI recongising but we
don't have, i.e. CFI: Found 4*8 device....

We use the on-board flash AMD29LV014B  x 4 Bank#0 & Bank#1

Could you please give us a hand to find out why?

Thanks and regards,

Jimmy

Boot Log:

physmap flash device: 4000000 at 8000000
CFI: Found no Physically mapped flash device at location zero
SC520 CDP flash device: 800000 at 8800000
CFI: Found no SC520CDP Flash Bank #0 device at location zero
request_module[jedec]: Root fs not mounted
mtd: Giving out device 0 to SC520CDP Flash Bank#0
SC520 CDP flash device: 800000 at 9000000
CFI: Found no SC520CDP Flash Bank #1 device at location zero
request_module[jedec]: Root fs not mounted
mtd: Giving out device 1 to SC520CDP Flash Bank#1
SC520 CDP flash device: 80000 at 9800000
CFI: Found no SC520CDP DIL Flash device at location zero
request_module[jedec]: Root fs not mounted
mtd: Giving out device 2 to SC520CDP DIL Flash


Compare with the others:

SC520CDP Flash Bank #0: Found 4 x8 devices at 0x0 in 32-bit mode
Amd/Fujitsu Extended Query Table v1.0 at 0x0040
SC520CDP Flash Bank #0: JEDEC Device ID is 0xC8. Assuming broken CFI
table.
number of CFI chips: 1
mtd: Giving out device 0 to SC520CDP Flash Bank #0
SC520 CDP flash device: 800000 at 8c00000
SC520CDP Flash Bank #1: Found 4 x8 devices at 0x0 in 32-bit mode
Amd/Fujitsu Extended Query Table v1.0 at 0x0040
SC520CDP Flash Bank #1: JEDEC Device ID is 0xC8. Assuming broken CFI
table.
number of CFI chips: 1
mtd: Giving out device 1 to SC520CDP Flash Bank #1
SC520 CDP flash device: 80000 at 8400000
SC520CDP DIL Flash: Found no CFI device at location zero
