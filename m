Received: from co202.xi-lite.net ([149.6.83.202])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN3FW-0005YZ-PW
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 12:54:32 +0000
Message-ID: <4CF3A23E.5090704@parrot.com>
Date: Mon, 29 Nov 2010 13:53:18 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: simple ubi reader
References: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
	<1290968019.2032.25.camel@koala>
In-Reply-To: <1290968019.2032.25.camel@koala>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Vladimir Khmelnitsky <vladimir@broadlight.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Artem Bityutskiy a écrit :
> On Sun, 2010-11-28 at 11:27 +0200, Vladimir Khmelnitsky wrote:
>> Hi,
>>
>> I need to write bootloader which should read its second stage binary
>> from ubi volume.
>> I wonder if there is some simple open source code I can use to implement
>> ubi volume reader?
> 
> I know people doing small bootloader code (closed source) with 4KiB
> constraint for whole code, and it supported UBI R/O. That was clever
> code made by clever people though. But here are some points:
> 
> 1. You do not have to read EC headers when scanning
> 2. You do not really need to read the volume table
> 3. If you can assume you need only one volume, say, with vol ID 0, this
> simplifies things further.
> 
> Also, AFAIR, some people found that placing VID header at the very end
> of the NAND page made ECC calculations easier and faster. This is
> actually why UBI has 'vid_hdr_offs' option which is not widely used,
> though.
> 
> Anyway, this is the original old design document, which may contain some
> hints, but I'm not sure:
> 
> http://linux-mtd.infradead.org/doc/ubidesign/ubidesign.pdf
> 
> The doc is not up-to-date, but all the design principles are valid.
> 
We also develop one ubi reader (only static volumes), but it is not open 
source at the moment.
We mainly used drivers/mtd/ubi/ubi-media.h as documentation.

It is quite easy to write one, but there are tricky stuff to handle like 
selecting the correct peb for a logical block (copy flags, sqnum, ...).

EC header can be useful to parse if the size of the ubi partition can 
change (use of image_seq to determine the end of boot partition).

Matthieu
