Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b1M2-0002s1-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 15:29:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002001c1b0e5$7bda7bc0$7b00000a@SNAGGLE> 
References: <002001c1b0e5$7bda7bc0$7b00000a@SNAGGLE> 
To: "Christopher Hoover" <ch@murgatroid.com>
Cc: linux-mtd@lists.infradead.org, Jeroen.Roose@chess.nl,
    linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: [PATCH] New Lock and Unlock Code for Intel FLASH parts 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Feb 2002 15:41:00 +0000
Message-ID: <27071.1013614860@redhat.com>
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

ch@murgatroid.com said:
>  I rewrote some of the locking and unlocking support for Intel parts
> in drivers/mtd/chips/cfi_cmdset_0001.c because it seemed completely
> broken for parts with variable block sizes, such as the Intel C3 flash
> I am using.

passion /home/dwmw2/working/mtd/drivers/mtd/chips $ patch -p4 --dry-run < ~/Mail/inbox/504  
patching file `cfi_cmdset_0001.c'
Hunk #2 succeeded at 65 (offset 2 lines).
Hunk #3 succeeded at 1079 with fuzz 1 (offset 25 lines).
Hunk #4 succeeded at 1331 (offset 22 lines).
Hunk #5 FAILED at 1407.
Hunk #6 succeeded at 1490 (offset 25 lines).
Hunk #7 FAILED at 1522.
Hunk #8 succeeded at 1608 (offset 26 lines).
Hunk #9 succeeded at 1628 (offset 29 lines).
Hunk #10 succeeded at 1640 (offset 26 lines).
2 out of 10 hunks FAILED -- saving rejects to cfi_cmdset_0001.c.rej


--
dwmw2
