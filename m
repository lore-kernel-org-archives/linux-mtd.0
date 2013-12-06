Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoreS-0008GV-5x
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 09:24:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id 46B0A3F20F8
 for <linux-mtd@lists.infradead.org>; Fri,  6 Dec 2013 10:24:23 +0100 (CET)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 6nRZOjMqp9pE for <linux-mtd@lists.infradead.org>;
 Fri,  6 Dec 2013 10:24:22 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by ra.se.axis.com (Postfix) with ESMTP id 1E3D63F2137
 for <linux-mtd@lists.infradead.org>; Fri,  6 Dec 2013 10:24:18 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id 086C3A8B
 for <linux-mtd@lists.infradead.org>; Fri,  6 Dec 2013 10:24:18 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by boulder.se.axis.com (Postfix) with ESMTP id F1ACFA76
 for <linux-mtd@lists.infradead.org>; Fri,  6 Dec 2013 10:24:17 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by seth.se.axis.com (Postfix) with ESMTP id F03EB3E06F
 for <linux-mtd@lists.infradead.org>; Fri,  6 Dec 2013 10:24:17 +0100 (CET)
Date: Fri, 6 Dec 2013 10:24:17 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Coping with multibit ECC flashes in UBI
Message-ID: <alpine.DEB.2.00.1312061015380.1898@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


There have been SLC NAND flashes around for a while which according to 
their data sheets require 4 or even 8 bit ECC (usually BCH). Traditionally 
this was only the case for MLC NAND, with SLC only requiring single-bit 
ECC (Hamming), and even then, bit flips were very rare.

For flashes that require multibit ECC, it's common to have single bits 
which flip fairly quickly after having been written. Thus, the current 
scheme in UBI of rewriting a flash block when an 'ECC corrected' status 
has been returned during a read would quickly wear out certain blocks.

I seem to recall there being a discussion like a year ago about 
introducing a threshold for the number of corrected bits in a page before 
the containing block was rewritten, but I don't know what became of that. 
Anyone who was more involved remember more?

(I was going to search the list archives, but at least the page 
http://lists.infradead.org/pipermail/linux-mtd/ has no search function).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
