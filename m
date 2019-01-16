From: bbrezillon@kernel.org (Boris Brezillon)
Date: Wed, 16 Jan 2019 20:32:54 +0100
Subject: mtd: Implement mtd_{read, write}() as wrappers around mtd_{read,
 write}_oob()
In-Reply-To: <20181220141320.32226-1-boris.brezillon@bootlin.com>
Message-ID: <20190116193254.5208-1-bbrezillon@kernel.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2018-12-20 at 14:13:20 UTC, Boris Brezillon wrote:
> mtd_{read,write}_oob() already take care of checking the params and
> calling ->_{read,write}() or  ->_{read,write}_oob() based on the
> request and the operations supported by the MTD device.
> No need to duplicate the logic, we can simply implement
> mtd_{read,write}() as wrappers around mtd_{read,write}_oob().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
