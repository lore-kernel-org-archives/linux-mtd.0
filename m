Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsQXU-0004Qr-Dh
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 03:07:17 +0000
Received: by wera10 with SMTP id a10so807633wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 19:07:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
 <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
Date: Tue, 31 Jan 2012 19:07:12 -0800
Message-ID: <CAN8TOE9pJKD9aznYLDh2Se14og3nn-QHCvjQDXHQu2-dhbVavQ@mail.gmail.com>
Subject: Re: [GIT PULL] logfs: bug fixes
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Prasad Joshi <prasadjoshi.linux@gmail.com>,
 =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 9:46 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Anyway, it does have a conflict. And I can (and did) easily resolve
> the conflict that I get, even if I can't really test my end result.
...
> Now, my reaction and resolution to the conflict is to actually take
> the *semantics* from commit f2933e86ad93, and just make
> mtd_block_isbad() return zero (false) if the 'block_isbad' function is
> NULL. But that also means that now "mtd_can_have_bb()" always returns
> 0.

For your (hopefully temporary) resolution, mtd_can_have_bb() should
return 1, not 0. Or better yet, do not change mtd_can_have_bb() right
now. Always returning 0 is interpreted as "the MTD cannot have bad
blocks," which is dangerous for MTD's that *do* support bad blocks.

> At the same time, "mtd_block_markbad()" will obviously return an error
> if the low-level driver doesn't support bad blocks, so this is
> somewhat non-symmetric, but it actually makes sense if a NULL
> "block_isbad" function is considered to mean "I assume that all my
> blocks are always good".
>
> Anyway, it is possible that the MTD people react very negatively to
> this semantic change, but quite frankly, 99% of all uses of the new
> mtd_block_isbad() function treated it as a boolean, so returning an
> error from it didn't actually *work* correctly - and also made that
> whole mtd_can_have_bb() function kind of pointless.
>
> Essentially nobody checked it anyway with a *very* few exceptions. And
> the mtd_can_have_bb() function was imnsho clearly misdesigned for the
> whole concept.
>
> So I think my resolution is reasonable

I dunno. You bring up some reasonable points, but your resolution
doesn't solve everything correctly.

> but I also think that you guys should look at
>
> =A0- getting rid of mtd_can_have_bb() entirely as being stupid
> (mtd_block_isbad() does the right thing regardless - if the MTD
> supports bad blocks it will do the right thing, and if it doesn't, it
> will do the best thing it can)

For most usages of mtd_can_have_bb(), we can remove it now, I think,
but the remaining situations require some knowledge about bad block
support, not just a blanket statement that "we can have bad blocks."

> =A0- instead introduce a "mtd_can_mark_blockbad()" and use that as a
> "does this MTD device support *explicit* bad blocks" thing.
>
> Some uses may care about that "does it support bad blocks explicitly",
> but nobody should ever care about "can_have_bb()".

There is at least one optimization where we don't even scan for bad
blocks when we know "mtd_can_have_bbt()" is false. But I think it's
only for the mtd_{read,speed,stress,torture}test modules, so small
performance gains aren't really significant.

> Possibly somebody
> could care about the "inverse", in the sense that some filesystem
> might want to only support devices that are defined to be perfect, but
> that doesn't sound much like a MTD filesystem.

I think this is what UBI uses (currently via mtd_can_have_bbt()). I
believe NOR flash don't record bad blocks at all, since it has such
high reliability. On such devices, UBI just chooses to switch into a
failsafe read-only mode when it encounters errors.

> Anyway, I think you guys should have discussed this conflict when you
> saw it in -next (or when the MTD people changed the fs/logfs code - I
> see that J=F6rn was cc'd).

Does linux-next have automatic e-mailing setup for merge conflicts? A
notice to the mailing list could have cleared this up already. If it
was sent to specific developers...well they aren't always responsive
:(

Anyway, solving the conflict alone is very simple, but the additional
semantic change isn't quite so easy.

> As it is, I just did what I think was the "RightThing(tm)". Please
> discuss, and feel free to send me patches/pull requests for whatever
> resolution you get to.

I recommend *not* leaving Linus' merge resolution as is. I like the
change to mtd_block_isbad(), but the change to mtd_can_have_bb() will
produce some breakage, I think.

When I get a chance to sit down and write/test code, I may be able to
provide better suggestions. But most of the changes (including Linus'
honorable attempt at fixing mtd_can_have_bb() behavior) should
probably wait until the next release IMO, as there is some subtlety.

Another note: I think your merge incorrectly discards the intended fix
from commit f2933e8 by (re)introducing these lines in
fs/logfs/dev_mtd.c:

    if (!mtd_can_have_bb(mtd))
            return NULL;

Brian
