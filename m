Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0ID9-00046F-Ln
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 17:09:32 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: "Berland, Mathieu" <mathieu.berland@eads.com>
Date: Tue, 20 Oct 2009 19:08:46 +0200
References: <2132956280B09448AB947D9C8A291AC6011F88BE@SMFIDF806A.main.fr.ds.corp>
In-Reply-To: <2132956280B09448AB947D9C8A291AC6011F88BE@SMFIDF806A.main.fr.ds.corp>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200910201908.47230.jbe@pengutronix.de>
Subject: Re: About the mxc nand driver
Cc: Vladimir Barinov <vova.barinov@gmail.com>,
	'Sascha Hauer' <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org, Eric Benard <ebenard@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Dienstag, 20. Oktober 2009, Berland, Mathieu wrote:
> =============== About Freescale driver (NOT mainline driver)
>
> >The original Freescale driver uses this ecc layout for 8/16 bit busses:
> >
> >static struct nand_ecclayout nand_hw_eccoob_8 = {
> >	.eccbytes = 5,
> >	.eccpos = {6, 7, 8, 9, 10},
> >	.oobfree = {{0, 5}, {11, 5}}
> >};
> >
> >static struct nand_ecclayout nand_hw_eccoob_16 = {
> >	.eccbytes = 5,
> >	.eccpos = {6, 7, 8, 9, 10},
> >	.oobfree = {{0, 6}, {12, 4}}
> >};
> >
> >I understand the first one, but doesn't the second one specify a oobfree
>
> which overlaps with ecc data?
>
> ECC is not overlapped for 16 bits since the second fields of oobfree are
> lengths which is confusing.
>
> These settings comply with the MXC Nand Flash controller specification, at
> least with mine which might be outdated :
>
> 8 bits bus :
> 	Bad block marker @ 5
> 	ECC @ [6..10] (understand from 6 to 10, both included) = {6, 7, 8,
> 9, 10}
> 	Free @ [0..4] [11..15] = {{0, 5}, {11, 5}}
>
> 16 bits bus :
> 	Bad block marker @ 11
> 	ECC @ [6..10] = {6, 7, 8, 9, 10}
> 	Free @ [0..5] [12..15] = {{0, 6}, {12, 4}}
>
> The datasheet says :
> "The host can use all of the spare area except for the BI (bad block
> marker) and ECC code areas".
>
> The ECC is managed by the hardware. It seems that the bad block marker is
> not (not sure).

Bad block marker is handled by the NAND framework. And in the most worst case 
this bad block marker is overwritten by the ECC hardware...

> What's the problem with the old Freescale's driver ?
> The problem is that Flash chips with 2K pages are not really handled.
>
>
> =============== About "SPARE AREA ASSIGNMENT STANDARD" from Samsung (?)
>
> I found one document in Samsung website. It is said :
>
> Small pages (16B OOB) && 8 bits bus :
> 	Bad block marker @ 5 => In my Samsung chip, all the bytes of the OOB
> are set to 0 when a block is marked bad in factory.
> 	ECC @ [6..10] => Chip founders don't care I guess.

It seems every hardware vendor does it in a different way.

> Small pages (16B OOB) && 16 bits bus :
> 	Bad block marker @ 11
> 	ECC @ [6..10]

You must register your own bad block marker structure 
(member 'badblock_pattern' in struct nand_chip) to use offset 11 instead of 
the offset 5.

[...]
> =============== About the mainline driver
>
> Generic BBT code used by mxc_nand.c :
>
> Small pages
> 	Bad block marker @ 5
>
> Large pages
> 	Bad block marker @ [0..1]

These are the defaults if the driver keeps member 'badblock_pattern' in struct 
nand_chip NULL.

> Here is what Vladimir did :
>
> 8 bytes OOB or SW ECC (?) :
> 	Bad block marker @ [5]

Default for page size equal to 512.

> 	ECC @ [6..10]
> 	Free @ [0..4] [11..15]
>
> Small pages (16B OOB) :
> 	Bad block marker @ [5]

Default for page size equal to 512.

> 	ECC @ [6..10]
> 	Free @ [0..4] [11..15]
>
> Large pages (64B OOB) :
> 	Bad block marker @ [0..1]

Default if page size is larger than 512 bytes.

> 	ECC @ [6..10] [22..26] [38..42] [54..58]
> 	Free @ [2..5] [11..20] [27..36] [43..52] [59..63]
> [...]
> =============== Some improvements ?
>
> The only thing that's worrying me is the fact that the Nand Flash
> Controller might use these bad block marker bytes. In this case, we could
> experience problems.

That's why I'm using a separate bbt descriptor.

> I have somes proposals which should be compatible with current Flash
> loaders. This is *only* if someone is experiencing problems during the
> lifecyle of boards :
>
> 1)
>
> 8 bytes OOB :
> 	No more supported
>
> Small pages (16B OOB) && 8 bits bus :
> 	Requirement : keep default bad block marker location, same as today
>
> 	Bad block marker @ 5
> 	ECC @ [6..10]
> 	Free @ [0..4] [11..15]

Bad block marker at offset 5 is described in structure 'smallpage_flashbased' 
in 'nand_bbt.c' and will be used if the driver doesn't touch 
the 'badblock_pattern' structure member.

> Small pages (16B OOB) && 16 bits bus :
> 	Requirement : keep default bad block marker location, same as today
> 	Requirement : byte 11 is not free anymore because it might be used
> by HW for bad block flag (don't known)
>
> 	Bad block marker @ 5
> 	ECC @ [6..10]
> 	Free @ [0..4] [12..15]

Same here. because 'nand_bbt.c' does not distinguish between date width.

> Large pages (64B OOB) && 8 bits bus :
> 	Requirement : keep default bad block marker location, same as today
> 	Requirement : byte 5+16*n are not free because it might be used by
> HW for bad block flag (don't known)
>
> 	Bad block marker @ [0..1]

Yes, because here 'largepage_flashbased' is used for all page sizes larger 
than 512 bytes (until the driver touches the 'badblock_pattern' structure 
member).

> 	ECC & [6..10] [22..26] [38..42] [54..58]
> 	Free @ [2..4] [11..20] [27..36] [43..52] [59..63]
>
> Large pages (64B OOB) && 16 bits bus :
> 	Requirement : keep default bad block marker location, same as today
> 	Requirement : byte 11+16*n are not free because it might be used by
> HW for bad block flag (don't known)
>
> 	Bad block marker @ [0..1]

Yes. No difference between 8 or 16 bits.

jbe

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228     |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/  |
