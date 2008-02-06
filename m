Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMeyQ-0004Zt-FW
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 07:45:45 +0000
Date: Wed, 6 Feb 2008 08:44:44 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Jeff Hane <jhane@mobilygen.com>
Subject: Re: marking a block bad
In-Reply-To: <1202247599.11825.24.camel@qu062.quarc.com>
Message-ID: <Pine.LNX.4.64.0802060843420.24892@lnxricardw.se.axis.com>
References: <1202247599.11825.24.camel@qu062.quarc.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Feb 2008, Jeff Hane wrote:

> I am using yaffs for my root filesystem and I am getting some ECC
> errors for reads and writes.  What I'm trying to understand is what
> determines if a block has gone bad when the block is marked bad. I see
> the way to mark a block bad in the mtd code but not clear on when this
> will be used.
> Of course this leads to another problem, if a block is marked bad and
> the system is rebooted the data that was in that block would become
> unaccessible(assume the system can reboot).  In this case, is there
> something that can be done, by the filesystem or other methods, to try
> to re-locate the data before reboot or rebuilding the bbt?

People around here tend to know about mtd and jffs2, yaffs is a different=
=20
matter.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
