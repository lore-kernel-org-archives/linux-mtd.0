Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNG6z-0007g0-Pq
 for linux-mtd@lists.infradead.org; Sat, 31 Dec 2016 09:38:03 +0000
Date: Sat, 31 Dec 2016 10:37:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH RFC 2/2] ubi: add support for UBI_EC_FLAG_ERASE_FROM_HERE
Message-ID: <20161231103724.21919e44@bbrezillon>
In-Reply-To: <9b0bfe28-8d77-e59e-977a-5837002356b1@nod.at>
References: <20161230171151.13448-1-zajec5@gmail.com>
 <20161230171151.13448-2-zajec5@gmail.com>
 <9b0bfe28-8d77-e59e-977a-5837002356b1@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Dec 2016 21:47:06 +0100
Richard Weinberger <richard@nod.at> wrote:

> Rafa=C5=82,
>=20
> On 30.12.2016 18:11, Rafa=C5=82 Mi=C5=82ecki wrote:
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > This flag can be used to mark block that should start erasing process
> > (including that block itself).
> > This can be useful for devices that don't support UBI natively (in a
> > bootloader or original firmware). In such cases we need to flash
> > ubinized image which is usually created with autoresize flag. In such
> > cases only few blocks of the whole ubi partition are programmed and the
> > rest of them should be formatted when attaching.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > ---
> > Hi,
> >=20
> > This patch is my attempt of getting upstream solution of problem we were
> > solving locally in OpenWrt/LEDE projects.
> >=20
> > There are a lot of home routers with original firmware and bootloaders
> > not supporting UBI in any way. This is where we use ubinize tool to
> > prepare images with UBI. Unfortunately flashing such an image to the
> > firmware partition writes only few blocks (as many as were created by
> > ubinize). We need some way of formatting remainig blocks of the firmware
> > (ubi) partition.
> >=20
> > This is RFC and I'd really like to hear your comments.
> >=20
> > First of all using a global erase_all_next_pebs is a pretty bad idea. I
> > mean to store this information in struct ubi_attach_info but there goes
> > my question:
> > 1) Should I pass "struct ubi_attach_info" to the ubi_io_read_ec_hdr to
> >    let this function set some interfnal flah that all next blocks should
> >    be erased?
> > OR
> > 2) Should I introduce UBI_IO_ERASE (or similar) and add support for this
> >    new "error" in the scan_peb?
> >=20
> > Second question: I wasn't sure what's the better solution:
> > 1) Create empty block with UBI_EC_FLAG_ERASE_FROM_HERE
> > OR
> > 2) Set UBI_EC_FLAG_ERASE_BEYOND in the last block
> >=20
> > Third question: what impact this change can have? I'm pretty sure I'll
> > need to adjust ubiformat tool. We don't want to format ubi with writing
> > image at the same time, just to trigger erasing blocks on the next
> > attach attempt. I guess ubiformat shouldn't copy/write this flag when
> > writing an image (--flash-image=3D<file> option). What else should I
> > consider? =20
>=20
> As discussed on IRC, I'm not fond of this patches.
>=20
> To summarize, your target devices have "bad" bootloaders pre-installed.
> You cannot change nor fix them. If you ask such a bootloader to flash
> the UBI image to the MTD partition it will erase and program only as
> much blocks as the image allokates and the remaining blocks on the MTD
> partition stay untouched.
> Later an ubiattach will fail since UBI wants to see either valid headers
> or all 0xff bytes but it finds old data since the bootloader did not erase
> all blocks.
> This patches implement an "EOF marker" to teach UBI about the last valid
> block and let UBI do the erase.
>=20
> Do these bootloaders really don't offer a command to erase the whole MTD
> partition? If they offer a flash command I'd expect an erase command too.
>=20
> I recommend using an initramfs. In the initramfs you can do all the clean=
-up
> your bootloader misses. Using flash_erase you can do the erase yourself,
> load the ubi module, run ubiattach, mount ubifs and hand-over to the regu=
lar
> userspace.
>=20
> Brian, Boris, Artem, what do you think?
> I'd like to keep UBI free from such workarounds if it can be addressed
> in another way.

I haven't been through the IRC discussion yet, but I agree with what
you say here: we should avoid adding new hacks in UBI if it's not
proven to be necessary. This is not the first time we see OpenWRT/LEDE
developers trying to address things directly in the kernel while it
could be properly addressed from userspace using existing tools or
developing custom ones.
I hear your argument that some platforms have old/buggy bootloaders
which don't support (or badly support) some features, but putting ugly
workarounds in the kernel code does not sound like the right solution
to me.

Richard's suggestion sounds good. You can also add a second
stage bootloader (kexec based?) to make sure that you have the
necessary tools to format the ubi image, but that's probably more
invasive and requires extra space.

Regards,

Boris
