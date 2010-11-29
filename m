Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN4bU-00013C-OU
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 14:21:17 +0000
Received: by yxm34 with SMTP id 34so2225096yxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Nov 2010 06:21:15 -0800 (PST)
Subject: Re: UBIFS oops after remount ro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfgang Wegner <wolfgang@leila.ping.de>
In-Reply-To: <20101129131807.GB23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
	<1290785057.2552.14.camel@localhost>
	<20101129131807.GB23237@leila.ping.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Nov 2010 16:21:09 +0200
Message-ID: <1291040469.2141.10.camel@koala>
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

On Mon, 2010-11-29 at 14:18 +0100, Wolfgang Wegner wrote:
> Hi Artem,
> 
> I can now reproduce the Oops with CONFIG_UBIFS_FS_DEBUG and your
> patch.

OK, I thought one of ubi_asserts() would trigger. They do not.

>  However, I had to manually apply the hunks because my tree
> seems to differ enough for patch to not apply it automatically...

I sent the patch against the ubifs-v2.6.32 tree, which has all the UBIFS
patches back-ported, and which I recommend to use:

http://linux-mtd.infradead.org/doc/ubifs.html#L_source

(hmm, need to update that page, now there are more back-port trees)

> And here is the complete console log in case I missed some
> important information:

Well, because of the ps output, it is difficult to read kernel prints.
Also, the situation becomes more difficult because you have several
UBIFS file-systems, so many messages are irrelevant. Would be nice to
print them only for the instance which oopses.

> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs
> qqq: kupdated for ubifs

So, not 100% sure, but probably this is kuptdated writeback. For some
reason mm thinks ubifs has dirty data, although it should not have,
because re-mounting path has full sync.

> qqq: writing inode 3298

Does this always happen for inode 3298? Or the inode number changes?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
