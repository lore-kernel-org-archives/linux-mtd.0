Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aNOj-0001xp-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 22:22:17 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
Date: Thu, 1 Aug 2002 17:21:11 -0400
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0208011649190.21990-100000@server.superbt.com>
In-Reply-To: <Pine.LNX.4.44.0208011649190.21990-100000@server.superbt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208011718437.SM02488@there>
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

Ilguiz Latypov wrote:

> Could that be due to change in MTD patch I made?  I added the
> informational message output "DoC found" at the time of ROM BIOS extension
> scan.  I wonder if the video card's BIOS extension can render INT 10h
> unstable at that time.

I don't think so -- I temporarily removed that message, and made sure that 
the initial code (what used to be in doc_stage1.S) matched the previous 
version that worked.  It didn't make any difference - it still locked up on 
the P-133's, but not on the Athlon.

For what it's worth, on one of the PC's, the lockup occurs at line 363, in 
the readbyte loop.  We copy a few pages OK (%di = 0x400, 0x500, 0x600), but 
lock up when %di is between 0x700 and 0x800, specifically with ES:DI equal to 
0x07E0:0x0719.

The other board makes it to the "Jumping to Grub" message, but then 
immediately reboots.

Mark
