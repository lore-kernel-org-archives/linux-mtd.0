Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161XTP-0001qJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 18:30:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011107182035.47243.qmail@web20302.mail.yahoo.com> 
References: <20011107182035.47243.qmail@web20302.mail.yahoo.com> 
To: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Nov 2001 18:40:12 +0000
Message-ID: <31837.1005158412@redhat.com>
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
>  Is there a method by which we could call the garbage collection
> function on demand? I ask because our 1 meg partion mounted as /var
> will be quite static as we have a ram disk for transient info.
> Therfore we will probably only do a write every 1 hour or so. It would
> therfore pay us to link garbage collection with our FIFO clean up.

You can make the GC thread wake up by sending it a SIGHUP. It'll only do 
one operation and then sleep again, though.

What you probably want is a way to tune the thresholds which trigger GC.

--
dwmw2
