Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rcXr-0007pY-Nz
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 13:03:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Pegler <dwp@cambridgebroadband.com>
In-Reply-To: <16203.14760.225110.350862@localhost.localdomain>
References: <16203.14760.225110.350862@localhost.localdomain>
Message-Id: <1061899385.8465.14.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 26 Aug 2003 13:03:05 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs file duplication
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-08-26 at 11:42 +0100, Dave Pegler wrote:
> Has anyone seen files duplication (like system.conf shown below) 
> when using the jffs filing system ?

JFFS or JFFS2? 

If JFFS, update to JFFS2. If JFFS2, set CONFIG_JFFS2_FS_DEBUG=1 and run
that 'ls -la' again.

Are you 100% sure they're the same name and don't have extra spaces?

-- 
dwmw2
