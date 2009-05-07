Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1vxQ-0001L5-Iw
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 05:15:52 +0000
Subject: Re: ubifs corrupt
From: Artem Bityutskiy <dedekind@infradead.org>
To: jerry <jerrydreaming@gmail.com>
In-Reply-To: <71103bce0905060329y21a701d4m7be9f566d786f485@mail.gmail.com>
References: <71103bce0904271851v4004cfadp465f8fee2519f836@mail.gmail.com>
	<1241499737.3760.21.camel@localhost.localdomain>
	<71103bce0905060329y21a701d4m7be9f566d786f485@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 May 2009 08:15:35 +0300
Message-Id: <1241673335.27549.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-06 at 18:29 +0800, jerry wrote:
> > Well, the error is that ubifs tries to read a directory entry,
> > but finds empty space there. It might be related to the way you
> > join you NAND chips.
> >
> > Could you try to reproduce this error on a simpler setup? E.g.,
> > if you do not have multiple chips joined into one, or on nandsim?
> >
> > --
> > Best regards,
> > Artem Bityutskiy (Битюцкий Артём)
> >
> >
> Ok, I will test  one nandflash(K9GAG08U0M).Thank you for your help,I
> will report the result as soon as I can.
> If the error has happened,ubifs oughts to recover from it.
> when I select the UBIFS_FS_DEBUG_CHKS = y,the ubifs file system is
> recovered.I think it is recovered only in memory. Why it is not saved
> on the nandflash？

Hmm, this sounds like it is more likely UBIFS bug...

UBIFS_FS_DEBUG_CHKS just enables additional self-checks. It
is not designed for recovery. What you see is some side effect.
UBIFS should recover without UBIFS_FS_DEBUG_CHKS.

We do not have setup with that large eraseblocks. And we are
very busy now.

But if you want this problem to be fixed, the best you could do
is to find an easy way to reproduce the problem. Could you try
to simulate a similar flash with nandsim somehow? And if
you can reproduce this on your host with nandsim, this means
we can reproduce this here, which means we can try to fix
this.

E.g., you could join several nandsim partitions similar way
you joined your real chips.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
