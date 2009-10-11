Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mwtxj-00054H-3J
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 08:39:36 +0000
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 11:39:17 +0300
Message-Id: <1255250357.16942.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-09-29 at 06:26 -0700, Darwin Rambo wrote:
> A better error message would say something like:
> "UBI error: Data page incorrectly programmed to all 0xFFs with non-0xFF ECC."

Just FYI, I've created this FAQ section:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat

Here is the full text in case someone would review:

Why I have to use ubiformat?
The first obvious reason is that ubiformat preserves erase counters, so
you do not lose your wear-leveling information when flashing new images.

The other reason is more subtle, and specific to NAND flashes which have
ECC calculation algorithm which produces ECC code not equivalent to all
0xFF bytes if the NAND page contains only 0xFF bytes. Consider an
example.

      * We erase whole flash, so everything is 0xFF'ed now.
      * We write an UBI/UBIFS image to flash using nandwrite.
      * Some eraseblocks in the UBIFS image may contain several empty
        NAND pages at the end, and UBIFS will write to them when it is
        run.
      * The nandwrite utility writes whole image, and it explicitely
        writes 0xFF bytes to those NAND pages.
      * The ECC checksums are calculated for these 0xFF'ed NAND pages
        and are stored in the OOB area. The ECC codes are not 0xFF'ed.
        This is often the case for HW ECC calculation engines, and it is
        difficult to fix this. Normally, ECC codes should be 0xFF'ed for
        such pages.
      * When later UBIFS runs, it writes data to these NAND pages, which
        means that a new ECC code is calculated, and written on top of
        the existing one (unsuccessfully, of course). This may trigger
        an error straight away, but usually at this point no error is
        triggered.
      * At some point UBIFS is trying to read from these pages, and gets
        and an ECC error (-EBADMSG = -74).

In fewer words, ubiformat makes sure that every NAND page is written
once and only once after the erasure. If you use nandwrite, some pages
are written twice - once by nandwrite, and once by UBIFS.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
