Received: from web51009.mail.yahoo.com ([206.190.39.128])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTNjp-0003U5-S8
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 13:32:46 -0400
Message-ID: <20050504173249.28908.qmail@web51009.mail.yahoo.com>
Date: Wed, 4 May 2005 10:32:49 -0700 (PDT)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: dedekind@infradead.org
In-Reply-To: 6667
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: two questions about jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comment "JFFS2 handles bad blocks just fine." is
an strange comment. As far as I know the handling of
the bad blocks must be managed by the file system and
mtd device will only check for bad blocks for erase operation.


		
Discover Yahoo! 
Get on-the-go sports scores, stock quotes, news and more. Check it out! 
http://discover.yahoo.com/mobile.html
