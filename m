Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIaL9-0001Rf-Aw
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 13:50:12 +0000
Date: Tue, 15 May 2018 15:49:45 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Cardoen Pieter <P.Cardoen@TELEVIC.com>
Cc: "han.xu@nxp.com" <han.xu@nxp.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI nand flash ECC errors with mainline kernel
Message-ID: <20180515154945.5006f927@bbrezillon>
In-Reply-To: <HE1PR0702MB362877849767B637814CF9B6FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
References: <HE1PR0702MB362877849767B637814CF9B6FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
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

On Tue, 15 May 2018 11:46:32 +0000
Cardoen Pieter <P.Cardoen@TELEVIC.com> wrote:

> Dear
> 
> I am currently trying to use the mainline kernel on a custom imx6ul board with an SLC NAND flash device (29F4G08ABADAH4). When the rootfs is mounted, I get continuously ECC errors (see log below).
> 
> I am however sure that the rootfs is programmed. The device boots with an older kernel version on the same device.

Which version works? Is this a vendor tree or a mainline kernel? Looks
like the version that fails is 4.15. Are you sure the ECC config is
exactly the same between the old and new kernel?

> 
> I also noticed that with my previous kernel version, it used mtd->_read in function mtd_read while now it is using mtd->_read_oob.

It's unlikely to be the root cause for these ECC failures.
