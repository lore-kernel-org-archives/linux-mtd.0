Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTxOM-0006ZM-It
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 03:36:59 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Burch, John T." <John.Burch@tellabs.com>
In-Reply-To: <E167ED46776D284B893BE52E888B69BC030F2125@USNVEX3.tellabs-west.tellabsinc.net>
References: <E167ED46776D284B893BE52E888B69BC030F2125@USNVEX3.tellabs-west.tellabsinc.net>
Content-Type: text/plain
Date: Fri, 06 May 2005 11:36:29 +0400
Message-Id: <1115364989.27158.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 format compatibility between kernel versions
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Is a JFFS2 type filesystem formatted from blank flash (running as part
> of
> kernel 2.4.17) fully compatible with JFFS2 running on kernel 2.6.8?
> In other words, if a system's kernel is upgraded from 2.4.17 to 2.6.8,
> will a filesystem created under 2.4.17 be fully compatible when accessed
> by the 2.6.8 kernel?  I haven't seen any problems, but want to make sure
> there isn't any form of incompatibility that might show up later.
I didn't try, but theoretically it should be.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
