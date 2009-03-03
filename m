Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LeSVK-00055u-Gj
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 11:09:45 +0000
Subject: Re: libubiio : userspace UBI input output library
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sidney Amani <seed95@gmail.com>
In-Reply-To: <1236078450.4261.67.camel@localhost.localdomain>
References: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
	<1236062311.4261.43.camel@localhost.localdomain>
	<71cd59b00903022348u34f272cci927fe492c006125d@mail.gmail.com>
	<1236067185.4261.51.camel@localhost.localdomain>
	<52e42efe0903030240i22eb78dcjab2bf37d2e14694c@mail.gmail.com>
	<1236078450.4261.67.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Mar 2009 13:09:26 +0200
Message-Id: <1236078566.4261.69.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Corentin Chary <corentin.chary@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-03 at 13:07 +0200, Artem Bityutskiy wrote:
> On Tue, 2009-03-03 at 11:40 +0100, Sidney Amani wrote:
> > Yes, mtd-utils is very messy, when will the new utils replace old one?
> > We are probably not in the best position to do it.
> 
> Well, this is historical. I'll try to re-arrange this.

Not sure what you mean. You may always clone the tree and have
your own. And send the bits which are ready and of general interest
out, making sure they are merged. Then you re-base. This is
how this stuff usually goes, at least in the kernel.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
