Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQYvj-00042j-Mz
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 13:56:53 +0000
Date: Wed, 6 Jun 2018 15:56:29 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>, Ying Zhang
 <ying.zhang22455@nxp.com>, Alban Bedel <albeu@free.fr>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Subject: Re: Accessing mtd partitions from driver/i2c
Message-ID: <20180606155629.2c2a2e45@bbrezillon>
In-Reply-To: <VI1PR0402MB38542B5CEB150AD440FFA62B97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <VI1PR0402MB38545D0A442329D88E4BAF7A97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
 <20180606092250.2d600a89@bbrezillon>
 <VI1PR0402MB38542B5CEB150AD440FFA62B97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
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

+Alban and Srinivas

On Wed, 6 Jun 2018 13:44:32 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Dear Borris,
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Wednesday, June 6, 2018 12:53 PM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > Cc: linux-mtd@lists.infradead.org; marek.vasut@gmail.com; Poonam
> > Aggrwal <poonam.aggrwal@nxp.com>; Ashish Kumar
> > <ashish.kumar@nxp.com>; Ying Zhang <ying.zhang22455@nxp.com>
> > Subject: Re: Accessing mtd partitions from driver/i2c
> > 
> > Hi Prabhakar,
> > 
> > On Wed, 6 Jun 2018 05:02:47 +0000
> > Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
> >   
> > > Hi All,
> > >
> > > We have a requirement of using(read/write) one mtd partition from
> > > driver/i2c.
> > >
> > > As per my googling  mtd->_read, mtd->_write APIs has not been
> > > used  
> > anywhere other than driver/mtd layer.
> > 
> > It's used by at least one filesystem (JFFS2). And you should not
> > look for mtd-  
> > >_xxx() users but mtd_xxx() users. You should never access the mtd
> > >hooks  
> > directly but the wrappers that are exposed by the MTD API
> > (mtd_read(), mtd_write(), mtd_erase(), ...).
> >   
> 
> I can find it's usage in driver/firmware/ folder. Looks like it is
> using nvram.
> 
> > BTW, what's your use case? If it's about reading a piece of
> > information from a RO partition, then the work initiated by Alban
> > [1] and exposing some MTD parts are NVMEM providers should be a
> > better match. 
> 
> Currently, Linux has i2c slave framework. It is reading/writing to
> DDR emulated as EEPROM (drivers/i2c/i2c-slave-eeprom.c). We want
> something similar, where DDR will be replaced by MTD partitions for
> read/write. 

Then NVMEM is the solution you're looking for. Alban, Srinivas, can you
agree on something regarding the DT bindings so that we can finally get
this feature merged?

Thanks,

Boris
