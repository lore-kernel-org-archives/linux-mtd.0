Received: from mail.schmid-telecom.ch ([213.173.183.22])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pwy6F-0003Km-Hx
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 14:41:24 +0000
Message-ID: <4D76400D.7070408@schmid-telecom.ch>
Date: Tue, 08 Mar 2011 15:41:17 +0100
From: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Tool to generate NAN_ECC_SOFT OOB data?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Frank Haverkamp <haver@vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

what is the preferred way to generate ECC data during manufacturing when
using software ECC (NAND_ECC_SOFT)?

Reading "Can I program NAND via JTAG?" on
http://www.linux-mtd.infradead.org/faq/nand.html, I assume some JTAG
tools are capable of generating ECC data during programming. However, I
would prefer to generate the ECC data beforehand and use a "raw"
programming mode (still skipping bad blocks). Ideally the OOB/ECC layout
is defined only once for both the MTD NAND driver and a userspace tool
to generate image files containing OOB data.

mtd-utils.git once contained such a tool called bin2nand which was
removed with commit 94a20240 (ubi-utils: remove old ubi-utils) on
2010-09-28. Does anyone know a replacement tool?

@Frank: a long time ago (2008-02-18), you tried to move bin2nand to the
top-level directory. Do you still use such a tool?

Best regards,
Daniel
