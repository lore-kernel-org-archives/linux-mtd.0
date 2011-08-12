Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qs0tV-0001mC-VU
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 23:12:02 +0000
Received: by wyh11 with SMTP id 11so3046000wyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Aug 2011 16:11:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6050753@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6050753@ex-mb1.corp.adtran.com>
Date: Fri, 12 Aug 2011 16:11:58 -0700
Message-ID: <CAN8TOE-mQghX8tHkWQJgYWfbWPWmv3d9OemSxD04xTYeFgjagA@mail.gmail.com>
Subject: Re: MT29F1G08ABADAWP Supported?
From: Brian Norris <computersforpeace@gmail.com>
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 12, 2011 at 12:56 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wr=
ote:
> We have chosen to update from a very old NAND flash to MT29F1G08ABADAWP.
>
> This is a replacement part with internal ECC. =A0I remember someone askin=
g
> the list about whether this device is supported in the current kernel.
>
> Could someone help me refresh my memory and let me know whether this
> device should work with the current mtd drivers?

According to the data sheet, your driver would need to implement the
following for its read commands:

"When internal ECC is enabled, the READ STATUS (70h) command is
required after the
completion of the data transfer (tR_ECC) to determine whether an
uncorrectable read
error occured. (tR_ECC is the data transferred with internal ECC enabled.)"

I doubt that most (any?) of the in-kernel drivers do this currently.
But just in case, which driver are you using?

Also, it looks like this chip can come with internal ECC enable or
disabled, and this configuration is allegedly reflected in its chip ID
string. Don't know if this is configurable, but if so, then you could
disable internal ECC and use it with the current drivers.

For reference, you can check out the NAND support table here:
http://www.linux-mtd.infradead.org/nand-data/nanddata.html

Some of the info is, admittedly, difficult to read for anybody but the
author :) Perhaps I'll fix it up some and include information about
internal ECC (since I overlooked that feature).

BTW, I couldn't find whatever previous request you are referring to. I
don't see MT29F1G08ABADAWP mentioned in the MTD archives.

Brian
