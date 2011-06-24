Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCip-0002B9-Nf
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 20:11:26 +0000
Received: by bwf12 with SMTP id 12so246127bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 13:11:20 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 24 Jun 2011 23:11:12 +0300
In-Reply-To: <BANLkTi=b9tnk5tS9FZZ5WP4Nz9PUhMb02A@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTi=b9tnk5tS9FZZ5WP4Nz9PUhMb02A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308946279.13493.29.camel@koala>
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

On Fri, 2011-06-24 at 10:37 -0700, Brian Norris wrote:
> Are the "ubi-utils" and "tests" meant to have the option of compiling
> separately from the other mtd-utils?

Probably not.

> Are these tools ever distributed separately? If not, do they need to
> be independently buildable?

I do not think that we need ubi-utils to be buildable separately.

>  It looks to me like ubi-utils is dependent
> on first compiling "lib", but otherwise, they can all be built
> separately... Anyway, I think this kinda screws with the centralized
> VERSION thing above.
> Why is mtdinfo under ubi-utils? Perhaps it should be moved when it
> replaces flash_info? I think this is a fair interpretation of Item 3
> in the feature-removal plan...

Yeah, it can be moved.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
