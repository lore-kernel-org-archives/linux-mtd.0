Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWFzl-0005Ve-EU
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 11:53:10 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ralph Walden <ralphw@everest-co.com>
In-Reply-To: <81772B4336DEC14EBB8C519C4EC21051F80D90@pe2650.everest-co.com>
References: <81772B4336DEC14EBB8C519C4EC21051F80D90@pe2650.everest-co.com>
Content-Type: text/plain
Date: Thu, 12 May 2005 19:52:35 +0400
Message-Id: <1115913155.27158.48.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops at jffs2_build_remove_unlinked_inode
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> [<c01244b8>] (jffs2_build_remove_unlinked_inode+0x0/0xec) from
> [<c01249bc>] (jff
Your oops looks like the one that we've fixed recently. Please, try MTD
from CVS.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
