Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox2An-0005N0-9g
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 18:30:06 +0000
Received: by bwz19 with SMTP id 19so5022365bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 11:30:04 -0700 (PDT)
Subject: Re: [PATCH 0/3] MTD: OneNAND: Fix OneNAND DMA error handling and
	2KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <AANLkTi=KDK0d31WhpnN3xktqyFiB4S0kULohViz5fBXf@mail.gmail.com>
References: <20100827025523.GA10688@july> <1283172749.12995.70.camel@brekeke>
	<AANLkTinDPN4bw=2VfwXjKoaXW69m+_oUUq8yH-hvM9oT@mail.gmail.com>
	<1283296419.2018.47.camel@brekeke>
	<AANLkTik-Fr0mvA8jM2RrLD7VzEmJN=reeqwkOcATjVXY@mail.gmail.com>
	<1283336933.1958.3.camel@brekeke>
	<AANLkTi=KDK0d31WhpnN3xktqyFiB4S0kULohViz5fBXf@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Sep 2010 21:29:57 +0300
Message-ID: <1284834597.1721.70.camel@brekeke>
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

On Wed, 2010-09-01 at 19:37 +0900, Kyungmin Park wrote:
> On Wed, Sep 1, 2010 at 7:28 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2010-09-01 at 11:35 +0900, Kyungmin Park wrote:
> >> On Wed, Sep 1, 2010 at 8:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > On Tue, 2010-08-31 at 08:27 +0900, Kyungmin Park wrote:
> >> >> On Mon, Aug 30, 2010 at 9:52 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> >> > On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
> >> >> >> Kyungmin Park (3):
> >> >> >>       MTD: OneNAND: Remove unused cmd_map at s5pc110
> >> >> >>       MTD: OneNAND: Fix loop hang when DMA error at Samsung SoCs
> >> >> >>       MTD: OneNAND: Fix 2KiB pagesize handling at Samsung SoCs
> >> >> >>
> >> >> >>  drivers/mtd/onenand/samsung.c |   17 +++++++----------
> >> >> >>  1 files changed, 7 insertions(+), 10 deletions(-)
> >> >> >
> >> >> > Taken patches 1 and 3, requested a change for patch 2. Pushed patches 1
> >> >> > and 3 to l2-mtd-2.6.git / dunno, thanks.
> >> >>
> >> >> To David, Artem,
> >> >> Can you include these patches to linux-2.6.36-rc4? since it's bug fixes.
> >> >>
> >> >> How do you think?
> >> >
> >> > Note, Linus nowadays tends to be stricter about what goes in -rc. Why
> >> > would the first patch be a fix deserving urgent merging?
> >>
> >> There's no problem with s5pc110 since there's no DMA error. but new
> >> SOC s5pc210 has some problem with DMA.
> >> it occurs the DMA error and can't exit the loop. as it's decided to
> >> use the 2.6.36 for s5pc210 we need to fix it ASAP.
> >>
> >> >
> >> > About the second patch, what if you was mistaken and 20msces is not
> >> > enough sometimes? Don't you afraid to introduce another bug with this?
> >> If it takes more then 20msec it's really slow device. I think I give
> >> the enough time to transfer 2KiB or 4KiB pagesize transfer at DMA.
> >>
> >> I'll measure the real time, how much time taken at 2.6.35 kernel and
> >> give exact number.
> >>
> >> >
> >> > Probably for 2.6.36 the older version of your patch can be merged, and
> >> > then you can add timeout support on top?
> >>
> >> Now I implemented it as DMA polling method, but also implemented the
> >> DMA interrupt codes. as it's new implementation. I don't expect it
> >> can't merge at this windows. so send fixed codes.
> >
> > I am not sure I completely understand what you mean. but lets play safe
> > and merge your original version, because it is small and just fixes the
> > problem. Adding timeout is an improvement, and for this very simple
> > reason it should not go to 2.6.36.
> >
> > Please, clone my l2 tree
> > (http://git.infradead.org/users/dedekind/l2-mtd-2.6.git), checkout the
> > 'for-2.6.36' branch, add timeout, and send it to me as as a separate
> > independent patch. I'll take care of it then.
> >
> > Would you do this please?
> 
> No problem,

Still waiting for the patch which adds timeout.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
