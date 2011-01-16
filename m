Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeaXU-0000aj-86
	for linux-mtd@lists.infradead.org; Sun, 16 Jan 2011 21:53:33 +0000
Date: Sun, 16 Jan 2011 22:53:28 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?QmrDuHJuIEZvcnNtYW4=?= <bjorn.forsman@gmail.com>
Subject: Re: [Openpxa-users] PXA310: double bit errors on NAND
In-Reply-To: <AANLkTikntVsFUe_dBswQrN9E9bav-c_q=GgEwRsG2kPb@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1101162245300.7434@lnxricardw.se.axis.com>
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
	<201011082318.21748.pieterg@gmx.com>
	<AANLkTikJrAaR-Fh-yS+jDyTdPFeGAU16fW1R08dW3DBt@mail.gmail.com>
	<201011091058.04193.pieterg@gmx.com>
	<AANLkTikntVsFUe_dBswQrN9E9bav-c_q=GgEwRsG2kPb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	pieterg <pieterg@gmx.com>, "openpxa-users@lists.sourceforge.net"
	<openpxa-users@lists.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 15 Jan 2011, Bj=F8rn Forsman wrote:

> I'd like to know how UBI images is supposed to be flashed.
> By searching the internet I've seen people saying that it is
> impossible to write UBI images with nandwrite and others say
> it *is* possible. By looking at
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
> it may appear that flashing UBI images requires an UBI aware flasher?
> But isn't the whole point of having ubinize so that you can take UBIFS
> images and wrap them into something that non UBIFS aware flashers can han=
dle?

I think there are two separate issues here:

1. When reflashing a flash with a new image you'll want to preserve the=20
UBI erase counters, hence a UBI-aware flasher (e.g. ubiformat) is=20
required. You can use nandwrite, but then the erase counter information is=
=20
lost.

2. When flashing a virgin flash there are no erase counters to be=20
preserved, so nandwrite will suffice. However, there appears to be an old=
=20
'bug' in nandwrite whereby all-ff pages in the source image are=20
nevertheless written to the flash. All-ff pages are assumed erased by UBI,=
=20
and so are never re-erased before subsequent usage. The problem is that=20
some flash chips do not take lightly to being rewritten multiple times=20
without an intermediate erase. So it's really an old bug in nandwrite, but=
=20
it might not have manifested itself until heavy testing with UBI had been=
=20
performed. There's more information on this in the FAQ I believe.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
