Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ME0w1-0000cX-Uk
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 13:00:33 +0000
Subject: Re: Nandwrite's behavior in case of write failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <4A2D77EE.2090400@orb.com>
References: <h09s2s$ar6$1@ger.gmane.org>
	<1244205087.5847.66.camel@localhost.localdomain>
	<4A29D723.1010109@gmail.com>
	<1244365076.5847.317.camel@localhost.localdomain>
	<4A2D77EE.2090400@orb.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Jun 2009 15:59:02 +0300
Message-Id: <1244552342.5847.389.camel@localhost.localdomain>
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

On Mon, 2009-06-08 at 13:43 -0700, Jehan Bing wrote:
> Artem Bityutskiy wrote:
> > Yes, write and erase failure mean that the erasblock is bad. But I think
> > marking a block as bad straight away is just dangerous. Who knows may be
> > this is a small glitch in a bus, or a software bug, or some-one
> > corrupted driver's memory, or whatever. This is why UBI is doing
> > eraseblock torturing before marking it as bad. And it is very careful
> > about error codes - only EIO code is considered as a reason to mark an
> > eraseblock as bad.
> 
> 
> Fixed broken behavior in case of write failure. More specifically:
> - Only try to mark a block bad if the errors are EIO. Other errors
> will abort the tool.
> - Also abort the tool if the marking fails instead of ignoring it.
> 
> Signed-off-by: Jehan Bing <jehan@orb.com>

Looks good to me, pushed, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
