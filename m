Received: from exprod7og110.obsmtp.com ([64.18.2.173])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRsF0-0000n3-PM
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 16:56:19 +0000
Date: Wed, 20 Feb 2008 16:55:13 +0000
From: Stephane Chazelas <stephane.chazelas@emerson.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <chaz20080220165513.GU4539@artesyncp.com>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<20080212152124.GA21878@lazybastard.org>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
	<chaz20080220143646.GJ4539@artesyncp.com>
	<20080220164226.GF5539@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080220164226.GF5539@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008-02-20 17:42:27 +0100, Jörn Engel:
> On Wed, 20 February 2008 14:36:46 +0000, Stephane Chazelas wrote:
> > 
> > At the moment, when we bind a mtd device to a block device, we
> > don't increase the refcount. When a mtdblock on a block2mtd, the
> > refcount is not increased either (the mtdblock's one is I
> > guess).
> 
> That is a bug then.
[...]

Well, given that there is no API to unbind a mtd to a block
device, otherwise, we would never be able to unload block2mtd.
So fare, unloading block2mtd was the only way to unbind a mtd
from a block device.

Cheers,
Stephane
