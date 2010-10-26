Received: from mga02.intel.com ([134.134.136.20])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAgmW-0005Uw-A5
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 10:29:29 +0000
Subject: Re: [PATCH 2 2/3] mtd: cfi_cmdset_0002: add CFI detection for SST
	38VF640x chips
From: David Woodhouse <david.woodhouse@intel.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20101026102548.GB31843@pengutronix.de>
References: <20101026092626.5790.91523.stgit@dev.siriade.com>
	<20101026092631.5790.95453.stgit@dev.siriade.com>
	<20101026102548.GB31843@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Oct 2010 11:29:17 +0100
Message-ID: <1288088957.29264.24.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"zhangyd6@gmail.com" <zhangyd6@gmail.com>,
	"fggs@terra.com.br" <fggs@terra.com.br>,
	Guillaume LECERF <glecerf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-26 at 11:25 +0100, Wolfram Sang wrote:
> > +	/*
> > +	 * CFI reports 1024 sectors (0x03ff +1) of 64KBytes (0x0100 *256) where
> > +	 * it should report a size of 8KBytes (0x0020 *256).
> 
> Spaces after operators?
> 
> > +	 */
> > +	cfi->cfiq->EraseRegionInfo[0] = 0x002003ff;
> > +	pr_warning("%s: Bad 38VF640x CFI data, adjust sector size from 64 to 8KBytes\n", mtd->name);
> 
> Should be "adjusting", otherwise it sounds like a task for the user to do.

And s/KBytes/KiB/ while we're nitpicking.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
