Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf84g-00012A-Oo
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 09:42:07 +0000
Received: by fxm19 with SMTP id 19so6970952fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 01:41:56 -0800 (PST)
Subject: Re: validate_sb: bad superblock, error 8 (Minimum UBI volume size
	for UBIFS image)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Murray <amurray@mpcdata.com>
In-Reply-To: <AANLkTinyjaXqfWBSXzG2jg8wWiVbXA6ZhZ=RUgtue=qO@mail.gmail.com>
References: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
	<AANLkTikhFt32NA9Lhzh0LDCzQmem3tjJZTG1TnP6ugnK@mail.gmail.com>
	<AANLkTinyjaXqfWBSXzG2jg8wWiVbXA6ZhZ=RUgtue=qO@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 11:41:50 +0200
Message-ID: <1295343710.2470.114.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-01-15 at 22:09 +0000, Andrew Murray wrote:
> On 15 January 2011 10:48, Andrew Murray <amurray@mpcdata.com> wrote:
> > On 11 January 2011 09:47, Andrew Murray <amurray@mpcdata.com> wrote:
> >>
> >> Is there a way to determine the minimum UBI volume size which will
> >> support a given UBIFS filesystem image?
> >>
> >
> > My conclusion is this (with my version of kernel and mkfs.ubifs tool):
> >
> > (Min No. UBI Volume LEBS) = (jrn_lebs) + 3 + (log lebs) + (lpt_lebs) +
> > (orph_lebs)
> >
> > And these values can all be determined (or specified) by the
> > mkfs.ubifs tool by using the verbose -v flag.
> >
> > This seems to hold true - Does this seem reasonable?
> 
> After reading the ODP presentation, white paper and reading the source
> - I do not understand the purpose of the second condition in the
> following test case in validate_sb:
> 
>         if (c->max_bud_bytes < (long long)c->leb_size * UBIFS_MIN_BUD_LEBS ||
>             c->max_bud_bytes > (long long)c->leb_size * c->main_lebs
> 
> It seems to be asserting that there is enough space on the volume to
> cater for the maximum size of the journal.

Yes.

>  However in the case where
> the UBI volume is similar in size to the UBIFS image data -
> 'main_lebs' will mostly be absent of free space lebs.

Yes, and this is a sanity check to make sure the superblock contains
sane information, not garbage, not crafted attacker's image, but an
image where everything is within sane limits.

IOW, this is about allowing only values we kept in mind during
development, this is about being defensive and playing safe.

>  Therefore there
> may not be enough room for max_bud_bytes amounts of journal.

Yes, and I think this max_bud_bytes is treated as the "journal" size the
user wanted when he created the image, and we kind of committed to cater
the user with this journal, and if we cannot, we fail, we do not
silently keep going.

>  And in
> any case the journal code seems to cater well for there not being
> enough free lebs. (Presumably it copes when the volume is nearly
> full).

Probably it will return -ENOSPC correctly.

> Therefore is this condition superfluous?

No, this is sanity check. And as I said, AFAIR, we considered
max_bud_bytes as a requirement to provide this amount of bytes for buds.
If we cannot do this, we fail.

But if this check makes your life miserable and prevents you from
solving your task, we can consider changing this of course.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
