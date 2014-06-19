Received: from mail1.bemta7.messagelabs.com ([216.82.254.100])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxRuY-0003k7-2B
 for linux-mtd@lists.infradead.org; Thu, 19 Jun 2014 02:17:10 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "Voytovich, Mike" <mvoytovich@paypal.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Thu, 19 Jun 2014 12:16:41 +1000
Subject: RE: ubi_io_read -74 and ubifs_scanned_corruption errors with i.MX28
Message-ID: <EACD232272DA4849B060F0828564D13B0AA3DB90FB@ntcex01.corp.netcomm.com.au>
References: <CFC49DF0.A141%mvoytovich@paypal.com>
In-Reply-To: <CFC49DF0.A141%mvoytovich@paypal.com>
Content-Language: en-AU
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

On Tue, 17 Jun 2014 06:13:09 +1000
"Voytovich, Mike" <mvoytovich@paypal.com> wrote:

> Hi,
>=20
> We're seeing a failed device after running for a few weeks with
> various UBIFS errors, including "ubi_io_read: error -74",
> "ubifs_scan: corrupt empty space", "ubifs_scanned_corruption", etc
> (please see the kernel output below).  We're running Linux 3.10.0-rc7
> on a Freescale i.MX28 board with a Micron MT29F2G08ABAEA device.

-74 is -EBADMSG which essentially means "uncorrectable ECC errors"

> I tried running some of the mtd tests, and most of them pass, with the
> exception of mtd_oobtest and mtd_nandbiterrs (although reading the
> archives, it appears these failures may be due to an issue with the
> tests, and not necessarily related to the failure below).

Both oobtest and nandbiterrs use raw data writes which are not
available on the Freescale NAND drivers. It should be possible, however,
to change nandbiterrs to use normal writes instead.

>=20
> Note that we're NOT using ubiformat; but, we don't use nandwrite
> either (we flash_erase, then do an ubiattach + mount, then extract a
> root filesystem image onto the mounted filesystem).  So I'm not sure
> the "Why do I have to use ubiformat?" in the FAQ
> (http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat)
> applies in this case.

It does, not using ubiformat breaks the wear leveling mechanism.

UBI maintains block erase counters in each block and ensures that
the difference between those counters are below a threshold.

Ubiformat preserves the block erase counters and thus the real number
of erase cycles for the block. Your method drops the erase counters,
so you will wear out some blocks without allowing UBI to mitigate that.

> And, I'm not sure that it's an issue with sub-pages not being properly
> supported, as appending "--vid-hdr-offset 2048" to ubiattach results
> in the same failure.

If your subpage support was broken, you wouldn't have gotten that far.

> Any ideas regarding what might be going on here?  Perhaps we really do
> need to=20use ubiformat?  Or maybe the mtd_oobtest / mtd_nandbiterrs
> test failures are masking a real issue with the MTD and/or i.MX28
> gpmi nand drivers or configuration?

Oobtest is probably pointless here. I remember vaguely that the Freescale
NAND controller only implements a rather weird ECC layout where data,
ECC bits and bad block markers are interleaved within the page. It's the
reason raw access doesn't work.

Nandbiterrs could be modified to use ordinary writes though. Its job is
to test your ECC mechanism by generating temporary biterrors in flash.
It does this by repeatedly writing the same content into a page, breaking
the write only once / 4 times rule in most flashes.

> [   28.257193] UBIFS error (pid 217): ubifs_scanned_corruption: first
> 1393 bytes from LEB 562:125583
> [   28.266307] 00000000: ffffffbf ffffffff ffffffff ffffffff ffffffff

Looks like your erased page has developed a bit error (b instead of
f above). Not using ubiformat can do this for you rather quickly if
you are reflashing a lot.

Most modern ECC schemes can't deal with bit errors in erased pages,
since the ECC bits for a all-1 page are not all-1 themselves. So the
hardware ECC usually considers a perfectly good erased page as having
uncorrectable errors.

So you usually see some code in the NAND driver which recognises the
syndrome of a fully erased page and thus wont report the error.

If the syndrome doesn't match, it has to scan the page for 0-bits and
decide that e.g. less than 4 0-bits still counts as a fully erased page
and forcibly set it to all-1.

In other words, your low-level NAND driver probably doesn't currently
implement this "biterrors on erased page" scenario.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
