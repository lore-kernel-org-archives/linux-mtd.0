Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NZtCc-0005Ek-Kr
	for linux-mtd@lists.infradead.org; Tue, 26 Jan 2010 21:44:07 +0000
Received: by bwz4 with SMTP id 4so4634842bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jan 2010 13:44:00 -0800 (PST)
Subject: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Jan 2010 23:43:57 +0200
Message-ID: <1264542237.15306.14.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Since my xD/SmartMedia support is done (will send small update
tomorrow), I am switching focus to MemStick conteroller.

Since I am a perfectionist (at lest still am...) I want to have support
for both MemStick and MemStick pro.

Alex, I see that your PRO support is in kernel, not legacy support
isn't. Why?

Legacy MemSticks also are barebone like XD and thus need an FTL.
However, they don't have NAND interface.

My current goal is to take your ms_block.c, understand it, port to
latest kernel, and attempt a merge.

Its also possible to do the same I did with XD, write an MTD driver and
another FTL.

Since legacy memsticks are rare. I would like not to write mtd driver.

Also, any information, about memsticks is welcome. It would help me a
lot.

I assume that both Memstick, and Memstick Duo are similiar on hardware
level, (both bare flash).

Same for, Memstick PRO and MemStick PRO Duo.

Best regards,
Maxim Levitsky
