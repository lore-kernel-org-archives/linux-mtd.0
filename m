Received: from web20302.mail.yahoo.com ([216.136.226.83])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 161XAQ-0001pB-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 18:11:14 +0000
Message-ID: <20011107182035.47243.qmail@web20302.mail.yahoo.com>
Date: Wed, 7 Nov 2001 18:20:35 +0000 (GMT)
From: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Subject: Re: JFFS 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <15946.1003874432@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

 --- David Woodhouse <dwmw2@infradead.org> wrote: > 
> monitoreurope@yahoo.co.uk said:
> >  As we use /var for FIFO data storage on this
> system (many 8-32K
> > files) we need a reliable predictable free space
> estimation in order
> > to be able to maximise the number of stored files
> before we delete to
> > add new. Therefore a better understanding of the
> inner workings of
> > JFFS would be appreciated.
> 
> We make stuff up in jffs2_statfs(). You may be able
> to improve it if you 
> include c->erasing_size in the calculation of
> 'avail', and you'll probably 
> want to include the size of the blocks on the
> erase_pending_list too.

David,

Is there a method by which we could call the garbage
collection function on demand? I ask because our 1 meg
partion mounted as /var will be quite static as we
have a ram disk for transient info. Therfore we will
probably only do a write every 1 hour or so. It would
therfore pay us to link garbage collection with our
FIFO clean up.

David.

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
