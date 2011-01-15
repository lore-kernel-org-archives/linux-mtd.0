Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pe9VJ-0005oB-IW
	for linux-mtd@lists.infradead.org; Sat, 15 Jan 2011 17:01:31 +0000
Received: by qyk27 with SMTP id 27so4600838qyk.15
	for <linux-mtd@lists.infradead.org>;
	Sat, 15 Jan 2011 09:01:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201011091058.04193.pieterg@gmx.com>
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
	<201011082318.21748.pieterg@gmx.com>
	<AANLkTikJrAaR-Fh-yS+jDyTdPFeGAU16fW1R08dW3DBt@mail.gmail.com>
	<201011091058.04193.pieterg@gmx.com>
Date: Sat, 15 Jan 2011 18:01:25 +0100
Message-ID: <AANLkTikntVsFUe_dBswQrN9E9bav-c_q=GgEwRsG2kPb@mail.gmail.com>
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

Hi,

Seems I forgot to send this mail. Better late than never?

2010/11/9 pieterg <pieterg@gmx.com>:
> On Tuesday, November 09, 2010 10:15:40 Bj=C3=B8rn Forsman wrote:
>> I've tried nandwrite with or without the --pad option. Is that the
>> padding you are referring to? Or is it the --blockalign option? How
>> exactly did you flash your rootfs?
>
> nandwrite -p pads to pagesize, which is ok.
> But I was using a --pad=3D0x800 (=3Dpagesize) option for mkfs.jffs2 inste=
ad,
> which somehow resulted in eraseblock padding.
>
>> Thanks for the info. Note that I've had *zero* trouble with ubifs when
>> it's flashed with ubiformat and ubiupdatevol. I did some more googling
>> and found some other threads about the "ubiformat + ubiupdatevol works
>> but not direct UBI image flashing" issue. I'll take a closer look.
>
> Interesting. In that case I might give that a try as well, as jffs2 is st=
ill
> far from perfect, even with correct pagesize padding.
>
> I've added a single bit debug message in the nand driver by the way,
> which shows a lot of lucky escapes, before the first double bit error
> eventually occurs. Which seems inevitable, as the driver takes
> no action (such as refreshing a page) when single bit errors occur.

Turns out that the errors I got when using jffs2 was because
of a bug in mkfs.jffs2. I was testing jffs2 with an image generated
by Buildroot, and Buildroot was using a mkfs.jffs2 affected by this bug
until mid october (I hadn't updated my tree in
a while). mkfs.jffs2 on my build host (Ubuntu 10.04) is not affected.

So now jffs2 is working great:

flash_eraseall /dev/mtd7
nandwrite -p /dev/mtd7 /rootfs.jffs2
mount -t jffs2 /dev/mtdblock7 /mnt

UBIFS with ubiupdatevol is working great:

ubiformat /dev/mtd8
ubiattach -m 8
ubimkvol /dev/ubi0 -N rootfs -m
ubiupdatevol /dev/ubi0_0 /rootfs.ubifs

However, UBI images are broken after mounting them once in
read-write mode if they were flashed with either 'nandwrite' or
U-Boot 'nand write'. Mounting read-only always works.

I'd like to know how UBI images is supposed to be flashed.
By searching the internet I've seen people saying that it is
impossible to write UBI images with nandwrite and others say
it *is* possible. By looking at
http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
it may appear that flashing UBI images requires an UBI aware flasher?
But isn't the whole point of having ubinize so that you can take UBIFS
images and wrap them into something that non UBIFS aware flashers can handl=
e?

What am I missing?

Best regards,
Bj=C3=B8rn Forsman
