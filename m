Received: from f159.pav2.hotmail.com ([64.4.37.159] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VkQg-00066G-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 03:29:26 +0000
From: "invictus rm" <invictus_rm@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: mtd/jffs2 sync flash problem 
Date: Mon, 30 Dec 2002 19:23:16 +0530
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F159rmffD3RgQdcJNfQ00002dc1@hotmail.com>
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

hi,
   Has anybody on the list successfully tried intel synchronous flash 
28F256K3 with mtd/jffs2 ??
  I have upgraded the flash from 32MB( 28F128J3A) to 64MB(28F256K3) but the 
flash algorithm which was working earlier seems to have been broken.

Erase operation on the flash works fine but programming fails(although WE# 
is getting asserted). The flash data changes from FF to 00 on programming 
the flash.
On checking the status register , the value was 0x80(10000000) , which 
indicated no programming errors.

I am unlocking the entire flash before doing any write to the flash(becoz 
after reset the entire flash is locked).

Any help will be highly appreciated

rgds
rm



_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail&xAPID=42&PS=47575&PI=7324&DI=7474&SU= 
http://www.hotmail.msn.com/cgi-bin/getmsg&HL=1216hotmailtaglines_addphotos_3mf
