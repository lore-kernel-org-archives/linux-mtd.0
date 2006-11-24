Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GnXpe-0006XU-Vw
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 04:59:01 -0500
Date: Fri, 24 Nov 2006 10:57:02 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: mtd_debug usage
In-Reply-To: <79ac09b60611220926p6b8439a4l62c6037b0d6f67d1@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0611241016200.18210@lnxricardw.se.axis.com>
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
	<Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
	<79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
	<Pine.LNX.4.64.0611221544030.18210@lnxricardw.se.axis.com>
	<1164207791.19298.15.camel@sauron>
	<79ac09b60611220926p6b8439a4l62c6037b0d6f67d1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 22 Nov 2006, Duke wrote:

> However, What does the following mean?
>
> #mtd_debug write /dev/mtd2 0x0 0x600000 testfs_cramfs
> file_to_flash: fread, size 0x600000, n 0x600000
> fread(): Success
>
> Does that mean it will write to mtd2 which starts at physical address
> 0x200000 (to 0x800000) or does it actually start at physical address
> 0x0?
> what does the n means?
> I'm not writing to flash correctly so maybe I'm missing something.

Your mtd2 partition starts at physical 0x200000, which means that when=20
writing to offset 0 of that partition, you write to physical address=20
0x200000.

The output from mtd_debug is not terribly lucid. It is after all more of a=
=20
debugging tool. When it says 'file_to_flash:...' it means it didn't think=
=20
the file was read properly. How big is your file (testfs_cramfs)? If you=20
specify a size of 0x600000 then mtd_debug write will try to read 0x600000=
=20
bytes from the file, and fail like it does above if it cannot find it all.=
=20
The 'fread(): Success' line indicates that the read actually went well,=20
but bumped into an end-of-file before all data could be read.

I would suggest using the flash_eraseall tool to first erase the=20
partition, e.g. flash_eraseall /dev/mtd2, followed by a simple cat or dd=20
of the image file to the device, e.g. cat testfs_cramfs > /dev/mtd2 .

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
