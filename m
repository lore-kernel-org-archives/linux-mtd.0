Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qdcP-0006aY-00
	for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2002 18:55:37 +0100
Date: Sun, 15 Sep 2002 19:54:47 +0200
From: Erich Schubert <erich@debian.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: recommended Filesystem for DoC?
Message-ID: <20020915175447.GB15367@bombadil.xmldesign.de>
References: <20020915010056.GA916@buici.com> <20020914235138.GA28771@bombadil.xmldesign.de> <21231.1032076544@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21231.1032076544@redhat.com>
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

> The JFFS2 NAND support is almost complete -- just a few corner cases to be 
> fixed up. AFAIK it should work on DoC without too much trouble -- after 
> all, a DoC is just a bunch of NAND flash chips.

Can lilo or grub boot a system off a JFFS2 filesystem?
(with compression enabled... or i'll need my cramdiscs anyway)
Is the JFFS2 in 2.4.19 new enough, or do i need additional patches?
Which corner cases aren't fixed yet?

What are the drawbacks with ext2 on a DoC using nftl?
when i hopefully will never have to mount the filesystem rw?

Gruss,
Erich Schubert
-- 
        erich@(mucl.de|debian.org)        --        GPG Key ID: 4B3A135C
        To understand recursion you first need to understand recursion.
                Liebe ist eine schwere Geisteskrankheit (Platon)
            "Wissen ist Macht" - wenn man das richtige daraus macht.
