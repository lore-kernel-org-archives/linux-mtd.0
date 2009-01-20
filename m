Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPCUU-0000Bi-Kt
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 09:01:49 +0000
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Bergeron <mho.linux-mtd@b2n.ca>
In-Reply-To: <3A5BB4FC-6A13-4B8A-94B2-80FCF75E2BBF@b2n.ca>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231397205.6608.119.camel@localhost.localdomain>
	<A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
	<1232355362.31319.16.camel@localhost.localdomain>
	<3A5BB4FC-6A13-4B8A-94B2-80FCF75E2BBF@b2n.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2009 11:01:30 +0200
Message-Id: <1232442090.22350.45.camel@localhost.localdomain>
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

On Mon, 2009-01-19 at 22:44 -0500, David Bergeron wrote:
> So here's my sysadmin grade speculation (I'm no filesystem guru):
> - A script is executed & open
> - It is soon deleted and replaced by a new one but cannot be released  
> just yet
Right, and UBIFS (well, and other FSes) calls such files "orphans" -
they are opened, but deleted. Indeed UBIFS does not do final removal for
such files until after the final close().

> - There is little time between the file becoming unreferenced and the  
> filesystem becoming read-only
> - [wild speculation] Something goes wrong, the LEB it used had to be  
> orphaned but it's too late, some bad pointer gives LEB 0 the axe

Yeah, our current theory is that you have your script running, which
means it is opened, and it is orphan now, and you re-mount the FS R/O,
and end up with a R/O FS + an orphan. We never considered this scenario
before. And the scenario is a little nasty because UBIFS may want to
write when you release the orphan (close the file), but the FS is R/O.
We'll work on this, thanks for excellent bug description!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
