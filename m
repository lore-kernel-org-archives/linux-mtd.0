Received: from web41509.mail.yahoo.com ([66.218.93.92])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKQfj-0006Vn-UU
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2003 23:14:44 +0000
Message-ID: <20031113231250.68456.qmail@web41509.mail.yahoo.com>
Date: Thu, 13 Nov 2003 15:12:50 -0800 (PST)
From: Andre Sodermans <andreesje_werk@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: suggestion to extend life of ATA IDE flash drive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am somewhat confused about the flash technology and
I have been doing some research but can't seem to find
all the answers.

I have a SSD made by memtech which has a full blown
IDE interface. I am looking for some suggestions on
how to extend the life of this disk (manuf. guarantees
1,000,000 writes per block minimum) by using an
appropriate driver on top of IDE. 

There are some obvious things I can do, i.e. moving
/var/* to ramdisk etc, which should help minimize the
number of writes to the SSD. 

I did read the note By David on the very bottom of the
mtd homepage about compactflash IDE drives, but I have
been hearing different stories about this - somebody
mentioned that there exists an mtd-emulation. Is this
really true?

thanks in advance,
Andre



__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree
