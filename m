Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIf9F-0008S2-O0
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 14:07:46 +0000
Received: from leonp.plris.com (leonp.plris.com [192.168.50.57])
 by plris.com (Postfix) with ESMTP id D7577870001
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 16:07:21 +0200 (IST)
From: Leon Pollak <leonp@plris.com>
To: linux-mtd@lists.infradead.org
Subject: What is wrong?
Date: Wed, 26 Feb 2014 16:07:21 +0200
Message-ID: <4315632.KkRm7kzq26@leonp.plris.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, all.
I will be very thankful for any hint...:)

I use JFFS2 version 2.2.(NAND)(SUMMARY)(C) 2001-2006 Red Hat, Inc. 
(comes with MontaVistaPro 5.0). Kernel 2.6.18.
I prepare JFFS2 partition with mkfs.jffs2 and sumtool and burn it with 
flash_eraseall and 'nandwrite -p'.
Everything works fine.

The NAND is write protected by HW and the partition is mounted as RO. 
At some moment I need to update a small file. 
So I do: 
- HW write protect off, 
- remount RW, 
- update file, 
- sync, 
- remount RO, 
- write protect on.

Looking at linux console I see a lot of messages like:
Erase at 0x00400000 failed immediately: errno -5
Erase at 0x003e0000 failed immediately: errno -5
......
Erase at 0x00340000 failed immediately: errno -5
jffs2_flush_wbuf(): Write failed with -5
Write of 2016 bytes at 0x002578a0 failed. returned -5, retlen 0
Not marking the space at 0x002578a0 as dirty because the flash driver 
returned retlen zero.


This is repeated for a long time, but everything seems work OK.
The sequential starts and even file updates are also OK, without error 
messages.

What do I do wrong? Thanks a lot.

--  
Leon
