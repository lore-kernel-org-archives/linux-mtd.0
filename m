Received: from mail-vc0-f178.google.com ([209.85.220.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUXc7-00017J-4w
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 07:26:08 +0000
Received: by mail-vc0-f178.google.com with SMTP id ib11so291538vcb.37
 for <linux-mtd@lists.infradead.org>; Tue, 23 Apr 2013 00:26:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5175F337.6010605@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
 <1366120517.2768.109.camel@sauron.fi.intel.com>
 <516E04B0.7010508@freescale.com>
 <CAN8TOE_unte2BFxuXTyUg==7QUTwxXwPsTieaVAD74xixk65CA@mail.gmail.com>
 <CAN8TOE-Nt1HrWBN+HeeJAE0UDKBwCXiEEc5+kPtjBM5hXF4d+A@mail.gmail.com>
 <5175F337.6010605@freescale.com>
Date: Tue, 23 Apr 2013 00:26:03 -0700
Message-ID: <CAN8TOE8MjVK3k5zEEWNMH74aPm6PFU77LuPpV+RH4E5jbfocCA@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: add datasheet's ECC information to nand_chip{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, matthieu.castet@parrot.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 22, 2013 at 7:34 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA04=D4=C223=C8=D5 05:35, Brian Norris =D0=B4=B5=C0:
>>> > Initial comments:
>>> >
>>> > What are the semantics for these new ecc_strength and ecc_size fields
>>> > for chips which aren't encoded in nand_ids.c (or aren't
>>> > ONFI-compliant)? We can't necessarily say that '0' means "no data
>>> > provided" - it is perfectly valid to have a value of 0, e.g., for EZ
>>> > NAND (or something like that) which manages its own ECC on-die. I
>>> > think there are even a few words in the ONFI spec about it. Basically=
,
>>> > I'm trying to point out that there is a difference between those chip=
s
>>> > which we can't/don't detect their ecc_{strength,size} and those which
>>> > need no ECC.
>> We need to straighten out these semantics now. Perhaps the fields in
>> struct nand_chip can be signed, where -1 is "unknown" and 0 is "no ECC
>> required."
>>
> IMHO, use -1 as "unknown" makes the things a little complexed.
> You have to add a patch to fix the nand_ids or init these two fields in
> nand_base.c.

Neither of these options is very difficult, given that we added nice
macros for nand_ids.c. And with a proper return code for the ONFI
functions, we can easily distinguish "uninitialized" (failure) from
initialized-to-zero.

> For the ECC on-die case(sorry, i never meet this type of nand),

Yeah, I haven't seen them myself, but I've heard reports from others
trying to use them. And I believe a driver was submitted recently for
BENAND. I don't recall its fate, though. And such a driver wouldn't be
relying on this information; I'm guessing that it would assume the
flash doesn't need ECC.

> I prefer
> to add a
> new flags to distinguish them.

I'm not sure that would be a better way, if we can just as easily
support signed-int fields. But we should mention the semantics we're
defining, since drivers other than gpmi may (will) want to use this.

> For the "unknown" case, use the default 0.

I'm fine with your suggestion, at least for now. If the code is done
right, it shouldn't be too hard to support either the flag or "-1 as
uninitialized" in the future.

>>> > Also, I might consider different names for these fields so that you
>>> > don't just rely on the in-code comments to differentiate the nand_chi=
p
>>> > and nand_ecc_ctrl values. Perhaps min_ecc_strength and ecc_size?
>>> > (can't think of a great distinguishing name for the second one)
>> The naming can be changed after your series, if it seems worth it.
> If we use the min_ecc_strength, we'd better use the min_ecc_size too.

But min_ecc_size is somewhat inaccurate. For example, for a flash
which requires 4-bit correction per 512-bytes, it is not acceptable to
use a larger ECC size (e.g., 4-bit correction per 1024-bytes). It is,
however, acceptable to *decrease* the ECC size (e.g., 4-bit correction
per 256-bytes, if such ECC exists), so it's more like a "max ECC
size." Really, though, it's neither a max nor a min (e.g., 8-bit per
1024-bytes also is acceptable); it just happens to pair with
min_ecc_strength.

So like I said, rather than hold up on this name, we could leave it
as-is. Or change it to min_ecc_strength/ecc_size. Or, if you still
think it's good enough, min_ecc_strength/min_ecc_size. Whatever you
choose. (With comments.)

Brian
