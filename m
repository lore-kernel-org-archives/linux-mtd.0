Received: from thor.lineo.com ([204.246.147.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ExQ5-0006eK-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 19:18:37 +0100
Message-ID: <3B38D2EF.AA20118D@Rikers.org>
Date: Tue, 26 Jun 2001 12:22:39 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: Simon Evans <spse@secret.org.uk>
CC: linux-mtd@lists.infradead.org
Subject: Re: Block device as MTD
References: <E15Eq9Y-0005cF-00@spoinky.secret.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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

I assume David will just integrate this into the stuff he maintains and
from there to the kernel sources. I'd like to test it as well.

Simon Evans wrote:
> 
> Hi,
> 
> I have written a mtd driver that makes a block device
> appear as an MTD device, ie you can use a floppy disk,
> hard disk or Compact flash as an MTD then put JFFS2 on
> top etc. The main reason for writing this was so I could
> put JFFS2 on a Compact Flash (which pretends to be an IDE drive),
> however it can be used as a test device for using JFFS2 on
> large devices (you should be able to use upto a 4gig block device)
> or floppy disks (ie eject the disk when it does a write for testing
>  jorunalling).
> 
> I have tested it on a floppy disk, and 96MB CF and it seems relatively
> stable.
> 
> What is the best procedure for releasing it.
> 
> cheers
> si
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
