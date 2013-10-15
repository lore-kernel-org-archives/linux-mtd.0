Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW03h-0000ek-An
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 08:32:53 +0000
From: "Shah, Minal" <minal.shah@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: MTD utils v1.5.0: MEMERASE64 ioctl failed error
Date: Tue, 15 Oct 2013 08:32:23 +0000
Message-ID: <566CE8F1DB913147957287757DA6396B3E9D6A93@DBDE04.ent.ti.com>
References: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
 <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Mukherjee,
 Somnath" <somnath@ti.com>, Mike Frysinger <vapier@gentoo.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Parikh, Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
Thanks a lot for the explanation; I understood the reason for failure.

> So why do you want to erase bad blocks?
The reason why I want to erase bad blocks is because they actually don't se=
em to be bad.=20
Block0 itself is shown as bad.
I have few partitions (like MLO and u-boot env) of size equal to 1 erase bl=
ock. The block is marked as bad and hence I cannot write anything to this p=
artition.=20
One of the solutions is to increase that partition size to 2 blocks so even=
 if 1 block is bad then it will atleast be able to write to the other block=
 of the same partition. But I don't think I should do this while the block =
is not really bad (what if all the blocks for some reason are marked as bad=
 while they are actually not).

This question came in my mind from the fact that "nand scrub" command is al=
lowed from u-boot which allows to also completely erase all the bad blocks;=
 so why not from the kernel level.

Regards,
Minal

-----Original Message-----
From: Brian Norris [mailto:computersforpeace@gmail.com]=20
Sent: Saturday, October 12, 2013 3:55 AM
To: Shah, Minal
Cc: Mike Frysinger; Mukherjee, Somnath; linux-mtd@lists.infradead.org; Gupt=
a, Pekon; Parikh, Urmil
Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error

Hi Minal,

On Wed, Oct 09, 2013 at 05:05:11AM +0000, Shah, Minal wrote:
> I am using MTD utils version 1.5.0 for DRA7 (Vayu) platform.
>=20
> I have bad blocks in some of my NAND partitions which I am not able to er=
ase from linux kernel.

MTD does not allow erasing bad blocks. This is prohibited by NAND
datasheets. There are occasions where, for debugging purposes, one might
need to erase a "bad" block that is not actually bad, but MTD does not
provide an interface for doing this. An interface for doing so was
discussed a while back, but nothing was merged.

> Using "-N" option in flash_eraseall ideally should have allowed erasing t=
he bad block but I land up in "MEMERASE64 ioctl failed" error.=20

"-N" just means that the user-space tool (flash_erase) won't try to skip
bad blocks. But that doesn't circumvent the in-kernel protection that
prevents the erase from succeeding. So the "Input/output" error you see
is completely expected and currently unavoidable, unless you modify your
kernel to remove this protection.

[snip]

So why do you want to erase bad blocks?

Brian
