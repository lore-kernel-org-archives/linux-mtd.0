Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQSmm-0002Vv-3r
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 07:23:13 +0000
Date: Wed, 6 Jun 2018 09:22:50 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>, Ying Zhang
 <ying.zhang22455@nxp.com>
Subject: Re: Accessing mtd partitions from driver/i2c
Message-ID: <20180606092250.2d600a89@bbrezillon>
In-Reply-To: <VI1PR0402MB38545D0A442329D88E4BAF7A97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <VI1PR0402MB38545D0A442329D88E4BAF7A97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Prabhakar,

On Wed, 6 Jun 2018 05:02:47 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Hi All,
> 
> We have a requirement of using(read/write) one mtd partition from driver/i2c. 
> 
> As per my googling  mtd->_read, mtd->_write APIs has not been used anywhere other than driver/mtd layer.

It's used by at least one filesystem (JFFS2). And you should not look
for mtd->_xxx() users but mtd_xxx() users. You should never access the
mtd hooks directly but the wrappers that are exposed by the MTD API
(mtd_read(), mtd_write(), mtd_erase(), ...).

BTW, what's your use case? If it's about reading a piece of information
from a RO partition, then the work initiated by Alban [1] and exposing
some MTD parts are NVMEM providers should be a better match.

> Do we have any such framework/use case available in Linux which can be referred.
> 
> Any pointer/clue will be helpful

I don't know what you want to do with the MTD device exactly, so it's
hard to tell.

Regards,

Boris

[1]https://patchwork.ozlabs.org/project/linux-mtd/list/?series=35728
