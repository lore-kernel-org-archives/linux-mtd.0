Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 186rZf-0000Vw-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 12:03:52 +0000
Received: from idiom.com ([216.240.32.1] ident=root)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 186AvJ-00044h-00
	for linux-mtd@lists.infradead.org; Mon, 28 Oct 2002 14:31:24 +0000
Date: Mon, 28 Oct 2002 06:25:41 -0800
From: Geoffrey Espin <espin@idiom.com>
To: Jim Stewart <jstewart@celerox.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: intel 28F016B3 flash
Message-ID: <20021028142541.GA71586@idiom.com>
References: <1035466654.1993.19.camel@AladinSane>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1035466654.1993.19.camel@AladinSane>
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

On Thu, Oct 24, 2002 at 09:37:33AM -0400, Jim Stewart wrote:
> Can some one list for me the list of kernel configuration options/files
> needed to use the MTD with JFFS2 on the following system:
> 4 - TE28F016B3 flash chips connected as a 32 bit wide x 2Mb flash bank
> These chips do not support CFI and are physically connected to the
> processor memory bus (0x0C00_0000-0x0C7f_ffff)

I gutted the mtd/devices/lart.c driver and used it as a basis for
my single 16b wide part.

Geoff
-- 
Geoffrey Espin
espin@idiom.com
