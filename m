Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17NYtS-0003qg-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2002 14:01:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: How to Clean bad Grubfirmware off  DOC?
Date: Thu, 27 Jun 2002 09:00:12 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200206270857718.SM02488@there>
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

g_friend@etang.com wrote:
> How can I clean the bad grub off my doc?

Since you cannot boot with the doc2000 installed, I'd recommend trying the 
following, **very carefully**:

  1. Turn off system
  2. Remove DoC from board (I assume it's an ISA/PCI board with DoC socketed?)
  3. Install *empty* DoC board
  4. Boot into DOS
  5. Install latest M-Sys DOS utilities (if not already done)
  6. *** CAREFULLY *** install DoC into socket
  7. Run DFORMAT utility to replace grub firmware

*Disclaimer:  This procedure has worked for me, but it could do *bad things* 
to your DoC.  Use it only as a last resort.

If your machine supports "Network" boot, you may want to try configuring GRUB 
with the "--enable-diskonchip-biosnetboot" option.  This will allow you to 
selectively boot from the DoC, returning to booting from a hard drive or 
floppy when needed.
