Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLn1e-0003bc-Tb
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 09:59:23 +0000
Date: Thu, 24 May 2018 11:59:00 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>
Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Issue while oops and panic message logging to MTD partition
Message-ID: <20180524115900.2ba9ff5a@bbrezillon>
In-Reply-To: <AM6PR04MB4053C5A6B67D587E177B53DD906A0@AM6PR04MB4053.eurprd04.prod.outlook.com>
References: <HE1PR0402MB2778B83183DA25027369540A90930@HE1PR0402MB2778.eurprd04.prod.outlook.com>
 <20180515140740.4f58911b@bbrezillon>
 <AM6PR04MB4053C5A6B67D587E177B53DD906A0@AM6PR04MB4053.eurprd04.prod.outlook.com>
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

On Thu, 24 May 2018 07:22:35 +0000
Jagdish Gediya <jagdish.gediya@nxp.com> wrote:

> Hi Boris,
> 
> I tried to test this feature on NOR flash as well however it is not
> working. There is nothing written on the mtd partition provided
> through mtdoops.mtddev. Is this the expected behavior?

It's probably not supported by the MTD driver. You can check which
drivers are supporting panic writes with 'git grep "\->_panic_write"'.

> 
> Has anyone tried to test mtdoops feature on nor flash?

I don't know if anyone has tried that, I certainly did not.
