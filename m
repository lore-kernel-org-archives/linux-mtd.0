Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f1mc-00055w-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 17:13:38 +0100
Date: Thu, 6 Sep 2001 17:19:34 +0100 (BST)
From: kira brown <kira@hex.linuxgrrls.org>
To: "Fry, Dan" <dfry@bb.directv.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 NAND support?
In-Reply-To: <617933180D08D311AB500090273F1F96026A354E@storm.corp.directvbroadband.net>
Message-ID: <Pine.LNX.4.33.0109061717360.9437-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Thu, 6 Sep 2001, Fry, Dan wrote:
> Also what's the best strategy for handling bad blocks in MTD.  Should NFTL
> be modified to eliminate its current dependency on DiskOnChip ECC hardware?

NFTL is not licenced for use on hardware not supplied by M-Systems,
basically;  of course this isn't a problem for those of us in the Free
World where the patent doesn't hold water, but it would cause problems for
anyone in the US.

kira.
