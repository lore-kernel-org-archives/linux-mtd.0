Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cy905-0004iB-5H
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 08:32:26 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050207125500.GA25504@wohnheim.fh-wedel.de>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
	<20050202124043.GB23156@wohnheim.fh-wedel.de>
	<1107421396.32163.53.camel@fuzzie.sanpeople.com>
	<20050207125500.GA25504@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1107782843.28634.114.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 07 Feb 2005 15:27:23 +0200
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Jörn,
 
> > Since we don't need cleanmarkers on DataFlash, we return
> > BLK_STATE_CLEANMARKER from jffs2_scan_eraseblock() so that the block
> > rather gets added directly to the 'free_list'.
> 
> Why don't you need cleanmarkers?
> 
> With all other flash types, cleanmarkers catch the case where your
> power fails during flash erase.  If that happens, you cannot trust the
> eraseblock.  It could be fully erased, it could also just _look_ as if
> it was and fail later on.  Bad.
> 
> Now you claim that this is not the case for DataFlash.  So I'd like
> some explanation before I trust your code.

We don't need cleanmarkers since the DataFlash device will automatically
performs a page-erase before writing to the page.


Regards,
  Andrew Victor
