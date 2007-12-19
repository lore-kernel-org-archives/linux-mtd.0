Received: from mu-out-0910.google.com ([209.85.134.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J50lM-00033L-3k
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 15:23:18 +0000
Received: by mu-out-0910.google.com with SMTP id w8so331433mue.1
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Dec 2007 07:23:10 -0800 (PST)
Message-ID: <3adeeb410712190723n4cd517c2o8ad5c52d610bb41b@mail.gmail.com>
Date: Wed, 19 Dec 2007 09:23:10 -0600
From: Ramesh <sramesh23@gmail.com>
To: "Patrick Agrain" <patrick.agrain@alcatel-lucent.fr>
Subject: Re: JFFS2 errors - are these normal?
In-Reply-To: <4768E0A0.5080700@alcatel-lucent.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <3adeeb410712180743o77233e51pcb544e3c4b286712@mail.gmail.com>
	<Pine.LNX.4.64.0712190858010.21948@lnxricardw.se.axis.com>
	<4768E0A0.5080700@alcatel-lucent.fr>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/19/07, Patrick Agrain <patrick.agrain@alcatel-lucent.fr> wrote:
> Hi Ramesh ,
>
> What Flash from ST have you tested ? Is it a 256MBytes ? Large Pages
> (2048 bytes) ?
> What is the marking on the chip ?
>
> Thanks in advance.
> Regards,
>
> Patrick Agrain

Hi Patrick,

The driver reports the following:
NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256
MiB 3.3V 8-bit)
The page size is 2k and erasesize is 0x20000.

--Ramesh

> > On Tue, 18 Dec 2007, Ramesh wrote:
> >
> >> Hi,
> >>
> >> I am using linux 2.6.19 and ST micro NAND chip (256M) on a PowerPC
> >> platform. After booting the OS, we install firmware on to the flash.
> >> These firmware images are RPM packages. Once some packages are
> >> installed, we start getting some ECC errors. I guess that's fine but
> >> after a few more RPM installs, the errors seem more serious. Here's a
> >> sample:
> >
> > You shouldn't be getting ECC errors that quickly, on a chip like that I
> > would expect it would take many months before you'd see an ECC error if
> > ever.
> >
> > My guess without knowing more would be that there is a hardware problem
> > causing the communication with the nand chip to fail ever so often.
> >
> >> The jffs2 image is created with the following flags: -e 0x20000 -s
> >> 0x1000 -b -v -p -n
> >> Then I use sumtool with -e 0x20000 -b -p.
> >
> > If the device mounts properly then there shouldn't be much wrong with t=
he
> > image.
> >
> > /Ricard
> > --
> > Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> > Axis Communications AB, Lund, Sweden            www.axis.com
> > Phone +46 46 272 2016                           Fax +46 46 13 61 30
