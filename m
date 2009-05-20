Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6uoH-0002vB-Ij
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 23:02:59 +0000
Received: by yx-out-1718.google.com with SMTP id 6so439576yxn.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 May 2009 16:02:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0905200859090.26634@lnxricardw.se.axis.com>
References: <66b2b2310905191355h1b99caaasd4636e4e9efc9aec@mail.gmail.com>
	<Pine.LNX.4.64.0905200859090.26634@lnxricardw.se.axis.com>
Date: Wed, 20 May 2009 16:02:51 -0700
Message-ID: <66b2b2310905201602x35509fbend714446cd6e08dbb@mail.gmail.com>
Subject: Re: Nand driver acts different in two different settings
From: John Tobias <jtobias@viaas.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removing -j doesn't make any difference.

-john

On Wed, May 20, 2009 at 12:00 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Tue, 19 May 2009, John Tobias wrote:
>
>> I have tested two scenarios for writing/reading a data on my nand flash
>> and it act's differently the nand driver on DM6446. ...
>
>> I erased the said partition using flash_eraseall -j /dev/mtdblock11, wri=
te
>> the .jffs2 image on flash using nandwrite. Then, I reboot my board to bo=
ot
>> on nand. The first boot, I didn't get any errors/warnings. But, after th=
e
>> 2nd reboot, I got the following errors:
>
> Odd that you don't get errors the first time you boot.
>
> I really don't know, but I would try omitting -j to flash_eraseall and se=
e
> if it makes a difference.
>
> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0www.axis.com
> Phone +46 46 272 2016 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fax +46 46 13 61 30
>
