Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NamCH-0005WP-Ct
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 08:27:25 +0000
Received: by bwz4 with SMTP id 4so1633928bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 00:27:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100129081027.GA13915@blorp.plorb.com>
References: <20100129081027.GA13915@blorp.plorb.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 29 Jan 2010 13:56:59 +0530
Message-ID: <ce9ab5791001290026y37f6ba09i5a565d62a7716c1c@mail.gmail.com>
Subject: Re: NAND misreads on omap beagle and overo
To: Jeff DeFouw <jeffd@i2k.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I did not went through complete mail. Still, you may want to try this patch=
:
<http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commitdiff/dcb2469b=
dd3d12f760bae509f86b4069081a99c5>



On Fri, Jan 29, 2010 at 1:40 PM, Jeff DeFouw <jeffd@i2k.com> wrote:
> I'm getting occasional bad reads from NAND on a rev B7 Beagleboard and a
> Gumstix Overo Water. =A0Both use OMAP3530 with 16-bit 256MB NAND,
> omap-patched kernels from 2.6.31 to 2.6.32.6 (Ubuntu beagleboard kernel
> binaries and my own compiled from source), and software ECC.
>
> Sometimes a read request will read back the last written command byte
> several times before the page data. =A0The problem occurs with or without
> prefetch mode, and increasing chip_delay to 100 or 200 doesn't fix it.
> The chip is only supposed to need 25us anyway.
>
> If I prepare the flash with a pattern
> 00 01 02 03 ... fc fd fe ff ff fe fd fc ... 03 02 01 00
> and then read every page (full or partial), sometimes I will get
> e0 ff e0 ff e0 ff e0 ff ... e0 ff 00 01 02 03 ...
> or
> 30 ff 30 ff 30 ff 30 ff ... 30 ff 00 01 02 03 ...
>
> 0x30 and 0xE0 are probably the read and change-column commands echoing
> back for some reason. =A0This can cause uncorrectable ECC errors, so you
> can do a simple read of the mtd char device (no pattern necessary,
> erased flash will do) and run into the problem on the console if you're
> patient. =A0(while dd if=3D/dev/mtd4 of=3D/dev/null bs=3D2048; do sleep 1=
; done)
>
> I can usually get at least one bad read within 4 full 250MB partition
> reads at 512-bytes per read call (more commands that way). =A0For some
> reason some kernels, like the Ubuntu beagleboard 2.6.31.6-x6.0 binary,
> make this harder to reproduce. =A0If you flip enough (unrelated) settings
> in the build config, it will happen more often. =A0For example, removing
> the built-in (=3Dy) RT2800USB wireless driver from that kernel can someho=
w
> make the difference between seeing an error in a couple minutes and not
> seeing an error for over 10 minutes of continuous reading.
>
> I've tried adding some udelays, and adjusting timings in the OMAP GPMC
> and checking for incorrect config. =A0A long udelay in the read_buf
> function helped in one test, but also cut the transfer rate in half and
> may not have eliminated the problem.
>
> What event would cause the command byte to echo back anyway? =A0Is that a
> typical busy NAND response, or something the OMAP memory controller has
> to be doing?
>
> --
> Jeff DeFouw <jeffd@i2k.com>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



--=20
Regards,
Vimal Singh
