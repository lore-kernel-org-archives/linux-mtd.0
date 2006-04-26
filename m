Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmbD-0004jk-5V
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:11:07 -0400
Date: Wed, 26 Apr 2006 18:08:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20060426160834.GO29108@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 April 2006 12:04:51 -0400, Nicolas Pitre wrote:
> On Wed, 26 Apr 2006, Belyakov, Alexander wrote:
> 
> > JFFS2 (and not only JFFS2) does not work on top of concatenated MTD
> > device in case of NAND and Sibley chips due to missing
> > concat_block_isbad(), concat_block_markbad(), concat_writev() and
> > concat_writev_ecc() functions. If anyone cares - the patch below fixes
> > that issue.
> 
> That won't work with Sibley.  You must call the underlying devices with 
> writev() as well, using the appropriate vector for each device, and only 
> once per subdevice.  Sibley flash must write everything all at once with 
> a single writev call.

Everything?  Not just in chunks of 1KiB?

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
