Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C39ZN-0003oB-4S
	for linux-mtd@lists.infradead.org; Fri, 03 Sep 2004 04:37:19 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Nick Bane <nick@cecomputing.co.uk>
In-Reply-To: <IDEJKGNLJIGGPDGEHFGBKEADEBAA.nick@cecomputing.co.uk>
References: <IDEJKGNLJIGGPDGEHFGBKEADEBAA.nick@cecomputing.co.uk>
Content-Type: text/plain
Message-Id: <1094200720.3681.3.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Fri, 03 Sep 2004 10:38:40 +0200
Content-Transfer-Encoding: 7bit
Cc: "Balloon@Balloonboard.Org" <balloon@balloonboard.org>,
	yaffs list <yaffs@toby-churchill.org>,
	"Linux-Mtd@Lists.Infradead.Org" <linux-mtd@lists.infradead.org>
Subject: Re: yaffs update#2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-09-02 at 19:56, Nick Bane wrote:
> Hi folks,
> There are moves afoot to submit yaffs to mainstream linux. 
> All opinions about suitability/maturity welcome. The kernel 
> mtd layer and yaffs_mtdif have now harmonised so now seems 
> a good moment.

Can we look into use the automatic placement of OOB data. Then it would
be using the same mechanisms as JFFS2 and it would be easy to use YAFFS
on DOC and other devices which cannot use the fixed OOB layout scheme ?

tglx
