Received: from smtp1-out.completel.net ([195.167.192.112]
	helo=smtp-out.completel.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGH7p-0003oG-AE
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2006 09:55:55 -0500
Received: from [10.0.0.100] (unknown [195.167.231.148])
	by smtp-out.completel.net (Postfix) with ESMTP id E61E625C114
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Mar 2006 15:26:37 +0100 (CET)
From: Philippe Bentz <philippe.bentz@dialine.fr>
To: linux-mtd@lists.infradead.org
Date: Mon, 6 Mar 2006 15:26:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603061526.28697.philippe.bentz@dialine.fr>
Subject: M29W640DB bad address for writing (0x554)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm working with a M29W640DB, a 16 bits flash, in a 8 bits mode.
With CFI detection the MTD driver fails to program memory.
After a lot of debugging we discover that the cfi_send_gem_cmd generates a 
command with a 0x554 adress that could'not be recognized by the flash whereas 
it's waiting for 0x555. 
The formula cmd_ofs * interleave * type (our type is 2 and cmd_ofs 0x2AA) 
seems to be incorrect. So we add a conditional statement after the formula 
that changes 0x554 to 0x555, and it works perfectly. 
So what's the issue ?
It seems that this formula will never work for 16bits flash that are used in 8 
bits mode ?

Thanks for your help.

-- 
Philippe Bentz
