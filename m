Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsfSO-0006wa-ON
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 19:03:01 +0000
Received: by wico1 with SMTP id o1so1419417wic.36
 for <linux-mtd@lists.infradead.org>; Wed, 01 Feb 2012 11:02:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328100867.28171.88.camel@sauron.fi.intel.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
 <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
 <CAN8TOE9pJKD9aznYLDh2Se14og3nn-QHCvjQDXHQu2-dhbVavQ@mail.gmail.com>
 <CA+55aFwMinLTj4Jf5D-LHR73vfPLn4EUHooaBGSrsDdrRWsrrw@mail.gmail.com>
 <1328100867.28171.88.camel@sauron.fi.intel.com>
Date: Wed, 1 Feb 2012 11:02:58 -0800
Message-ID: <CAN8TOE_OdKRtjf4obP496i8eOoHs_Q9aCbzSBykQR1f4vuCPLQ@mail.gmail.com>
Subject: Re: [GIT PULL] logfs: bug fixes
From: Brian Norris <computersforpeace@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Prasad Joshi <prasadjoshi.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 1, 2012 at 4:54 AM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 1 Feb 2012 11:50:07 +0200
> Subject: [PATCH] mtd: fix merge conflict resolution breakage
>
> This patch fixes merge conflict resolution breakage introduced by merge
> commit 'd3712b9dfcf44ca145cf87e7f4096fa2d923471a'.
>
> The commit changed 'mtd_can_have_bb()' function and made it always return
> zero, which is incorrect. Instead, we need it to return whether the
> underlying flash device can have bad eraseblocks or not. UBI needs this
> information because it affects how it handles the underlying flash.
> E.g., if the underlying flash is NOR, it cannot have bad blocks and any
> write or erase error is fatal, and all we can do is to switch to R/O
> mode. We do not need to reserve a pool of good eraseblocks for bad
> eraseblocks handling, and so on.
>
> This patch also removes 'mtd_can_have_bb()' invocations from Logfs
> to ensure correct Logfs behavior.
>
> I've tested that with this patch UBI works on top of NOR and NAND
> flashes emulated by mtdram and nandsim correspondingly.
>
> This patch is based on patch from Linus Torvalds.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This agrees with my suggestions.

Acked-by: Brian Norris <computersforpeace@gmail.com>
