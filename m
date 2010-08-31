Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqa1V-00048K-Vh
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 23:13:50 +0000
Received: by vws11 with SMTP id 11so6585400vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 16:13:49 -0700 (PDT)
Subject: Re: [PATCH 0/3] MTD: OneNAND: Fix OneNAND DMA error handling and
	2KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <AANLkTinDPN4bw=2VfwXjKoaXW69m+_oUUq8yH-hvM9oT@mail.gmail.com>
References: <20100827025523.GA10688@july> <1283172749.12995.70.camel@brekeke>
	<AANLkTinDPN4bw=2VfwXjKoaXW69m+_oUUq8yH-hvM9oT@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 02:13:39 +0300
Message-ID: <1283296419.2018.47.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-31 at 08:27 +0900, Kyungmin Park wrote:
> On Mon, Aug 30, 2010 at 9:52 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
> >> Kyungmin Park (3):
> >>       MTD: OneNAND: Remove unused cmd_map at s5pc110
> >>       MTD: OneNAND: Fix loop hang when DMA error at Samsung SoCs
> >>       MTD: OneNAND: Fix 2KiB pagesize handling at Samsung SoCs
> >>
> >>  drivers/mtd/onenand/samsung.c |   17 +++++++----------
> >>  1 files changed, 7 insertions(+), 10 deletions(-)
> >
> > Taken patches 1 and 3, requested a change for patch 2. Pushed patches 1
> > and 3 to l2-mtd-2.6.git / dunno, thanks.
> 
> To David, Artem,
> Can you include these patches to linux-2.6.36-rc4? since it's bug fixes.
> 
> How do you think?

Note, Linus nowadays tends to be stricter about what goes in -rc. Why
would the first patch be a fix deserving urgent merging?

About the second patch, what if you was mistaken and 20msces is not
enough sometimes? Don't you afraid to introduce another bug with this?

Probably for 2.6.36 the older version of your patch can be merged, and
then you can add timeout support on top?

Third patch is probably ok, if you really want it in 2.6.36.

So, I've moved the third patch to l2-mtd-2.6.git / for-2.6.36, I've left
the first patch in the dunno branch, and I also put the original version
of the second patch to the for-2.6.36 branch.

Please, add timeout on top of l2-mtd-2.6.git / for-2.6.36 and send it.
I'll then take care of it, or at least try.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
