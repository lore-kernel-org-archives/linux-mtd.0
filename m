Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11z3xQ-00053G-00
	for mtd-list@infradead.org; Fri, 17 Dec 1999 20:26:32 +0000
Received: from stonewall.shenandoah.com ([204.111.72.3] helo=mail.datalux.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 11z3xN-00053A-00
	for mtd@imladris.mvhi.com; Fri, 17 Dec 1999 20:26:29 +0000
Message-ID: <385A9C66.1C950DA4@datalux.com>
Date: Fri, 17 Dec 1999 15:26:14 -0500
From: ralph stickley <ralph@datalux.com>
MIME-Version: 1.0
To: Adi Linden <adi@adis.on.ca>
CC: Embedded <linux-embedded@waste.org>, MTD <mtd@imladris.mvhi.com>,
 	Dvir Oren <dvir@lucidvon.com>
Subject: DOC Script for booting 
Content-Type: multipart/mixed;
 boundary="------------897763F3F2EA175D36BB7897"
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------897763F3F2EA175D36BB7897
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ok,
Assuming you have booted to a kernel patched for Disk on chip.
*and* have formatted the Disk on chip to be visible by the BIOS
*and* have loaded the "PeeWee Linux" from Adi Linden.
*and* have the Lilo6_21 and boot.b6_21 from Dvir Oren

http://projects.adis.on.ca/Embedded
<dvir@lucidvon.com>

(I used embedded-0.14.tar.gz, but this should work for just the binaries
too )

Just put the "doc" script in the Embedded_build directory, then type:

./doc -E /doc
./doc -f  /doc

Reboot and disable the Hard disk drive *poof* should boot to the DOC
(Tested with DOC 8MB / DOC 16MB and DOC Milleniumn 8MB)

Let me know if this works for you (or if you have any suggestions or
bug fixes).

Enjoy,
Ralph

Adi, if this is useful, you can add this to your download page...

--------------897763F3F2EA175D36BB7897
Content-Type: application/x-gzip;
 name="doc.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="doc.gz"

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
--------------897763F3F2EA175D36BB7897--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
