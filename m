Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qDcF-0001eG-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 13:37:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLKELLFCAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLKELLFCAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Unable to recover from CRC failiure 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Mar 2002 13:37:26 +0000
Message-ID: <18619.1017236246@redhat.com>
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

joakim.tjernlund@lumentis.se said:
> >>???; c007fbc8 <jffs2_do_unlink+2e0/338>   <===== 
> Trace; c007fb0c <jffs2_do_unlink+224/338>

Now fixed, I think.

> But why can't JFFS2 resolve this itself? Should it not just "delete"
> the bad nodes?

Possibly, yes. 

--
dwmw2
