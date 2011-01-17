Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PenFV-0003ON-1s
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2011 11:27:49 +0000
Received: by qwj9 with SMTP id 9so4578217qwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jan 2011 03:27:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1101162245300.7434@lnxricardw.se.axis.com>
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
	<201011082318.21748.pieterg@gmx.com>
	<AANLkTikJrAaR-Fh-yS+jDyTdPFeGAU16fW1R08dW3DBt@mail.gmail.com>
	<201011091058.04193.pieterg@gmx.com>
	<AANLkTikntVsFUe_dBswQrN9E9bav-c_q=GgEwRsG2kPb@mail.gmail.com>
	<Pine.LNX.4.64.1101162245300.7434@lnxricardw.se.axis.com>
Date: Mon, 17 Jan 2011 12:27:47 +0100
Message-ID: <AANLkTi=vCXr5Y3-PS=nhaK0UwWDW2uCEM23u0V9b7tO5@mail.gmail.com>
Subject: Re: [Openpxa-users] PXA310: double bit errors on NAND
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

2011/1/16 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> On Sat, 15 Jan 2011, Bj=C3=B8rn Forsman wrote:
>
>> I'd like to know how UBI images is supposed to be flashed.
>> By searching the internet I've seen people saying that it is
>> impossible to write UBI images with nandwrite and others say
>> it *is* possible. By looking at
>> http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
>> it may appear that flashing UBI images requires an UBI aware flasher?
>> But isn't the whole point of having ubinize so that you can take UBIFS
>> images and wrap them into something that non UBIFS aware flashers can
>> handle?
>
> I think there are two separate issues here:
>
> 1. When reflashing a flash with a new image you'll want to preserve the U=
BI
> erase counters, hence a UBI-aware flasher (e.g. ubiformat) is required. Y=
ou
> can use nandwrite, but then the erase counter information is lost.

Yes, this is for production so I don't care that much about erase counters.

> 2. When flashing a virgin flash there are no erase counters to be preserv=
ed,
> so nandwrite will suffice. However, there appears to be an old 'bug' in
> nandwrite whereby all-ff pages in the source image are nevertheless writt=
en
> to the flash. All-ff pages are assumed erased by UBI, and so are never
> re-erased before subsequent usage. The problem is that some flash chips d=
o
> not take lightly to being rewritten multiple times without an intermediat=
e
> erase. So it's really an old bug in nandwrite, but it might not have
> manifested itself until heavy testing with UBI had been performed. There'=
s
> more information on this in the FAQ I believe.

Interesting. Thanks!

It would be nice if someone could take a look at this 'bug' in nandwrite :-=
)

Best regards,
Bj=C3=B8rn Forsman
