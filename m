Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaBPw-0003Fj-Bq
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:47:48 +0000
Received: by bwf12 with SMTP id 12so183061bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 11:46:58 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
Date: Fri, 24 Jun 2011 21:46:49 +0300
In-Reply-To: <BANLkTinbS1fk=eM6=ANssed7jKih3w=vzw@mail.gmail.com>
References: <20110622051649.GA19948@july> <1308917793.7715.8.camel@koala>
	<BANLkTinbS1fk=eM6=ANssed7jKih3w=vzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308941216.13493.0.camel@koala>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-24 at 21:20 +0900, Kyungmin Park wrote:
> On Fri, Jun 24, 2011 at 9:16 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2011-06-22 at 14:16 +0900, Kyungmin Park wrote:
> >> From: Kyungmin Park <kyungmin.park@samsung.com>
> >>
> >> There are two different 4KiB pagesize chips
> >> KFM4G16Q4M series have NOP 4 with version ID 0x0131
> >> But KFM4G16Q5M has NOP 1 with versoin ID 0x013e
> >>
> >> Note that Q5M means that it has NOP 1.
> >>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > Pushed to l2-mtd-2.6.git, thanks.
> 
> Hi Artem,
> 
> It's required for s5pc110 series and supported at previous kernel, I
> mean it's bug fixed.
> So please merge it 3.0-rc periods

Only dwmw2 does this, so please, ask him.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
