Received: from web10806.mail.yahoo.com ([216.136.130.248])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16o4pU-0006zy-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2002 15:50:16 +0000
Message-ID: <20020321160145.67364.qmail@web10806.mail.yahoo.com>
Date: Thu, 21 Mar 2002 08:01:45 -0800 (PST)
From: Scott Kapu <kapus1@yahoo.com>
Subject: LILO booting (L 40 40 40)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I was having a problem booting using the stock lilo.
I was getting "L 40 40 40 40 40 40 4"

lilo 22.2
After adding the following to lilo.conf;

disk=/dev/nftla
bios=0x80
disk=/dev/hda
bios=0x81
lba32
(dual booting from doc and hda)

Lilo appears to work...
Hope this helps someone out there

-Scott

__________________________________________________
Do You Yahoo!?
Yahoo! Movies - coverage of the 74th Academy Awards®
http://movies.yahoo.com/
