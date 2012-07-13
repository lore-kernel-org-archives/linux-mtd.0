Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Spjpo-000733-HX
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:39:29 +0000
Received: by ghbf11 with SMTP id f11so4180949ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 10:39:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FFBDDB0.6010605@parrot.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
Date: Fri, 13 Jul 2012 10:39:14 -0700
Message-ID: <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
From: Brian Norris <computersforpeace@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 10, 2012 at 12:45 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Brian Norris a =E9crit :
>> scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OO=
B
>> mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.
>> MTD_OPS_PLACE_OOB provides the same functionality with the potential[1]
>> added bonus of error correction.
>>
>> This brings scan_block_full() in line with scan_block_fast() so that the=
y
>> both read bad block markers with MTD_OPS_PLACE_OOB. This can help in
>> preventing 0xff markers (in good blocks) from being interpreted as bad
>> block indicators in the presence of a single bitflip.
>
> As far I understand the code, this work when "chip->ecc.read_oob" (used i=
n
> nand_do_read_oob) correct bit flip.
>
> But I see no "chip->ecc.read_oob" implementation that can return bit flip=
. Is
> that expected ?

I have an out-of-tree driver that corrects OOB bitflips. Is there
really no other HW out there that corrects OOB errors?

Anyway, I understand that my driver is an outlier here, but I don't
see a real disadvantage in these changes. But on the positive side, I
expect that in the future, more drivers/HW will either want to stop
using OOB for anything at all or will want ECC protection for OOB.

> This can also work when nand_do_read_ops is used (ops->datbuf !=3D NULL).=
 But it
> is hard to see case where it can correct bit flip in bad block marker. Do=
 you
> have any exemple ?

First of all, this has no effect if the driver does not protect OOB
with ECC (i.e., for OOB-only reads, MTD_OPS_PLACE_OOB =3D=3D MTD_OPS_RAW).
So the following argument only applies when OOB is ECC-protected.

Consider a *good* block that is written with filesystem data. On
bootup, Linux may scan this block's BBM to check if it is bad. If a
bitflip occurs in the bad block marker, then it may be erroneously
considered bad.

Similarly, if a block was marked bad from wear (not factory-marked),
then its BBM may be written along with ECC protection. Then, when we
scan for bad blocks, it will be protected from bitflips that could
possibly cause 0x00 to appear non-zero. (This is not a big issue,
since 'non-zero' is still bad, as long as 0x00 didn't flip to 0xff -
quite unlikely...)

> PS : Did you have any comment on
> http://thread.gmane.org/gmane.linux.drivers.mtd/42243 ?

I read it, and it seems promising. I agree with much of the premise
(that nand_bbt.c is ugly and repetitive at times) but haven't had
enough time to review properly. Sorry. I'm a bit backlogged and will
be for a few weeks, I think. But I'll see what I can do.

Thanks,
Brian
