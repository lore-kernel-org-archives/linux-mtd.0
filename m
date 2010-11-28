Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMlkx-0007Bb-0q
	for linux-mtd@lists.infradead.org; Sun, 28 Nov 2010 18:13:47 +0000
Received: by fxm16 with SMTP id 16so2146404fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Nov 2010 10:13:45 -0800 (PST)
Subject: Re: simple ubi reader
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vladimir Khmelnitsky <vladimir@broadlight.com>
In-Reply-To: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
References: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 28 Nov 2010 20:13:39 +0200
Message-ID: <1290968019.2032.25.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-11-28 at 11:27 +0200, Vladimir Khmelnitsky wrote:
> Hi,
> 
> I need to write bootloader which should read its second stage binary
> from ubi volume.
> I wonder if there is some simple open source code I can use to implement
> ubi volume reader?

I know people doing small bootloader code (closed source) with 4KiB
constraint for whole code, and it supported UBI R/O. That was clever
code made by clever people though. But here are some points:

1. You do not have to read EC headers when scanning
2. You do not really need to read the volume table
3. If you can assume you need only one volume, say, with vol ID 0, this
simplifies things further.

Also, AFAIR, some people found that placing VID header at the very end
of the NAND page made ECC calculations easier and faster. This is
actually why UBI has 'vid_hdr_offs' option which is not widely used,
though.

Anyway, this is the original old design document, which may contain some
hints, but I'm not sure:

http://linux-mtd.infradead.org/doc/ubidesign/ubidesign.pdf

The doc is not up-to-date, but all the design principles are valid.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
