Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaSkI-0005mV-UW
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 12:45:43 +0000
Received: by fxm19 with SMTP id 19so14312892fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 04:45:41 -0800 (PST)
Subject: Re: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command
	line partitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4D2462F5.3020505@nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122051.20685.46383.sendpatchset@ahunter-work.research.nokia.com>
	<1292421869.2512.56.camel@localhost>  <4D244FD0.4010208@nokia.com>
	<1294229560.2179.20.camel@koala>  <4D2462F5.3020505@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 14:45:37 +0200
Message-ID: <1294231537.2179.21.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-01-05 at 14:24 +0200, Adrian Hunter wrote:
> On 05/01/11 14:12, ext Artem Bityutskiy wrote:
> > On Wed, 2011-01-05 at 13:02 +0200, Adrian Hunter wrote:
> >> On 15/12/10 16:04, ext Artem Bityutskiy wrote:
> >>> On Mon, 2010-12-13 at 14:20 +0200, Adrian Hunter wrote:
> >>>>    From d27a88c5f9f18a7c38784c085889c3e1053340cf Mon Sep 17 00:00:00 2001
> >>>> From: Adrian Hunter<adrian.hunter@nokia.com>
> >>>> Date: Wed, 30 Dec 2009 07:40:16 +0100
> >>>> Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line partitioning
> >>>>
> >>>> Add the ability to parse MTD partition information from the
> >>>> kernel command line.
> >>>>
> >>>> Note that a pointless BUG_ON is removed, as are redundant
> >>>> calls to 'del_mtd_partitions()' and 'del_mtd_device()'
> >>>> because they are also done by 'onenand_release()'.
> >>>>
> >>>> Finally note that 'add_mtd_device()' returns 1 on failure
> >>>> so the error condition was incorrect.
> >>>>
> >>>> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
> >>>
> >>> I've pushed patches 1 and 7 to l2-mtd-2.6, but patch #2 is not
> >>> applicable. I think this is because of changes Kyungmin made recently.
> >>> Could you please re-send patches 2 and 3 on top of the l2 tree?
> >>
> >> I just tried to apply them to l2 and they applied fine as is.
> >> Has something changed?  Do I have the wrong tree?
> >
> > Just tried to apply patch 2 which you re-sent on "Wed, 05 Jan 2011
> > 13:02:40 +0200"
> 
> I guess the patches got munched.  Here they are tarred

Pushed to l2 tree both (patches 2 and 3).

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
