Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lAna-0001SJ-00
	for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2001 16:04:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEEDLEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLEEDLEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_gcd_mtd4 <defunct> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 23 Sep 2001 16:12:54 +0100
Message-ID: <6549.1001257974@redhat.com>
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
> When i mount a jffs2 FS as root FS I get this [jffs2_gcd_mtd4 <defunct>
> ] process(and a [jffs2_gcd_mtd4] process as well). This will not
> happen if I mount jffs2 as a extra FS after boot(mount /dev/mtdblock4 /
> jffs2)

Init doesn't reap children which are already dead by the time it's started. 
I think this was declared to be a bug in init itself.


> We are suffering somewhat from long mount times and I remember
> something about checkpoints in jffs2 would solve this problem.
> Correct?

> Anybody working on this? I would be happy to do some testing if
> needed. 

Many people have been talking about it. I've seen no code yet, nor even 
serious debate on the details of how to do it.


> I remember seeing something about beeing alble to control the
> compression level in jffs2(at mount time?), but I can not find in the
> sources. Is it implemented yet?

This is a lot more straight-forward, but still not yet done. 



--
dwmw2
