Received: from hera.cwi.nl ([192.16.191.8])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1700to-0005K8-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Apr 2002 15:04:04 +0100
From: Andries.Brouwer@cwi.nl
Date: Tue, 23 Apr 2002 16:04:01 +0200 (MEST)
Message-Id: <UTC200204231404.g3NE41414336.aeb@smtp.cwi.nl>
To: dwmw2@infradead.org
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

    From: David Woodhouse <dwmw2@infradead.org>

    >  No, I am afraid this thing doesn't let me talk to raw flash, or if it
    > does, I have not yet discovered how.

    Ok... so when you issue write commands, you're pretending it's a normal
    SCSI hard drive and issuing requests with the _logical_ block numbers?
    You don't have to grok the SmartMedia format and issue _physical_
    addresses on the flash, handle ECC, the block chains, etc.?

It is worse. The commands are SCSI-like, but vendor-unique.
So one has to discover the commands and the details of the
media format. I wrote an ECC routine, and do something more
or less random for the connection between logical and physical blocks.
If you have ECC and LBA/PBA handling, then there is more to merge.

[Things are not quite straightforward. I think the media uses
512+16 byte sectors, but my SCSI commands must use 512+64 byte
sectors.][Of course 512 and 16 are variables. Don't know about 64.]

Andries
