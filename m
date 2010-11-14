Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHXKy-0005cm-GU
	for linux-mtd@lists.infradead.org; Sun, 14 Nov 2010 07:49:22 +0000
Received: by bwz5 with SMTP id 5so4471014bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 23:49:18 -0800 (PST)
Subject: Re: [PATCH 06/10] mtd-utils: nandwrite: Use 64-bit offset
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTinOWWgUX4y6KR4C=zshV4sjpmUxZu3xPKk4z8np@mail.gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-6-git-send-email-computersforpeace@gmail.com>
	<1289648919.2218.39.camel@localhost>
	<AANLkTinOWWgUX4y6KR4C=zshV4sjpmUxZu3xPKk4z8np@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 14 Nov 2010 09:49:10 +0200
Message-ID: <1289720950.1978.0.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Jehan Bing <jehan@orb.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-11-13 at 17:45 -0500, Mike Frysinger wrote:
> On Sat, Nov 13, 2010 at 06:48, Artem Bityutskiy wrote:
> > On Wed, 2010-11-03 at 01:27 -0700, Brian Norris wrote:
> >> -                             mtdoffset = strtol(optarg, NULL, 0);
> >> +                             mtdoffset = strtoll(optarg, NULL, 0);
> >
> > Ideally this should check for strtoll failures, but this just a side
> > note. Not sure if this is the best way, but I'd do it like this:
> >
> > char *endp;
> >
> > mtdoffset = strtoul(optarg, &endp, 0);
> > if (*endp != '\0' || endp == optarg)
> >        return errmsg("bad volume alignment: \"%s\"", optarg);
> >
> > or something like this. The check for negative mtdoffset could be there
> > as well.
> 
> or use simple_strtoll() from common.h as that includes error handling ...

Oh, even better.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
