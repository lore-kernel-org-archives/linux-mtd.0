Received: from mail2.megatrends.com ([155.229.80.16]
	helo=atl-ms1.megatrends.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AD19B-0006BO-Rp
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 13:34:30 +0100
Message-ID: <8CCBDD5583C50E4196F012E79439B45C046EBB01@atl-ms1.megatrends.com>
From: Subash Kalbarga <Subashk@ami.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 24 Oct 2003 08:39:12 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: amd_flash.c faster than cfi_cmdset_0002.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all

We have an AM29LV641MH 8 meg flash on board and looking at performance,
using amd_flash.c seems to make things considerably faster when writing to
the flash.

I am using the 2.4.18 kernel.

Is there a particular reason?

It seems do_amd_onewrite seems to wait for a standard timeout period?
Chip->write_delay and then udelays of 10 seconds when reading back status?

Do later versions address this?

I am worried because amd_flash.c is obsoleted. Is it advisable to use it?

Thanks in advance

Subash Kalbarga
