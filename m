Received: from cbshost-12-155-143-237.sbcox.net ([12.155.143.237]
	helo=sb-lnx3.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VCfN-0003ZT-HI
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 16:58:37 +0100
Date: Wed, 25 Jun 2003 08:58:46 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: Jasmine Strong <jasmine@regolith.co.uk>
Message-ID: <20030625155846.GA15628@rinconnetworks.com>
References: <20030625154815.GA15437@rinconnetworks.com>
	<0985322B-A725-11D7-A51A-000393AD6294@regolith.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0985322B-A725-11D7-A51A-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: No space left on almost empty JFFS2 filesystem
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 25, 2003 at 04:52:34PM +0100, Jasmine Strong wrote:
> JFFS2 filesystems require a certain number of erase blocks reserved for
> garbage collection before you can write anything to them.
I see. 1 Block will indeed never be enough then. Shows my ignorance ;-).

Thanks.

Paul 
-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
