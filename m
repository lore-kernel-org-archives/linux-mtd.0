Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MqFY-0004xV-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jan 2002 12:48:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001001c195e3$cd5fb180$5a9240d5@jocke> 
References: <001001c195e3$cd5fb180$5a9240d5@jocke> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: CLEANMARKER question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 Jan 2002 12:59:31 +0000
Message-ID: <6691.1010235571@redhat.com>
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

Joakim.Tjernlund@lumentis.se said:
> I have seen alot of posts about it but I have no idea on how to
> proceed with this.

The basic idea is to make it nice and quick for the FS code to reproduce 
its internal data (the jffs2_raw_node_ref lists and clean/dirty sizes) on 
mount without having to work it all out from scratch. Look at what the 
mount code does, and see how much could be avoided - then work out 
precisely what needs to go into the checkpoint - it'll probably end up 
being a tradeoff between remount speed and the size taken by the checkpoint 
nodes.

I wonder if we could get away with writing a node at the _end_ of each
eraseblock, just listing the start addresses of the nodes contained within
that block?

> Would checkpointing  still speed up mount when power is cut and then
> restored? 

If you write a checkpoint only on a clean unmount, then no.
If you do it periodically during normal operation. then yes.

--
dwmw2
