Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaByY-0004bZ-Nv
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 19:23:35 +0000
Received: by bwf12 with SMTP id 12so209599bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 12:21:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 22:21:33 +0300
In-Reply-To: <BANLkTi=baMZA4_xPw-aeDPm_NBV7uAQ+Dw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTi=b9tnk5tS9FZZ5WP4Nz9PUhMb02A@mail.gmail.com>
	<BANLkTi=baMZA4_xPw-aeDPm_NBV7uAQ+Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308943297.13493.11.camel@koala>
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

On Fri, 2011-06-24 at 14:28 -0400, Mike Frysinger wrote:
> > Why is mtdinfo under ubi-utils? Perhaps it should be moved when it
> > replaces flash_info? I think this is a fair interpretation of Item 3
> > in the feature-removal plan...
> 
> i blame Artem

Yes, fair blame, I was too lazy to make things properly and did not want
to deal with piles of ancient code, sorry.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
