Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLV1-0000SO-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 15:50:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLIEEOFIAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLIEEOFIAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: johan.adolfsson@axis.com, andersen@codepoet.org,
    linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c rework 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Nov 2002 16:20:37 +0000
Message-ID: <5873.1038241237@passion.cambridge.redhat.com>
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
>  If my memory serves me correct, I think the semantics of the clean
> marker has changed somewhat. A clean erase block with only a clean
> maker on it will have the ACCURATE bit set, but once you write to it
> you should clear the ACCURATE bit. This is an optimization that
> enables JFFS2 to avoid scanning empty erase blocks. 

Er, I'm not convinced we ever actually did that. You may be right though.

--
dwmw2
