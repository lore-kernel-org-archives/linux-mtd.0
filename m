Received: from cbshost-12-155-143-237.sbcox.net ([12.155.143.237]
	helo=sb-lnx3.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VEsH-00044p-6I
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 19:20:05 +0100
Date: Wed, 25 Jun 2003 11:20:20 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: Jasmine Strong <jasmine@regolith.co.uk>
Message-ID: <20030625182020.GA15879@rinconnetworks.com>
References: <20030625154815.GA15437@rinconnetworks.com>
	<0985322B-A725-11D7-A51A-000393AD6294@regolith.co.uk>
	<20030625155846.GA15628@rinconnetworks.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030625155846.GA15628@rinconnetworks.com>
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

So I tried:

mkfs.jffs2 --pad=0x80000 --little-endian --squash -e 0x20000 -d /home/vangool/jffs -o jffs.img

thinking that that would give me 3 erase blocks but I still get the
same error. Am I doing something wrong?

Thanks.

Paul


On Wed, Jun 25, 2003 at 08:58:46AM -0700, Paul van Gool wrote:
> On Wed, Jun 25, 2003 at 04:52:34PM +0100, Jasmine Strong wrote:
> > JFFS2 filesystems require a certain number of erase blocks reserved for
> > garbage collection before you can write anything to them.
> I see. 1 Block will indeed never be enough then. Shows my ignorance ;-).
> 
> Thanks.
> 
> Paul 
> -- 
> Paul van Gool                                               Rincon Networks
> paul.vangool@rinconnetworks.com                              (805)-705-1442
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
