Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rNBp-0002aT-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 18:30:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0110101848230.18912-100000@lxserver.deltes.cz> 
References: <Pine.LNX.4.21.0110101848230.18912-100000@lxserver.deltes.cz> 
To: martin.kula@deltaes.cz
Cc: linux-mtd@lists.infradead.org
Subject: Re: Eraseblock size in jffs2 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Oct 2001 18:39:49 +0100
Message-ID: <30602.1002735589@redhat.com>
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

martin.kula@deltaes.cz said:
> If jffs2 doesn't work should I use the same procedure with jffs(v1)?
> I'm very confused with it because when I use eraseall on the mtd0
> device than I erase  MBR and so  too ? I won't be able to boot from
> this, will I ?

Yes, it would take out all the firmware, but the firmware wouldn't have let 
you boot from JFFS or JFFS2 anyway.

> What filesystem is probably the best for DoC now ? 

Probably best just to use NFTL on it and a normal filesystem on top of that.


--
dwmw2
