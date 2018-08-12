Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fowUe-00074k-2Z
 for linux-mtd@lists.infradead.org; Sun, 12 Aug 2018 19:57:42 +0000
Received: by mail-pg1-f194.google.com with SMTP id r5-v6so6585940pgv.0
 for <linux-mtd@lists.infradead.org>; Sun, 12 Aug 2018 12:55:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180805145257.15256-2-miquel.raynal@bootlin.com>
References: <20180805145257.15256-1-miquel.raynal@bootlin.com>
 <20180805145257.15256-2-miquel.raynal@bootlin.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 12 Aug 2018 16:54:18 -0300
Message-ID: <CAAEAJfAapmMAKe=QM=m+VgXkubee-NvXH1cnrDFhVscsCQ9XJA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Documentation: mtd: remove stale pxa3xx NAND
 controller documentation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 August 2018 at 11:52, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> It is preferred to have the documentation about the drivers directly
> embedded in the driver itself. Remove this file now that the most
> important information from this file have been re-written in
> marvell_nand.c.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>

Makes sense.

Acked-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Eze

> ---
>
> Changes since v1/v2/v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * None.
>
>  Documentation/mtd/nand/pxa3xx-nand.txt | 113 ---------------------------=
------
>  1 file changed, 113 deletions(-)
>  delete mode 100644 Documentation/mtd/nand/pxa3xx-nand.txt
>
> diff --git a/Documentation/mtd/nand/pxa3xx-nand.txt b/Documentation/mtd/n=
and/pxa3xx-nand.txt
> deleted file mode 100644
> index 1074cbc67ec6..000000000000
> --- a/Documentation/mtd/nand/pxa3xx-nand.txt
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -
> -About this document
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Some notes about Marvell's NAND controller available in PXA and Armada 3=
70/XP
> -SoC (aka NFCv1 and NFCv2), with an emphasis on the latter.
> -
> -NFCv2 controller background
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -
> -The controller has a 2176 bytes FIFO buffer. Therefore, in order to supp=
ort
> -larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set=
 of
> -chunked transfers.
> -
> -For instance, if we choose a 2048 data chunk and set "BCH" ECC (see belo=
w)
> -we'll have this layout in the pages:
> -
> -  ----------------------------------------------------------------------=
--------
> -  | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC=
 | ... |
> -  ----------------------------------------------------------------------=
--------
> -
> -The driver reads the data and spare portions independently and builds an=
 internal
> -buffer with this layout (in the 4 KiB page case):
> -
> -  ------------------------------------------
> -  |     4096B data     |     64B spare     |
> -  ------------------------------------------
> -
> -Also, for the READOOB command the driver disables the ECC and reads a 's=
pare + ECC'
> -OOB, one per chunk read.
> -
> -  -------------------------------------------------------------------
> -  |     4096B data     |  32B spare | 30B ECC | 32B spare | 30B ECC |
> -  -------------------------------------------------------------------
> -
> -So, in order to achieve reading (for instance), we issue several READ0 c=
ommands
> -(with some additional controller-specific magic) and read two chunks of =
2080B
> -(2048 data + 32 spare) each.
> -The driver accommodates this data to expose the NAND core a contiguous b=
uffer
> -(4096 data + spare) or (4096 + spare + ECC + spare + ECC).
> -
> -ECC
> -=3D=3D=3D
> -
> -The controller has built-in hardware ECC capabilities. In addition it is
> -configurable between two modes: 1) Hamming, 2) BCH.
> -
> -Note that the actual BCH mode: BCH-4 or BCH-8 will depend on the way
> -the controller is configured to transfer the data.
> -
> -In the BCH mode the ECC code will be calculated for each transferred chu=
nk
> -and expected to be located (when reading/programming) right after the sp=
are
> -bytes as the figure above shows.
> -
> -So, repeating the above scheme, a 2048B data chunk will be followed by 3=
2B
> -spare, and then the ECC controller will read/write the ECC code (30B in
> -this case):
> -
> -  ------------------------------------
> -  | 2048B data | 32B spare | 30B ECC |
> -  ------------------------------------
> -
> -If the ECC mode is 'BCH' then the ECC is *always* 30 bytes long.
> -If the ECC mode is 'Hamming' the ECC is 6 bytes long, for each 512B bloc=
k.
> -So in Hamming mode, a 2048B page will have a 24B ECC.
> -
> -Despite all of the above, the controller requires the driver to only rea=
d or
> -write in multiples of 8-bytes, because the data buffer is 64-bits.
> -
> -OOB
> -=3D=3D=3D
> -
> -Because of the above scheme, and because the "spare" OOB is really locat=
ed in
> -the middle of a page, spare OOB cannot be read or write independently of=
 the
> -data area. In other words, in order to read the OOB (aka READOOB), the e=
ntire
> -page (aka READ0) has to be read.
> -
> -In the same sense, in order to write to the spare OOB the driver has to =
write
> -an *entire* page.
> -
> -Factory bad blocks handling
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -
> -Given the ECC BCH requires to layout the device's pages in a split
> -data/OOB/data/OOB way, the controller has a view of the flash page that'=
s
> -different from the specified (aka the manufacturer's) view. In other wor=
ds,
> -
> -Factory view:
> -
> -  -----------------------------------------------
> -  |                    Data           |x  OOB   |
> -  -----------------------------------------------
> -
> -Driver's view:
> -
> -  -----------------------------------------------
> -  |      Data      | OOB |      Data   x  | OOB |
> -  -----------------------------------------------
> -
> -It can be seen from the above, that the factory bad block marker must be
> -searched within the 'data' region, and not in the usual OOB region.
> -
> -In addition, this means under regular usage the driver will write such
> -position (since it belongs to the data region) and every used block is
> -likely to be marked as bad.
> -
> -For this reason, marking the block as bad in the OOB is explicitly
> -disabled by using the NAND_BBT_NO_OOB_BBM option in the driver. The rati=
onale
> -for this is that there's no point in marking a block as bad, because goo=
d
> -blocks are also 'marked as bad' (in the OOB BBM sense) under normal usag=
e.
> -
> -Instead, the driver relies on the bad block table alone, and should only=
 perform
> -the bad block scan on the very first time (when the device hasn't been u=
sed).
> --
> 2.14.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
