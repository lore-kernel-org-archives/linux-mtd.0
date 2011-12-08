Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYY9i-00089E-DI
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 07:12:35 +0000
Date: Thu, 8 Dec 2011 08:12:29 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: yoav feldman <yoavfeld@gmail.com>
Subject: Re: A question about ubiformat and and some flash utils.
In-Reply-To: <CAK-xBPKEwVN743EV1HC3BaKQ3PUsF6rCwiF4Pq4WP8_3c9m_Sw@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1112080810030.6561@lnxricardw.se.axis.com>
References: <CAK-xBPKEwVN743EV1HC3BaKQ3PUsF6rCwiF4Pq4WP8_3c9m_Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 7 Dec 2011, yoav feldman wrote:

> Hello,
>
> i just picked up in google a messaging about flashing ubi images.
> i have also problem with the erase speed,  and i wonder if u can
> answer about some qustion that i have.
> i found there this peregraph:
>
> "OK. But did you consider to pre-create the image with ubinize and
> mkfs.ubifs tools and just flash the raw image in production? This is the
> fastest possible way."
>
> This is the method that i'm trying to use, but things going too slow:
> 1. ubiformat is taking too much time (about 5-10 min).
> 2. for burning linux kernel image, i'm using flash_eraseall and
> flashcp. the flash_eraseall also takes long time.
>
> Do you know what can i to decrease the erase time?
> its important for me to erase the whole flash when i'm updating the softw=
are.

What type of flash are you using (NOR vs. NAND) and how big is your image?=
=20
NOR flashes are slow to erase and program, from what I recall they can be=
=20
in the order of 15 to 30 seconds per megabyte for an erase/program cycle.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
