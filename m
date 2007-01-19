Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7rzG-0006mz-7r
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 06:32:53 -0500
Date: Fri, 19 Jan 2007 12:32:35 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Stefan Roese <ml@stefan-roese.de>
Subject: Re: [PATCH] [MTD] physmap: Add support for 64 bit resources
Message-ID: <20070119113235.GA27947@xi.wantstofly.org>
References: <200701190840.26315.ml@stefan-roese.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200701190840.26315.ml@stefan-roese.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 19, 2007 at 08:40:04AM +0100, Stefan Roese wrote:

> [PATCH] [MTD] physmap: Add support for 64 bit resources
> 
> This patch adds support for 64 bit resources enabled via the
> CONFIG_RESOURCES_64BIT option. Now a 64 bit can be passed to the
> physmap driver.

Looks much cleaner to me.  :-)


> Signed-off-by: Stefan Roese <sr@denx.de>

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
