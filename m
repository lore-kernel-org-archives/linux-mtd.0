Received: from [62.235.237.200] (helo=portablue.intern.mind.be)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bPQ0-0004R5-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 17:11:36 +0000
Date: Thu, 14 Feb 2002 18:22:40 +0100
To: Thomas Gleixner <gleixner@autronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 & NAND
Message-ID: <20020214172240.GA16142@mind.be>
References: <02021416570005.29375@thomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02021416570005.29375@thomas>
From: p2@mind.be (Peter De Schrijver)
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

Hi,

On Thu, Feb 14, 2002 at 04:57:00PM +0100, Thomas Gleixner wrote:
> Since the discussion is broken and I'm answering my question to myself for a 
> few days, I ask me, if the interest on this problem is gone.
> 

No, certainly not. Unfortunately I don't have any hardware available now
to test on. As soon as I have, I will certainly test JFFS2 on NAND and
help fixing bugs.

> I have spent a lot of time to make this running. It does, except one 
> unresolved issue, when we fail in flush_wbuf and wbuf contains more than the 
> actual node.
> I'm willing to solve this too, but as I mentioned before, my knowlegde of 
> JFFS2 is not deep enough yet. Is there anybody, who want's to implement this 
> basicly or give me at least some pointers how to do it.
> 

Peter.
