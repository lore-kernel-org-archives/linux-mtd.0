Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Whsd-0007R3-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 17:53:43 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C5AD150.1A3B9AAE@comdev.cc> 
References: <3C5AD150.1A3B9AAE@comdev.cc>  <20020201142405.79130.qmail@web20309.mail.yahoo.com> <9323.1012576311@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: debugging strategies for jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 18:04:48 +0000
Message-ID: <30239.1012586688@redhat.com>
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


adam.wozniak@comdev.cc said:
> I'm trying to debug what I think might be a problem in jffs2 code.
> Is it safe for me to create a new jffs2 image by randomly shuffling
> the erase blocks in an existing jffs2 image?

> Should that work? 

Yes, it should. The code treats all erase blocks entirely separately. 
So much so, in fact, that I'm surprised you think it would be enlightening 
to do so. 

--
dwmw2
