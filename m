Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1616xn-00081P-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 14:12:27 +0000
Date: Tue, 6 Nov 2001 15:21:27 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: joakim.tjernlund@lumentis.se, linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Message-ID: <20011106152127.B31698@wohnheim.fh-wedel.de>
References: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> <3fab01c166cb$c9155fe0$0a070d0a@axis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fab01c166cb$c9155fe0$0a070d0a@axis.se>; from johan.adolfsson@axis.com on Tue, Nov 06, 2001 at 03:03:18PM +0100
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

Hi!

> Perhaps we should give the erase command a "jffs2-format" option
> so that it erases and writes the proper erase marker on the sectors to prevent
> JFFS2 to erase them again?
> The erase ulitity should then also skip erasing sectors that has the erased 
> marker already which might speed up the erase a little.
> I guess copying an image to the formatted flash should work even if it contains
> erase marks?

1) Beware of featuritis. This is just a hack for the explained
problem, depends on the fs used (jffs2) and does not give any real new
functionality. Might be good for the sales department, though. :)

Yesterday, I scrambled a fs because it was recognized as jffs (1),
deleted and empty afterwards. Solution? Don't use jffs1 any more and
be smarter next time.

2) Flash is a write-once medium. You cannot overwrite the markers, you
have to delete again.

Jörn

-- 
A defeated army first battles and then seeks victory.
	Sun Tzu
