Received: from mail.bustech.com ([199.190.209.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16BGDs-0000uo-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2001 14:07:01 +0000
Message-ID: <006501c17cce$9c30b6f0$26e8b2c6@MHILL>
From: "Mike Hill" <mhill@bustech.com>
To: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.33.0112030715100.14716-100000@newbast.lynuxworks.com>
Subject: LOCK/UNLOCK questions in cfi_cmdset_0001.c 
Date: Tue, 4 Dec 2001 09:18:28 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I am not very familiar with the CFI code.  Could someone who is familiar
with the cfi_cmdset_0001.c code take a look at this and verify:

1) It appears that in both cfi_intelext_lock and cfi_intelext_unlock, FLASH
parts with multiple erasesize regions are not supported.

2) In cfi_intelext_unlock, only the region pointed to by the offset will be
unlocked.  The "len" parameter is never used to calculate if more than one
region should be unlocked.


Thanks,
Mike
