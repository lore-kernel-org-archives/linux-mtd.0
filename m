Received: from relmlor3.renesas.com ([210.160.252.173]
 helo=relmlie2.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dLZ4f-0003i6-Pr
 for linux-mtd@lists.infradead.org; Thu, 15 Jun 2017 18:00:56 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Nicolas Pitre <nico@linaro.org>
CC: linux-mtd <linux-mtd@lists.infradead.org>
Subject: RE: Does XIP_MTD really exist?
Date: Thu, 15 Jun 2017 18:00:23 +0000
Message-ID: <SG2PR06MB1165D2F9B807BB92749D09C18AC00@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB11657F2D01E82DBA288C16948AC00@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1706151220060.29475@knanqh.ubzr>
In-Reply-To: <alpine.LFD.2.20.1706151220060.29475@knanqh.ubzr>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Nicolas,

(I was wondering if you watched this mailing list)

On Thursday, June 15, 2017 1, Nicolas Pitre wrote:
> > Also, I don't really see of any mainline filesystem driver that would
> > make use of it.
>=20
> Upon a time, the cramfs filesystem had the ability to flag some files
> that would not be compressed, aligned to a page boundary, and be mapped
> directly out of flash. I might have to revive that functionality in the
> near future if no longer available.

Yes, I think that was the only XIP file system left when I was looking 2
years ago. But I remember something about the method for marking the=20
files for XIP was a bit of a hack, and maybe was broken??? After I decided
on AXFS (and forward ported it to the 3.14 kernel), I never went back=20
and tried cramfs-XIP.

> > The NO_MMU + XIP_KERNEL people must be using something for a file
> > system....I'm just not sure what that is.
>=20
> So far I've seen initramfs packaged with the kernel.

Oh, initramfs. That would explain it. Funny!


> The kernel is XIP
> but user space ends up living in RAM forever.

Hmm, that seems like a waste. Some big bloated open source packages use=20
up lots of code pages that would be much better served XIP from ROM=20
space. Qt comes to mind.

Anyway way, thank you for the info.
I might have another look at cramfs, but still end up forward porting=20
AXFS to 4.x.

Thank you,
Chris
