Subject: Re: [PATCH -mm] MTD: fix plat-ram printk format
From: David Woodhouse <dwmw2@infradead.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20070425224134.d4a21c2d.randy.dunlap@oracle.com>
References: <20070425224134.d4a21c2d.randy.dunlap@oracle.com>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 07:29:18 +0100
Message-Id: <1177568958.2755.270.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-04-25 at 22:41 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> drivers/mtd/maps/plat-ram.c:172: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Applied; thanks.

-- 
dwmw2
