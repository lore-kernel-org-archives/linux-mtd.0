Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16165c-0007uX-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 13:16:28 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011106131316.A15512@wohnheim.fh-wedel.de> 
References: <20011106131316.A15512@wohnheim.fh-wedel.de>  <15375.1005031664@redhat.com> <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: Joakim Tjernlund <joakim.tjernlund@lumentis.se>,
    linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Nov 2001 13:22:02 +0000
Message-ID: <15239.1005052922@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  That would be simple, if jffs2 was strictly log-structured. But from
> what I have heard/read about it, the wear levelling makes all delete
> blocks equal. There is no last block, that you can mark in some way. 

True during normal operation, but when you first program a JFFS2 filesystem 
image into a flash partition you do get it all at the beginning.


--
dwmw2
