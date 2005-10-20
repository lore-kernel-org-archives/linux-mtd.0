Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EScvZ-0007vF-Uy
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 17:06:03 +0100
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id j9KGHQD2027176
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 16:17:26 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005102020055417064
	for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2005 20:05:54 +0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Oct 2005 20:05:52 +0400
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A014CEB20@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: (no subject)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas,

Selecting of only one CFI buswidth and chip interleave helped to resolve
the halting issue.
cfi_cmdset001.o doesn't contain any reference to __udivsi3 __divsi3 and
__ashrdi3 in data segment.
I made several tests no halts or kernel panics got appeared.=20

P/S=20
1. I also tried to relocate some /arch/arm/lib code into RAM. It was
very bad move because it caused kernel Data abort at the very beginning
of kernel bootup process. Looks some code uses __divsi3 operations
before memory got initialized.
2. I have a question about XIP and icache=20
	a. Execute kernel instructions from FLASH. Start filling of
icache pages by instructions from FLASH.
	b. Do_write_buffer call. Switching to READ_STATUS.=20
	c. Finish filling of icache pages by instructions from FLASH.
(Part of icache is corrupted).
	d. Return from Do_write_buffer=20
	e. Execute instruction from FLASH which is presorted in icache.
-> Data abort or kernel panic.

Is it possible to face the following scenario?=20

Thanks,
Alexey
