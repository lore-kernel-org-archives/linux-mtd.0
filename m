Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxpK2-0002eK-Vm
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 11:59:28 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id B37A12F016
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2004 17:59:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 944D7A2EC
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2004 17:59:23 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 2ED6BA262
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2004 17:59:23 +0200 (CEST)
Message-ID: <4124CE5A.5080508@imc-berlin.de>
Date: Thu, 19 Aug 2004 17:59:22 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: do_write_oneword(): software timeout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I am facing these messages

MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
Write of 2577 bytes at 0x00167098 failed. returned -5, retlen 2576

when writing to my JFFS2 root fs.

A simple "cat bla > /dev/mtd/3" to a flash partition (seems to) works.

I am using linux-2.6.8.1 on a custom ARM9 board.
Flash is a spanion 29GL064M90 (8MB, 16bit Data bus):

HRDisplay: probing flash at 0x10000000
imc HRDisplay Flash: Found 1 x16 devices at 0x0 in 16-bit bank
  Amd/Fujitsu Extended Query Table at 0x0040
imc HRDisplay Flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Using static partition definition
Creating 5 MTD partitions on "imc HRDisplay Flash":
0x00120000-0x00740000 : "JFFS2"
0x00000000-0x00030000 : "U-Boot"
0x00030000-0x00040000 : "Environment"
0x00040000-0x00050000 : "FPGA"
0x00050000-0x00120000 : "Kernel"

Increasing the timeouts in do_write_oneword() in 
drivers/mtd/chips/cfi_cmdset_0002.c does not help.

Any idea how I could chase that down?

linux-2.6.8.1 does contain a recent version of the MTD/JFFS code, right?

Thanks a million!

-- 
Steven Scholz
