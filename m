Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OuhO6-0007jk-K6
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 07:54:11 +0000
Received: by bwz13 with SMTP id 13so4734370bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 00:54:08 -0700 (PDT)
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	when OOB says "bad")
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTinHKU1BfmtZyEKFwUVFJz9YoPr93D7tP6jqXeJE@mail.gmail.com>
References: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
	<1284186737.1783.4.camel@brekeke>
	<AANLkTinHKU1BfmtZyEKFwUVFJz9YoPr93D7tP6jqXeJE@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 12 Sep 2010 10:54:03 +0300
Message-ID: <1284278043.1783.10.camel@brekeke>
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

On Sun, 2010-09-12 at 00:03 -0400, Mike Frysinger wrote:
> On Sat, Sep 11, 2010 at 02:32, Artem Bityutskiy wrote:
> > On Fri, 2010-09-10 at 19:53 -0400, Mike Frysinger wrote:
> >> the logical thing in my mind would be to extend the userspace mtd abi
> >> to allow a "do the erase even if people think it's bad" option.
> >> perhaps MEMSCRUB ?
> >
> > If you do this, please do not use this name. In UBI we already use term
> > 'scrubbing' for the process when we move contents of eraseblock because
> > we have bit-flips.
> 
> that doesnt sound like scrubbing at all, but too late now i guess to fix

Not sure, I'm not native English speaker, and actually that was not me
who called the process this way.

> > It will be confusing if the same word is used in MTD for "unmarking"
> > eraseblocks. How about: 'force erase' or 'bad erase' ?
> 
> that makes it sound like an option to the existing MEMERASE operation.
>  so i guess what if we just do that -- extend the erase_info_user
> structure to contain a flags field and add a MEMERASE2 that works with
> the larger structure ?  for now we'd only have one option (FORCE), but
> it makes it easy to extend in the future.

Ohh, this was so stupid of me to not ask people to add extra fields to
'struct erase_info_user64' which was introduced relatively recently... I
always add extra fields to ioctl data structures...

But yeah, what you say sounds ok to me.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
