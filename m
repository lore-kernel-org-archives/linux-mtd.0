Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXoXI-0007nE-Vg
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 03:48:37 +0000
Received: by gxk19 with SMTP id 19so5538620gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 02 Aug 2009 20:48:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A759CF3.2010908@vtxmail.ch>
References: <4A759CF3.2010908@vtxmail.ch>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 2 Aug 2009 23:48:11 -0400
Message-ID: <8bd0f97a0908022048u13b97278s2a1b05a8b1cc4fe8@mail.gmail.com>
Subject: Re: patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
	interpreted
To: Daniel Neukomm <Neukomm@vtxmail.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 2, 2009 at 10:04, Daniel Neukomm wrote:
> patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
> interpreted
>
> with the device table one can add /dev entries to the root file system
> image.
> The device table file contains among others the fields minor, start,
> increment and count.
> If there is an entry with minor=3D0 start=3D0 increment =3D32 and count=
=3D4 the
> mkfs.ubifs makes
> 128 device entries, with minor numbers from 0 to 127
> The correct version makes 4 entries with minor number 0,32,64,96.
>
> /dev/mtd c 640 0 0 90 0 0 =C2=A02 7
> This gives 14 devices /dev/mtdXX instead of =C2=A07 devices.
> Due to this error mtd_debug info /dev/mtd3 delivers the information of
> /dev/mtd1 instead of.
> diff --git a/mkfs.ubifs/devtable.c b/mkfs.ubifs/devtable.c
> index 236a6e7..e2d96dc 100644

all patches should include signed-off-by tags.  please read the
Documentation/SubmittingPatches file in the linux kernel source code
for some guidelines.
-mike
