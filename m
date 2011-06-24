Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCoL-0006LE-Ct
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 20:17:05 +0000
Received: by bwf12 with SMTP id 12so249109bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 13:15:16 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 24 Jun 2011 23:15:12 +0300
In-Reply-To: <BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308946515.13493.32.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 16:00 -0700, Brian Norris wrote:
> If we're going for 2.1 (or some other similarly large jump), maybe we
> should do the following:
> 1) increment some individual version numbers (nanddump and mtdinfo only?)
> 2) make a mtd-utils release 1.4.6
> 3) take care of all the "feature-removal-schedule" stuff...
> 4) put the VERSION in the Makefile (still version 1.4.6), have it
> generate a header
> 5) include that header in common.h
> 6) add a stub version function in common.h that would utilize this
> basic info to supply a "--version" option to all utilities that don't
> have one (at least, as far as reasonable...)
> 7) release another mtd-utils, jumping to v2.x (only needing to edit
> Makefile for version increments!)

Sounds good, and I personally do not mind to call it 2.0 or 3.0 or
1.4.6, you choose.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
