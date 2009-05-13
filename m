Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4A7C-0000Id-3Y
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 08:47:09 +0000
Subject: Re: [PATCH 3/3] mkfs.ubifs: use libubi to format UBI volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905130138t7fc974ffub5efb8c78198388e@mail.gmail.com>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-2-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-3-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-4-git-send-email-corentincj@iksaif.net>
	<1242202348.27996.165.camel@localhost.localdomain>
	<71cd59b00905130138t7fc974ffub5efb8c78198388e@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 May 2009 11:46:54 +0300
Message-Id: <1242204414.27996.175.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-13 at 10:38 +0200, Corentin Chary wrote:
> > On Sat, 2009-05-09 at 11:41 +0200, Corentin Chary wrote:
> >> libubi is now used to format directly UBI volume.
> >> Typing mkfs.ubifs /dev/ubi0_0 is now possible.
> >> dtypes should be ok as they are taken from UBIFS code.
> >
> > Did you test that this works fine on UBI volume and there
> > are no regressions when you output to a file?
> 
> I did some test with and without --root, it worked fine.
> But I'll do some more test with the corrected patch.

Ok, thanks.

> Because I wanted mkfs.ubifs to work without this parameter, like other mkfs.*.
> I know mounting an empty volume will works, but we should also be able
> to use mkfs.ubifs to format
> empty volumes.

Ok.

> >>       ino->uid        = cpu_to_le32(st->st_uid);
> >>       ino->gid        = cpu_to_le32(st->st_gid);
> >> -     ino->uid        = cpu_to_le32(st->st_uid);
> >> -     ino->gid        = cpu_to_le32(st->st_gid);
> >>       ino->mode       = cpu_to_le32(st->st_mode);
> >>       ino->flags      = cpu_to_le32(use_flags);
> >>       ino->data_len   = cpu_to_le32(data_len);
> >
> > Why the 2 lines are removed?
> 
> Theses should have been removed in another patch, but look, they are
> here twice =).

Ah, OK.

> > Yeah, I think you should either ask the user, or just refuse
> > writing to it. Users may just 'ubiupdatevol -t' to erase the
> > volume before invocating mkfs.ubifs.
> >
> > Probably it is easier for now to just remove whole
> > 'erase_volume()' ?
> >
> mkfs.ext{2/3/4} and mkfs.vfat don't ask for confirmation
> I believe mkfs.reiserfs does.
> But I won't hurt to ask.
> Maybe first we can remove erase_volume(), and then, in another patch,
> add erase volume with confirmation.

Well, OK, let's be consistent with other mkfs'es then.

> New patch is comming at the end of the week ...

Thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
