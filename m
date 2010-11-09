Received: from smtp-1.concepts.nl ([2001:838:2:1::30:124])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PFkxy-0006ib-Df
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 09:58:15 +0000
From: pieterg <pieterg@gmx.com>
To: =?utf-8?q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Subject: Re: [Openpxa-users] PXA310: double bit errors on NAND
Date: Tue, 9 Nov 2010 10:58:03 +0100
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
	<201011082318.21748.pieterg@gmx.com>
	<AANLkTikJrAaR-Fh-yS+jDyTdPFeGAU16fW1R08dW3DBt@mail.gmail.com>
In-Reply-To: <AANLkTikJrAaR-Fh-yS+jDyTdPFeGAU16fW1R08dW3DBt@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201011091058.04193.pieterg@gmx.com>
Cc: linux-mtd@lists.infradead.org, openpxa-users@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, November 09, 2010 10:15:40 Bj=C3=B8rn Forsman wrote:
> I've tried nandwrite with or without the --pad option. Is that the
> padding you are referring to? Or is it the --blockalign option? How
> exactly did you flash your rootfs?

nandwrite -p pads to pagesize, which is ok.
But I was using a --pad=3D0x800 (=3Dpagesize) option for mkfs.jffs2 instead=
,=20
which somehow resulted in eraseblock padding.

> Thanks for the info. Note that I've had *zero* trouble with ubifs when
> it's flashed with ubiformat and ubiupdatevol. I did some more googling
> and found some other threads about the "ubiformat + ubiupdatevol works
> but not direct UBI image flashing" issue. I'll take a closer look.

Interesting. In that case I might give that a try as well, as jffs2 is still
far from perfect, even with correct pagesize padding.

I've added a single bit debug message in the nand driver by the way,
which shows a lot of lucky escapes, before the first double bit error
eventually occurs. Which seems inevitable, as the driver takes
no action (such as refreshing a page) when single bit errors occur.

Rgds, Pieter
