Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmosH-0008LH-1j
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 12:40:03 +0000
Subject: Re: Problem with ubiformat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Johan <kungjohan@gmail.com>
In-Reply-To: <1232117176.25068.32.camel@localhost.localdomain>
References: <de9b121e0901150854w7b88abcendc36e4a5311890aa@mail.gmail.com>
	<1232105373.25068.25.camel@localhost.localdomain>
	<de9b121e0901160636l1d946e9bhaf5c269a5131ea7d@mail.gmail.com>
	<1232117176.25068.32.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2009 14:39:49 +0200
Message-Id: <1238071189.3321.87.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-01-16 at 16:46 +0200, Artem Bityutskiy wrote:
> On Fri, 2009-01-16 at 15:36 +0100, Johan wrote:
> > This is my output of flash_eraseall, so it looks like the same
> > input/output error exist in flash_eraseall but it continues anyway.
> 
> Yeah, ubiformat should not panic as well. I think it should ask the user
> whether to:
> a) continue
> b) stop
> c) mark the eraseblock as bad and continue

Done.

http://git.infradead.org/mtd-utils.git?a=commit;h=0e9ed134f2092cef975f05aea2c1e415137e0c10

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
