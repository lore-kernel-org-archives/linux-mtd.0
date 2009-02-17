Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZJBX-0005hc-4z
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 06:12:02 +0000
Subject: Re: [UBIFS] Filesystem capacity
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090217003921.GB20713@shareable.org>
References: <49997BBF.7080906@wb.com.pl> <49998C2D.7000505@nokia.com>
	<20090217003921.GB20713@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 08:11:51 +0200
Message-Id: <1234851111.17790.218.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Adam S. Turowski" <a.turowski@wb.com.pl>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-17 at 00:39 +0000, Jamie Lokier wrote:
> > The disadvantage of 2 or 3 is that it also multiples the effective number
> > of bad blocks.
> 
> Is this a major flaw of UBIFS?  I was thinking of using UBIFS for a
> project but this makes me wonder if it's a good idea.

I do not see any major flaw.

> What does "UBIFS does not fit data into the ends of eraseblocks the
> way JFFS2 does" mean?

JFFS2 can split nodes on 2 parts and put 1 part to the end of one
eraseblock, and the second part to the beginning of another eraseblocks.
UBIFS does not split data blocks. This is the difference.

However, UBIFS tries to write small data nodes to the ends of
eraseblocks to minimize the wastage. And I am not sure JFFS2 is doing
better job, but I did not deliberately compared them.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
