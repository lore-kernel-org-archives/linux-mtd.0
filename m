Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dpjx-0003PI-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 09:42:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020221095156.14464.qmail@web14701.mail.yahoo.com> 
References: <20020221095156.14464.qmail@web14701.mail.yahoo.com> 
To: Michael Michael <memmel2@yahoo.com>
Cc: Gad Hayisraeli <gad@syete.co.il>, linux-mtd@lists.infradead.org
Subject: Re: Slow jffs2 startup on DOM 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Feb 2002 09:53:27 +0000
Message-ID: <2193.1014285207@redhat.com>
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

memmel2@yahoo.com said:
> I think in this case its caused by the underlying block device
> cleaning things up. Not JFFS2. I think he's right. 

I didn't think the DOM knew anything about when it was opened/closed by the 
operating system, so it didn't get a chance to behave differently on an 
unmount? It's just an IDE drive, isn't it?

--
dwmw2
