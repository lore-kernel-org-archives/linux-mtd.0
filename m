Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16xklJ-0004IO-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2002 09:25:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020416163230.27f26996.cgagneraud@anfora.fr> 
References: <20020416163230.27f26996.cgagneraud@anfora.fr> 
To: Gagneraud Christian <cgagneraud@anfora.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems when remounting jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Apr 2002 09:25:47 +0100
Message-ID: <2713.1019031947@redhat.com>
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

cgagneraud@anfora.fr said:
> jffs2_scan_eraseblock(): Node at 0x00240000 {0x1985, 0x2003,
> 0x0000000c) has invalid CRC 0x000000)JFFS2: Erase block at 0x00240000
> is not formatted. It will be erased

It does this on the second and _every_ subsequent mount? Can you reproduce 
it with fewer actual files on the file system and CONFIG_JFFS2_FS_DEBUG=1, 
and send me all the output?

--
dwmw2
