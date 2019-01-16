From: miquel.raynal@bootlin.com (Miquel Raynal)
Date: Wed, 16 Jan 2019 11:54:35 +0100
Subject: [PATCH] mtd: Implement mtd_{read,write}() as wrappers around
 mtd_{read,write}_oob()
In-Reply-To: <20181220141320.32226-1-boris.brezillon@bootlin.com>
References: <20181220141320.32226-1-boris.brezillon@bootlin.com>
Message-ID: <20190116115435.139eb78a@xps13>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 20 Dec 2018
15:13:20 +0100:

> mtd_{read,write}_oob() already take care of checking the params and
> calling ->_{read,write}() or  ->_{read,write}_oob() based on the
> request and the operations supported by the MTD device.
> No need to duplicate the logic, we can simply implement
> mtd_{read,write}() as wrappers around mtd_{read,write}_oob().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

I will base my ongoing works on top of this patch:
* MTD partition tree
* mtd_{read,write} -> mtd_io() rework


Thanks,
Miqu?l
