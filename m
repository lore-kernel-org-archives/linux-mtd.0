Received: from [217.167.239.213] (helo=tasmanie.mensi.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LLpQ-0000yZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 11:39:44 +0100
Message-ID: <003a01c2190f$998b1cf0$280300c0@groenland>
From: "Guillaume David" <guillaume.david@mensi.com>
To: <linux-mtd@lists.infradead.org>
Cc: <guillaume.david@mensi.com>
Subject: Problem in duplicating DoC2000
Date: Fri, 21 Jun 2002 12:37:11 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi,

I'm really happy having success in building an embedded linux system on
DoC2000 with the mtd stuff.
This system boots thanks to grub.

I bought the disk-on-chip GANG programmer from M-System to copy easily and
fast my systems.
This programmer first copies the source DoC to its own hard disk in an image
file. Then in a second time, it writes the image file to the target DoC.
But it doesn't really works, the copies seem to start but I have a message
such as :
    Spare Media Header for NFTL 0 found in flash sector 224
    nftl_rawread error 16 in memcpy() or earlier, press any key...

I press a key and then the boot sequence goes on and hangs up after having
written
    NFTL driver: nftlcore.c $ Revision1.86$, nflmount.c $ Revision 1.28 $

The original DoC works pretty well instead, there must be some problem in
the copy process.

Do you have any idea of what happened and how I can correct or avoid the
problem.

Best Regards

Guillaume DAVID
Mensi
