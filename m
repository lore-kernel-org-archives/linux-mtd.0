Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCuWZ-0002Kg-LT
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 14:06:28 +0000
Message-ID: <4DB039C0.5030209@parrot.com>
Date: Thu, 21 Apr 2011 16:05:52 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
	Norris <norris@broadcom.com>
Subject: strange bad block code
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

while looking at the bad block code, I saw that e0b58d0a introduced a
"chip->badblockbits" for bad block detection in nand_block_bad[1].
That's great because to we can use it to handle bit flip in bad block marker.

But few commit latter c7b28e25cb9 removed "chip->badblockbits = 8;" from common
code.
So now chip->badblockbits = 0.

How such code wan works ?

Adding NAND_SKIP_BBTSCAN in any driver, expose the problem.



[1]
    if (likely(chip->badblockbits == 8))
        res = bad != 0xFF;
    else
        res = hweight8(bad) < chip->badblockbits;
