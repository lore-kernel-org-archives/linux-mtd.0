Received: from ms-smtp-03.rdc-kc.rr.com ([24.94.166.129])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BT7yp-0000JG-VV
	for linux-mtd@lists.infradead.org; Wed, 26 May 2004 19:38:41 -0400
From: Dan Eisenhut <deisenhut@wi.rr.com>
To: tglx@linutronix.de
In-Reply-To: <200405262326.29385.tglx@linutronix.de>
References: <77FE4A1FA59FF947845A42194AD6676202E30F72@uswaumsx07medge.med.ge.com>
	<200405262326.29385.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1085614713.9876.4.camel@localhost>
Mime-Version: 1.0
Date: Wed, 26 May 2004 18:38:34 -0500
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Accessing an MTD device from kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-05-26 at 16:26, Thomas Gleixner wrote:
> Just use the mtd API which is used from fs drivers and anything else which 
> accessed the mtd devices from kernel space
> 
> mtd->read(....), mtd->erase(...) 

Thanks...  I dug through the fs/jffs2 directory and figured out how to
use the get_mtd_device() and mtd->read() functions.  Its working great.

Dan
