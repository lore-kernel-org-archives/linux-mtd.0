Received: from mail-yh0-f54.google.com ([209.85.213.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfxYY-0000g4-8k
 for linux-mtd@lists.infradead.org; Sun, 19 Oct 2014 20:58:26 +0000
Received: by mail-yh0-f54.google.com with SMTP id z6so2104072yhz.13
 for <linux-mtd@lists.infradead.org>; Sun, 19 Oct 2014 13:58:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54384B11.6080209@nod.at>
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
 <20141009102546.GA2755@arch.hh.imgtec.org>
 <CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>
 <54384B11.6080209@nod.at>
Date: Sun, 19 Oct 2014 21:58:04 +0100
Message-ID: <CAPcvp5H39rdavCr8OENfaeCGmiaYrLeiGzBCrxrOg5n8xud-NQ@mail.gmail.com>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10 October 2014 22:09, Richard Weinberger <richard@nod.at> wrote:
>
> As discussed with Ezequiel on IRC the right thing is to fix the UBI rename logic.
>
>> To satisfy my curiosity - does the UBI rename function really need to
>> open the UBI volume as UBI_READWRITE to rename? Does it matter that a
>> UBIFS fileystem may be writing UBI whilst a UBI rename occurs - I've
>> assumed that UBIFS doesn't ever read/write the volume label - so it
>> doesn't matter if it changes beneath it? (I'm not too familiar with
>> UBI/UBIFS internals).
>
> Correct. Renaming a volume does not alter nor read volume data.
> Only the UBI volume table is altered.
> This is why I've cooked up the following patch.
> Please give it some testing!

This appears to work for me - I can rename a mounted volume without
any obvious side effects. I've slightly tweaked (added a break
statement) and submitted your patch.

Though I've had a further look and have an additional questions.

This patch means that UBI_EXCLUSIVE is no longer exclusive (unless
these constraints are with respect to the volume data only and not the
volume table as well) - thus should we update the ubi_open_volume
function to prevent UBI_EXCLUSIVE when metaonly is already held (and
to prevent UBI_METAONLY when exclusive is already held)? I can't see
the harm in doing this and it probably won't impact the use case that
led to this patch.

I can't see any locking around the table fields and thus (with present
patch) I assume you could perform a rename and volume remove at the
same time - I wonder if this would sometimes break. I assume that
anything that currently modifies the volume table will be doing so
with exclusive held.

Thanks,

Andrew Murray
