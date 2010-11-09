Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFkIp-0001vU-3n
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 09:15:53 +0000
Received: by wyf22 with SMTP id 22so6501688wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 01:15:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201011082318.21748.pieterg@gmx.com>
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
	<201011082318.21748.pieterg@gmx.com>
Date: Tue, 9 Nov 2010 10:15:40 +0100
Message-ID: <AANLkTikJrAaR-Fh-yS+jDyTdPFeGAU16fW1R08dW3DBt@mail.gmail.com>
Subject: Re: [Openpxa-users] PXA310: double bit errors on NAND
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: pieterg <pieterg@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, openpxa-users@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pieter,

Thanks for your reply. It's nice to know someone is out there :-)

2010/11/8 pieterg <pieterg@gmx.com>:
> On Monday, November 08, 2010 15:54:43 Bj=C3=B8rn Forsman wrote:
>> I get "double bit error @ page" messages while working with NAND on a
>> Colibri PXA310 module. Basically, when I write an UBI image to NAND,
>> either with U-Boot "nand write" or "nandwrite" from mtd-utils,
>> everything is OK on the *first* mount. But on the second mount I get
>> several "double bit error @ page" messages and mount fails.
>
> You are not erase-block padding your image, when you write it?
> That's the mistake I made (with jffs2 in my case), in that openpxa-users
> thread you mention.
> As soon as I found out my image was eraseblock padded, and fixed that,
> the number of single/double bit errors was reduced dramatically,
> but some errors remained.

I've tried nandwrite with or without the --pad option. Is that the
padding you are referring to? Or is it the --blockalign option? How
exactly did you flash your rootfs?

> I haven't yet had the time to further investigate this, my preliminary
> conclusion is that the Samsung K9K's, though advertised as SLC,
> are very poor quality, and they probably need a better ecc than
> Hamming (as the pxa nand controller implements).
> And also that jffs2 seems to care less than ubi(fs) when double bit error=
s
> do happen.(ubifs often refused to even mount when biterrors occurred,
> jffs2 so far always continued with what remained)
> That's the reason why I'm using jffs2 for the time being, a non-booting
> device is worse than a device with a corrupted file.
> (from a theoretical point of view however both are equally bad of course,
> this issue does need to be resolved)

Thanks for the info. Note that I've had *zero* trouble with ubifs when
it's flashed with ubiformat and ubiupdatevol. I did some more googling
and found some other threads about the "ubiformat + ubiupdatevol works
but not direct UBI image flashing" issue. I'll take a closer look.

Best regards,
Bj=C3=B8rn Forsman
