Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwzyK-00045U-J0
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 15:04:36 +0000
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910D7FCB251@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
	<1255250357.16942.0.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7FCB251@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 18:04:22 +0300
Message-Id: <1255273462.21218.13.camel@localhost>
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

Hi,

On Sun, 2009-10-11 at 07:38 -0700, Darwin Rambo wrote:
> > The other reason is more subtle, and specific to NAND flashes 
> > which have
> > ECC calculation algorithm which produces ECC code not 
> > equivalent to all
> > 0xFF bytes if the NAND page contains only 0xFF bytes. Consider an
> > example.
> > 
> >       * We erase whole flash, so everything is 0xFF'ed now.
> >       * We write an UBI/UBIFS image to flash using nandwrite.
> >       * Some eraseblocks in the UBIFS image may contain several empty
> >         NAND pages at the end, and UBIFS will write to them when it is
> >         run.
> 
> I think this is dangerous for UBIFS to assume that FF data = FF oob, especially 
> as hardware ECCs appearing more and more.

UBIFS does not assume *anything* about ECC. UBI/UBIFS does not assume
anything about flash type even. E.g., it works on NOR.

All UBIFS assumes is that it may write more data to the end of
eraseblocks, nothing else. IMHO, this is a reasonable assumption.

>  It would be nice if there
> was a standard that all FF data must generate all FF ECC but this isn't the case
> (though it would solve some corruption issues). Perhaps we should leave a runtime
> check in (not paranoid check) for the next year or two that checks the oob also 
> if the data is all FF just to catch these issues.

UBI/UBIFS is perfectly fine with any algorithm. All I ask to do is to
use ubiformat tool to flash UBI images, or any other tool which is able
to skip 0xFFed NAND pages.

I've documented how an UBI-aware flasher should work:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

> 
> >       * When later UBIFS runs, it writes data to these NAND 
> > pages, which
> >         means that a new ECC code is calculated, and written on top of
> >         the existing one (unsuccessfully, of course). This may trigger
> >         an error straight away, but usually at this point no error is
> >         triggered.
> 
> When this happens, you often see an XOR operation taking place on the ECC. For example, if the
> ECC for a 512 byte sector all FF data is 
> "10 ae d1 f6 12 6c 65 3d 68 86 1a db 4a"
> and the new intended ECC for a new sector of non FF data is 
> "18 20 f1 91 87 d3 bd 30 a7 4f 3f 23 75"
> then I have seen that the resultant ECC (since programming can only change 1's to 0's) is like an AND operation
> "10 20 d1 90 02 40 25 30 20 06 1a 03 40"

Right, the result is anyway corrupted ECC.

> Now readback validation if it were turned on would catch that the ECC correction could not be 
> performed and you could see an error right away in this case.

This is out of UBI/UBIFS scope. MTD driver may do this, if it is in
debug mode, of if you are ok with spending time for reading.

>  Now an interesting thing
> is that I have proven with my 4K page MLC flashes that _other_ blocks can have their ECCs 
> corrupted when this collision occurs - though this might be a local hardware issue. That 
> took a while to debug in case anyone is having similar problems.

Wow, this is really nasty :-)

> >       * At some point UBIFS is trying to read from these 
> > pages, and gets
> >         and an ECC error (-EBADMSG = -74).
> > 
> > In fewer words, ubiformat makes sure that every NAND page is written
> > once and only once after the erasure. If you use nandwrite, some pages
> > are written twice - once by nandwrite, and once by UBIFS.
> 
> This may be all the more reason to leave a runtime check in on the oob being all FF
> for a while on all FF data.

Again, this is out of UBI/UBIFS scope. At this level we do not care
about ECC at all. This may be done in MTD level, and event not always. I
believe there are controllers which will not even let you read the ECC.

>  Good defensive programming to not assume anything about 
> what happened earlier with previous flash operations.

To be fast we should assume something. We cannot read after each write,
unless we are in debugging mode. Also, MTD already does have the "write
verify" option, so this defensive thing exists, actually.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
