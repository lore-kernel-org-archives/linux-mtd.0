Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zry0-0006ZQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:48:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <712.1028114549@www55.gmx.net> 
References: <712.1028114549@www55.gmx.net>  <14743.1028068151@redhat.com> 
To: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Root-FS on DOC2000 (was Re: Compiling Grub for DOC2000) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 12:48:35 +0100
Message-ID: <3243.1028116115@redhat.com>
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

frank.oltmanns.ml@gmx.de said:
> > Remove the bogus invalidate_device() from the mtdblock_release()
> > function in drivers/mtd/mtdblock.c.
> I did, but nothing happened.

Bah. Do what I mean, not what I say. 

Which, in this instance, means:

	Remove the bogus invalidate_device() from the nftl_release() 
	function in drivers/mtd/nftlcore.c

Sorry.

--
dwmw2
