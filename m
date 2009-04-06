Received: from kroah.org ([198.145.64.141] helo=coco.kroah.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LqhdH-00025A-EO
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 05:44:49 +0000
Date: Sun, 5 Apr 2009 22:34:45 -0700
From: Greg KH <greg@kroah.com>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Message-ID: <20090406053445.GB19096@kroah.com>
References: <200903260042.42091.david-b@pacbell.net>
	<a95a62fe0904021641j17a7c26dv5652de4a19bad662@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a95a62fe0904021641j17a7c26dv5652de4a19bad662@mail.gmail.com>
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 02, 2009 at 04:41:47PM -0700, Kevin Cernekee wrote:
> Here is a follow-up patch to apply on top of David Brownell's original
> MTD driver model patch at:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2009-March/025005.html
> 
> Changes:
> 
> 1) Add more sysfs attributes: mtd_flags, mtd_size, mtd_erasesize,
> mtd_writesize, mtd_oobsize, mtd_numeraseregions, mtd_name .

When adding new sysfs attributes, please add the proper
Documentation/ABI/ information as well.

thanks,

greg k-h
