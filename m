Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c12t-0004mk-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 09:49:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <999074214.32409.1.camel@russ> 
References: <999074214.32409.1.camel@russ>  <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ> <3B8C86BD.5C4FBCF9@dgt-lab.com.pl> <999069428.31681.12.camel@russ> <3B8C9DC5.F3185B18@dgt-lab.com.pl> 
To: Russ Dill <Russ.Dill@asu.edu>
Cc: Wojciech Kromer <krom@dgt-lab.com.pl>,
    mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 29 Aug 2001 09:55:48 +0100
Message-ID: <21505.999075348@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Russ.Dill@asu.edu said:
>  jffs2 has to scan the entire medium at mount. Also, if there are
> "unformatted" sectors, it erases them (so the first mount will be
> slower than subsequent mounts). Did you look at you data sheets and
> see if that is as tight as the timing can be? 

The erase of unclean sectors is done in the background after the mount has 
finished. One day we'll get round to fixing the drivers so that we don't 
busy-wait for erases to complete either.

--
dwmw2
