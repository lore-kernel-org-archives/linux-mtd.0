Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lbs29-0004Zs-4z
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2009 07:48:55 +0000
Subject: Re: [PATCH 1/2] flash_eraseall: remove support for clean markers
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <1235461457.25808.14.camel@localhost.localdomain>
References: <20090223213600.GA15989@Chamillionaire.breakpoint.cc>
	<1235461457.25808.14.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Feb 2009 09:48:09 +0200
Message-Id: <1235461689.25808.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-24 at 09:44 +0200, Artem Bityutskiy wrote:
> Hmm... I used -j long time ago and it worked. Also I can understand the
> benefits of this options. I'd be much happier to see a fix.
> 
> Sorry, but I won't push your patch. But dwmw2, tglx1, or jwb can do this
> if they consider it necessary.
> 
> I think someone instead should dig this and realize what exactly went
> broke, why, and how can we fix this.
> 
> A patch which just prints "This option is broken" would be accepted by
> me.

P.S. you are doing good job in mtd-utils, and I appreciate this.
     Please, do not take my refusal as an offense.
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
