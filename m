Received: from [63.149.69.17] (helo=ADDISON.belkin.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bfi0f-0004ur-A0
	for linux-mtd@lists.infradead.org; Wed, 30 Jun 2004 12:32:34 -0400
Message-ID: <006B22B846854640942D08F78855FCE18160E4@addison.belkin.com>
From: Michael Leibow <MichaelLe@belkin.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 30 Jun 2004 12:32:30 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: Failure writing to flash in drivers/mtd/chips/cfi_cmdset_0002.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have an AMD Spansion S29GL064M flash chip.  The cfi_amdstd_setup() code in
cfi_cmdset_0002.c chooses a write method:

If( cfi->cfiq->BufWriteTimeoutTyp )
{
   printk( "Using buffer write method\n" );
   mtd->write = cfi_amdstd_write_buffers;
} else {
   printk( "Using word write method\n" );
   mtd->write = cfi_amdstd_write_words;
}

This flash part doesn't seem to work properly with the write_buffers code.
cfi_amdstd_write_buffers() always returns with retlen == 0.

If I comment out the top part of the if and force the "word write" method,
then it works fine.  Anybody else seen this?

Michael Leibow
Senior Software Engineer

Belkin Corporation
Research & Development Labs
585 324-7815
www.belkin.com
