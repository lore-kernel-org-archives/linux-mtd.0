Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCrZ-0002OR-6T
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 20:20:25 +0000
Received: by bwf12 with SMTP id 12so252483bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 13:20:23 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Jun 2011 23:20:17 +0300
In-Reply-To: <BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308946822.13493.36.camel@koala>
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

On Thu, 2011-06-23 at 19:14 -0400, Mike Frysinger wrote:
> > and of the ones that do, we have a
> > random "2.1.0" from flash_erase. We wouldn't want to have a
> decreased
> > version number...so do we jump to mtd-utils v2.1 and make everything
> > the same version? Or even v3.0, just for fun?
> 
> i dont think anyone has scripts parsing these things.  i say let's
> just lock them all to the mtd release and forget about it.

Let's ask CC Peter who is packaging mtd-utils just in case. Peter, will
you suffer if mtd-utils' version all suddenly become 1.4.6? Also, will
you suffer if we switch to 2.0 or 3.0 - 2 numbers instead of 3?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
