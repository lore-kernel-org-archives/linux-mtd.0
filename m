Received: from pxy3allmi.all.mi.charter.com ([24.247.15.42]
	helo=proxy3-grandhaven.chartermi.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbNwb-0000ry-Av
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 14:18:30 -0400
Received: from drewtech.com (24.247.83.26.bay.mi.chartermi.net [24.247.83.26])
	by proxy3-grandhaven.chartermi.net (8.11.7p1+Sun/8.11.6) with ESMTP
	id i5III3k20793 for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jun 2004 14:18:03 -0400 (EDT)
Message-ID: <40D331EB.80504@drewtech.com>
Date: Fri, 18 Jun 2004 14:18:19 -0400
From: Dan DeMaggio <dmag@drewtech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Idea for MTD CF-IDE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On the linux-mtd page ( http://www.linux-mtd.infradead.org/ ), it states 
"to the best of my knowledge [CompactFlash] doesn't have any alternative 
method of accessing the [raw] flash". Although this is true in the 
general case, it may be possible on some cards. For example, on the last 
page of the Samsumg ATA flash controller reference design manual, there 
are extensions to the ATA commands that allow access to the raw flash.

http://www.samsung.com/Products/Semiconductor/Flash/TechnicalInfo/ref_guide_010623.pdf

I think this means that someone could write an MTD driver for Samsung CF 
cards, allowing JFFS2 to run 'natively' on the card. It seems pretty 
straightforward to me, but I don't have time to work on it. I'm hoping 
that someone here gets a hankering to implement it, because I'd like to 
use it. ;)

-- 
Dan DeMaggio (dmag@drewtech.com)
Drew Technologies (810-231-3171)
