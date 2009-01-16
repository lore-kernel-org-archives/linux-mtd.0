Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LNpxP-0008DX-RN
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 14:46:03 +0000
Subject: Re: Problem with ubiformat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Johan <kungjohan@gmail.com>
In-Reply-To: <de9b121e0901160636l1d946e9bhaf5c269a5131ea7d@mail.gmail.com>
References: <de9b121e0901150854w7b88abcendc36e4a5311890aa@mail.gmail.com>
	<1232105373.25068.25.camel@localhost.localdomain>
	<de9b121e0901160636l1d946e9bhaf5c269a5131ea7d@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Jan 2009 16:46:16 +0200
Message-Id: <1232117176.25068.32.camel@localhost.localdomain>
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

On Fri, 2009-01-16 at 15:36 +0100, Johan wrote:
> This is my output of flash_eraseall, so it looks like the same
> input/output error exist in flash_eraseall but it continues anyway.

Yeah, ubiformat should not panic as well. I think it should ask the user
whether to:
a) continue
b) stop
c) mark the eraseblock as bad and continue

Well, if the -f option is given, it should just continue.

I'll add this to my TODO list and will do later. But you may
easily implement this yorself and send a patch if you do not
want to wait.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
