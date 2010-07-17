Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZwz7-0000EN-09
	for linux-mtd@lists.infradead.org; Sat, 17 Jul 2010 02:18:37 +0000
Received: by gxk27 with SMTP id 27so1966231gxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jul 2010 19:18:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <D0271AF888369C4C85548462366DB24B3F524EF2@US2K7EXMBPF1.spansion.com>
References: <D0271AF888369C4C85548462366DB24B3F524EF2@US2K7EXMBPF1.spansion.com>
Date: Fri, 16 Jul 2010 19:18:35 -0700
Message-ID: <AANLkTimqyn8KAvlcj5zbLU4OwOQOri02O9CXjbHF27h2@mail.gmail.com>
Subject: Re: Spansion SPI parts
From: Kevin Cernekee <cernekee@gmail.com>
To: "Hoyler, Gernot" <Gernot.Hoyler@spansion.com>
Content-Type: text/plain; charset=UTF-8
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

On Fri, Jul 16, 2010 at 7:08 AM, Hoyler, Gernot
<Gernot.Hoyler@spansion.com> wrote:
> Can we fix the Spansion SPI flash device names in drivers/mtd/devices/m25=
p80.c?

> + =C2=A0 =C2=A0 =C2=A0 { "s25fl128p0", INFO(0x012018, 0x0300, 256 * 1024,=
 =C2=A064, 0) },
> + =C2=A0 =C2=A0 =C2=A0 { "s25fl128p1", INFO(0x012018, 0x0301, =C2=A064 * =
1024, 256, 0) },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1=
024, =C2=A064, 0) },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ "s25fl129p1", INFO(0x012018, 0x4d01, =C2=A06=
4 * 1024, 256, 0) },

After rereading the datasheets I suspect that I used incorrect
suffixes for the s25fl129* devices.  Would you mind reviewing these 4
entries to ensure that they line up with each chip's markings?

Thanks.
