Received: from hera.cwi.nl ([192.16.191.8])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16zkTL-0004Nz-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2002 21:31:39 +0100
From: Andries.Brouwer@cwi.nl
Date: Mon, 22 Apr 2002 22:31:35 +0200 (MEST)
Message-Id: <UTC200204222031.g3MKVZq07564.aeb@smtp.cwi.nl>
To: Andries.Brouwer@cwi.nl, dwmw2@infradead.org
Subject: Re: Flash device IDs
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        mdharm-usb@one-eyed-alien.net
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

David Woodhouse writes:

    Andries.Brouwer@cwi.nl said:
    > In include/linux/mtd/nand_ids.h there is some information about device
    > IDs and device properties of NAND flash devices.

    > In drivers/usb/storage/sddr09.c there is very similar information.
    > Probably both tables should be merged.

    Yes, probably. If the SDDR-09 lets you talk to the raw flash rather than 
    doing the SmartMedia format for you in hardware/firmware then that support
    probably also wants to be separated so it can be used on any hardware. 

Maybe you can look at ftp.XX.kernel.org people/aeb/*sddr09*.
I used identifiers nand_* when I thought things would be useful
for both (so that they should be outside of the usb tree).
Maybe we can find a suitable setup.

No, I am afraid this thing doesn't let me talk to raw flash,
or if it does, I have not yet discovered how.

Andries
