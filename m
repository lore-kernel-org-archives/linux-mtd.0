Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MA6z-0002Jf-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 15:48:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFAECIDDAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFAECIDDAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS and Hard Links 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Jan 2002 15:58:53 +0000
Message-ID: <4765.1010073533@redhat.com>
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

acurtis@onz.com said:
> Are hard links supported in the latest JFFS? It appears that some of
> the Linux administrative functions like "useradd" and "su" require
> hard links. If they do not work, then it is not possible to have a
> system with only JFFS.

> Recommendations? 

Switch to JFFS2?

--
dwmw2
