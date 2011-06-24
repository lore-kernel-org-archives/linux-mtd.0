Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaC4k-0001o9-9R
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 19:29:58 +0000
Received: by bwf12 with SMTP id 12so215840bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 12:29:55 -0700 (PDT)
Subject: Re: mkfs.jffs2 min erase block size: 4 vs 8 KiB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 22:29:34 +0300
In-Reply-To: <BANLkTimkgCz_yBnDOXyafhSV5S+R1un_YQ@mail.gmail.com>
References: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
	<1308917226.7715.6.camel@koala>
	<BANLkTikeC+kfbuowKHbx_yC4ZmcX4nT6Pw@mail.gmail.com>
	<1308943210.13493.10.camel@koala>
	<BANLkTimkgCz_yBnDOXyafhSV5S+R1un_YQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308943791.13493.16.camel@koala>
Mime-Version: 1.0
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

On Fri, 2011-06-24 at 15:23 -0400, Mike Frysinger wrote:
> > Yes, the other way is to teach JFFS2 to merge PEBs and work with
> > multiple of PEBs. In fact in the past it could do this, but that was
> > removed because of some issues, do not remember what.
> >
> > The only complication I see is bad blocks. When you merge PEBs and one
> > of them is bad, then the good PEBs which are in this merge should be
> > treated as bad as well. But this should not be very difficult to do.
> >
> > On the one hand, teaching JFFS2 deal with small PEBs seems to make more
> > sense, on the other hand, doing this on driver level has an advantage -
> > you do not have to modify the file-system and you automatically make UBI
> > benefit from this - UBI scan time goes down when eraseblocks become
> > larger.
> 
> this is way above my familiarity with the code base.  i'll just post
> patches to update the docs.

Fair enough - ones who really need to solve this issue can work on it -
no need to do that if you do not really need this now.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
