Received: from dswu26.btconnect.com ([193.113.154.27])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zuuw-0006Un-TL
	for <linux-mtd@lists.infradead.org>; Thu, 18 Sep 2003 10:17:38 +0100
From: David Goodenough <david.goodenough@btconnect.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 18 Sep 2003 10:15:19 +0100
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200309181015.19673.david.goodenough@btconnect.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Compulab 586CORE Flash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Has anyone produces the MTD glue to talk to the NOR or NAND Flash on any of
the Compulab X86CORE boards?  Their own driver comes as part binary, and does
not fit the MTD model.  I would feel happier with an all open source driver.

As far as I can tell (but I could be wrong) neither of the existing SC520 MTD
drivers will work with the X86CORE boards, but presumably they should not
need too much alteration.  The NAND Flash on my particular board is Samsumg,
and the documentation that comes with the board does list things like which 
PAR windows are used by both the NOR and NAND flash.  

There was talk on the Voy discusion group for these boards about such an MTD
driver, but the person who said they have written one only identified 
themselves by the first name, not eMail address, and so the trail has gone
quiet.

I have a 586CORE (and 586BASE on which it is mounted), and I am 
running Debian Linux on it, should anyone have anything they wish
to test. 

Thanks in advance

David
