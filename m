Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w9SA-0002CR-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 22:51:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011023143913.42416.qmail@web20302.mail.yahoo.com> 
References: <20011023143913.42416.qmail@web20302.mail.yahoo.com> 
To: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Oct 2001 23:00:32 +0100
Message-ID: <15946.1003874432@redhat.com>
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

monitoreurope@yahoo.co.uk said:
>  As we use /var for FIFO data storage on this system (many 8-32K
> files) we need a reliable predictable free space estimation in order
> to be able to maximise the number of stored files before we delete to
> add new. Therefore a better understanding of the inner workings of
> JFFS would be appreciated.

We make stuff up in jffs2_statfs(). You may be able to improve it if you 
include c->erasing_size in the calculation of 'avail', and you'll probably 
want to include the size of the blocks on the erase_pending_list too.

--
dwmw2
