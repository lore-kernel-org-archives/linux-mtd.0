Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165XBQ-0006Hn-00
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 19:00:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1006109689.1390.50.camel@gromit.house> 
References: <1006109689.1390.50.camel@gromit.house>  <1006107094.1391.46.camel@gromit.house> <1335.1006108414@redhat.com> 
To: Michael Rothwell <rothwell@holly-springs.nc.us>
Cc: linux-mtd@lists.infradead.org
Subject: Re: second "mount" hangs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 18 Nov 2001 19:10:15 +0000
Message-ID: <2506.1006110615@redhat.com>
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

rothwell@holly-springs.nc.us said:
> Here ya go (SysRQ-t):

Thanks. I have seen this before - didn't reach any useful conclusions so 
far. That has to be the down_read(s->s_umount) in get_super(). I don't know 
why anything would have the write lock on that though. Can you show the 
backtraces for all the other current processes too? 

--
dwmw2
