Received: from mail-yk0-x22f.google.com ([2607:f8b0:4002:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjxS4-0007Py-L3
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2015 22:44:49 +0000
Received: by ykdz138 with SMTP id z138so32886301ykd.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2015 15:44:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1893578.doJlQXXNMH@laclwks004>
References: <1893578.doJlQXXNMH@laclwks004>
Date: Wed, 7 Oct 2015 23:44:25 +0100
Message-ID: <CAN8TOE_PxTXdVj6YNG+t0vujrTf1kai0KBV8bM2j0OKGZqoT6Q@mail.gmail.com>
Subject: Re: [Q] What is struct mtd_partition.ecclayout & who uses it?
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maximintegrated.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 7, 2015 at 2:11 PM, Brian Foster
<brian.foster@maximintegrated.com> wrote:
>
>   In `struct mtd_partition' there is an undocumented field
>   `.ecclayout' which (modulo a name/type change) has existed since
>   Linus's original GIT commit 1da177e4c3f4 ("Linux-2.6.12-rc2").
>
>   However, with one trivial exception, I can_NOT_ find any users
>   of this field.  The exception is it is initialized to NULL in
>   mtd_add_partition().
>
>   Indeed, a trial build (of v3.10 for my system) with that field
>   and its one known usage /*commented-out*/ succeeded, proving
>   that *IF* it is used at all, it's probably by some specific
>   NAND(-controller?) driver(s?).
>
>   Any idea which one(s?)?
>
>   Offhand, this looks like a long-dead something, with the only
>   clew being the comment (in <linux/mtd/partitions.h>):
>
>      /* out of band layout for this partition (NAND only) */

Looks like you've found a dead field. Not too surprising.

If it's not used in mainline, it's ripe for killing. Patches welcome!

Regards,
Brian
