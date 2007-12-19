Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4trF-0007qO-17
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 08:00:55 +0000
Date: Wed, 19 Dec 2007 09:00:12 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ramesh <sramesh23@gmail.com>
Subject: Re: JFFS2 errors - are these normal?
In-Reply-To: <3adeeb410712180743o77233e51pcb544e3c4b286712@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0712190858010.21948@lnxricardw.se.axis.com>
References: <3adeeb410712180743o77233e51pcb544e3c4b286712@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 18 Dec 2007, Ramesh wrote:

> Hi,
>
> I am using linux 2.6.19 and ST micro NAND chip (256M) on a PowerPC
> platform. After booting the OS, we install firmware on to the flash.
> These firmware images are RPM packages. Once some packages are
> installed, we start getting some ECC errors. I guess that's fine but
> after a few more RPM installs, the errors seem more serious. Here's a
> sample:

You shouldn't be getting ECC errors that quickly, on a chip like that I=20
would expect it would take many months before you'd see an ECC error if=20
ever.

My guess without knowing more would be that there is a hardware problem=20
causing the communication with the nand chip to fail ever so often.

> The jffs2 image is created with the following flags: -e 0x20000 -s
> 0x1000 -b -v -p -n
> Then I use sumtool with -e 0x20000 -b -p.

If the device mounts properly then there shouldn't be much wrong with the=
=20
image.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
