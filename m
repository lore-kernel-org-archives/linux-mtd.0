Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mXmg-0000Y2-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Mar 2002 10:21:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020317102159.145E2274E@sitemail.everyone.net> 
References: <20020317102159.145E2274E@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 17 Mar 2002 10:32:29 +0000
Message-ID: <29360.1016361149@redhat.com>
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

zeusj@firstlinux.net said:
> >I note you don't have a set_vpp() method. Do you need one?
>  Sure, thanks! 

Does that mean adding one actually makes it work?

> and why the message show me that "Invalid ioctl 5401 (MEMGETINFO = 80204d01)

It's a debugging message. I think the ioctl changed at some point in the 
distant past, and it was added so we could tell when people were using old 
tools. Someone (usually cat) did an ioctl on the mtdchar device to see 
whether it was a tty. It wasn't. 

--
dwmw2
