Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18OxDK-000277-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 09:43:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001901c2a6c8$1c87ff60$446410ac@lt-gw8l30j.turnkiek.nl> 
References: <001901c2a6c8$1c87ff60$446410ac@lt-gw8l30j.turnkiek.nl> 
To: wolff@turnkiek.nl
Cc: linux-mtd@lists.infradead.org
Subject: Re: problem using jffs2 on DiskOnChip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Dec 2002 10:14:10 +0000
Message-ID: <12900.1040292850@passion.cambridge.redhat.com>
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

wolff@turnkiek.nl said:
> Short read: 0x10 bytes at 0x000001f0 instead of requested 44 

The DiskOnChip hardware driver hasn't been used much with anything other 
than NFTL. It appears not to do a full read if you ask it to read a range 
of data which crosses a page boundary. Fix it accordingly by putting an 
appropriate loop in instead of...

        /* Don't allow a single read to cross a 512-byte block boundary */
        if (from + len > ((from | 0x1ff) + 1))
                len = ((from | 0x1ff) + 1) - from;

--
dwmw2
