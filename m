Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fjjX-00059a-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 15:41:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02022614424803.15969@jocke.lumentis.se> 
References: <02022614424803.15969@jocke.lumentis.se>  <0111121314140A.28381@jocke.lumentis.se> <02010409585400.10979@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: scan.c & ACCURATE 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 15:52:58 +0000
Message-ID: <17624.1014738778@redhat.com>
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
>  Patch 1 skips scanning of inodes and dirents which are obsoleted.
> Improves scan speed.  

You're trusting ri.totlen before verifying ri.node_crc. Naughty.

--
dwmw2
