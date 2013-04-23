Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUVfG-0007t6-W8
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 05:21:16 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Michal Przeplata <michal.przeplata@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: corrupted empty space - again
Date: Tue, 23 Apr 2013 05:21:04 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9BB98F@DBDE04.ent.ti.com>
References: <CADX2ZXMgE_Zfj157vgymj0K4MmHddCYqrj=qDUYLmcWj_kk7WQ@mail.gmail.com>
In-Reply-To: <CADX2ZXMgE_Zfj157vgymj0K4MmHddCYqrj=qDUYLmcWj_kk7WQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
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

> It seems that:
> a) error is of single bit-flip kind (read decay) (I don't suspect current=
ly
>     unstable bits issue during erasing/writting)
> b) our NAND driver doesn't protect our empty space (no wonder, as 13
> bytes ECC used
>     per 512B subpage should be left 0xFF until written with real data)

[Pekon]: This should not matter, suppose you wanted to write=20
0x77 to a erase-page byte bit 0. So in actual 0x76 would be written on=20
the device. And corresponding ECC stored in OOB/spare area.
When you read the byte, it would read as 0x76, but ECC stored in=20
spare/OOB area was calculated for 0x77, so driver would detect a=20
bit-flip and should correct it too.
So whether bit-flips occur on erased-page or whether after writing,
both can be detected and corrected by your driver.

[Pekon]: Another thing your driver should handle is whether it can
detect bit-flips in OOB/spare area (ECC syndrome) itself or not.
The reason is if your read-ECC itself is corrupted then you should not
mistakenly re-fix your data.


> c) as checked, this is the first empty-page (2kB) in this PEB,
> previous page contains
>     some data (and nothing shows that we have more than one page
> corrupted)
>=20
> I have tried of changing NAND/MTD driver to return -EUCLEAN instead of
> -EBADMSG (to fix
> the problem below UBI layer, pretending that we have correctable
> bit-flip). Results (with UBI debug turned on):

[Pekon]: I think, this is wrong approach:
(a)-EBADMSG mean driver encountered multiple bit-flips which your
 ECC scheme cannot correct. So it is returning you the corrupted data.
(b)-EUCLEAN indicates that though data had bit-flips but they were
 _already_ corrected by the driver. So data is correct.
  In addition to it, upper File-System layer can take preventive actions
 (like scrubbing in UBIFS) to avoid accumulation of bit-flips in future.

So, replacing -EBADMSG with -EUCLEAN would not fix the corrupted
data, rather it would fool the upper FS layer to use the corrupted data
as the fixed one.


> FAIL#1 - error was still there (UBIFS corruption when mounting data
> partition, required for booting),
>   scrubbing for this PEB was initiated (ubi_wl_scrub_peb), but happend
> some time later, when
>   left running after artificially disconnecting backend (I guess it
> was scheduled to ubi_bgt0d task)
> FAIL#2 - it seems that PEB 97 was rewritten to PEB 89, however
> corrupted empty space was
>   also preserved (sic!) at the very same offset, hence error is still
> there (confirmed with nanddump)

[Pekon]: This why you are seeing the bit-flip getting copied to new PEB
because you fooled the FS layer by saying -EUCLEAN.

>=20
> That means that further trying to fix that in NAND/MTD driver is
> futile. Am I right?
>=20

[Pekon]: First identify the root cause of the problem
Possibility-1: whether you are actually seeing multiple bit-flips within=20
same page that your ECC scheme is unable to handle ?
I assume you are using BCH8 algorithm, so check if your=20
number_of_bit-flips > 8 per page.
You can check this by dumping the page without ECC correction.
nanddump -s <offset> -p  <device> -f "file1.hex"            (with correctio=
n)
nanddump -s <offset> -p -n <device> -f "file1.hex"  -n (without correction)
Solution-1:  upgrade ur ECC scheme to BCH-16 or similar.

Possibility-2: your NAND driver is not catching the bit-flips correctly.
Solution-2: fix your NAND driver, not MTD or UBI.


With regards, pekon
