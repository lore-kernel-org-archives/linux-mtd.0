Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCDR-0001uP-MN
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 19:38:58 +0000
Received: by bwf12 with SMTP id 12so222477bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 12:38:56 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 22:38:52 +0300
In-Reply-To: <BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308944335.13493.19.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 11:52 -0400, Mike Frysinger wrote:
> On Thu, Jun 23, 2011 at 11:04, Artem Bityutskiy wrote:
> > And speaking about released, should we do a new one? If you see that
> > some utils should have a version increased - feel free to do so. But
> > even better we could make the version numbers to be the same as release
> > number, then this process would be more automated and version would make
> > some sense...
> 
> the version isnt encoded anywhere.  so if you started using something
> like the kernel where the VERSION was in the Makefile, we could use
> that to create a header file which all the utils would include.

Absolutely agree, but I've changed my employer recently and now very
busy and barely have time to follow the mailing list, so I'd be happy if
someone sent a patch :-)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
