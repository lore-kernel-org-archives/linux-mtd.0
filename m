Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bPUp-0004RU-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 17:16:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02021416570005.29375@thomas> 
References: <02021416570005.29375@thomas> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 & NAND 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Feb 2002 17:27:48 +0000
Message-ID: <1035.1013707668@redhat.com>
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

gleixner@autronix.de said:
> Since the discussion is broken and I'm answering my question to myself
> for a  few days, I ask me, if the interest on this problem is gone.

> I have spent a lot of time to make this running. It does, except one
> unresolved issue, when we fail in flush_wbuf and wbuf contains more
> than the  actual node. I'm willing to solve this too, but as I
> mentioned before, my knowlegde of  JFFS2 is not deep enough yet. Is
> there anybody, who want's to implement this  basicly or give me at
> least some pointers how to do it.

I'm sorry I haven't been particularly responsive for the last few days. It's
not that I'm not interested, more that the last few days included 24 hours
in a tin can coming back from linux.conf.au and I don't think I'm awake
enough yet to attempt it :)

--
dwmw2
