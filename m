Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Oj9A-0000gY-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 18:42:20 +0000
Subject: Re: problem using jffs2 on DiskOnChip
From: Russ Dill <Russ.Dill@asu.edu>
To: wolff@turnkiek.nl
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <001901c2a6c8$1c87ff60$446410ac@lt-gw8l30j.turnkiek.nl>
References: <001901c2a6c8$1c87ff60$446410ac@lt-gw8l30j.turnkiek.nl>
Content-Type: text/plain
Message-Id: <1040238853.2843.3.camel@timmy>
Mime-Version: 1.0
Date: 18 Dec 2002 12:14:13 -0700
Content-Transfer-Encoding: 7bit
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

On Wed, 2002-12-18 at 12:03, Carl Wolff wrote:
> Hello,
> 
> I've got a problem with jffs2. I'm using a DiskOnChip module type milennium.
> 
> Do I need NFTL support?
> I've managed to copy a jffs2 image onto the diskonchip using cp image
> /dev/mtd/0.

eraseall /dev/mtd/0

-- 
Russ Dill <Russ.Dill@asu.edu>
