Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1uRh-0006B1-Ng
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 14:24:15 +0000
Date: Mon, 17 Sep 2018 16:24:02 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, stable@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: partitions: fix of_node_get/put balance in parser
Message-ID: <20180917162402.10cc8994@bbrezillon>
In-Reply-To: <20180917160318.37afd433@xps13>
References: <20180907143554.13496-1-miquel.raynal@bootlin.com>
 <20180907163824.6cec1a43@xps13>
 <20180910145312.3b9ae4ad@bbrezillon>
 <20180910151423.2944aca6@xps13>
 <20180910152551.23ffa474@bbrezillon>
 <20180910153831.0f426ada@xps13>
 <20180910154219.30fddb7a@bbrezillon>
 <20180917115520.7cceef50@xps13>
 <20180917155140.33fb4cc1@bbrezillon>
 <20180917160318.37afd433@xps13>
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

On Mon, 17 Sep 2018 16:03:18 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 17 Sep 2018
> 15:51:40 +0200:
> 
> > On Mon, 17 Sep 2018 11:55:20 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > > Or you just say that mtd_get_of_node() does not retain a reference to
> > > > the device_node object it returns and that should be enough ;-).      
> > > 
> > > Fine by me, you can apply it and modify in place.    
> > 
> > Here is the new commit message:
> > 
> > "
> > mtd: partitions: fix unbalanced of_node_get/put()
> > 
> > While at first mtd_part_of_parse() would just call
> > of_get_chil_by_name(), it has been patched to deal with sub-partitions
> > and will now directly manipulate the node returned mtd_get_of_node() if  
> 
>                                                     ^by
> 
> > the MTD device is a partition.
> > 
> > A of_node_put() was a bit below in the code, to balance the
> > of_get_child_by_name(). However, despite its name, mtd_get_of_node()
> > does not take a reference on the OF node. It is a simple helper
> > hiding some pointer logic to retrieve the OF node related to an MTD
> > device.
> >     
> > The direct effect of such unbalanced reference counting is visible
> > by rmmod'ing any module that would have added MTD partitions:
> > 
> > 	OF: ERROR: Bad of_node_put() on <of_path_to_partition>
> > 
> > As it seems normal to get a reference on the OF node during the
> > of_property_for_each_string() that follows, add a call to
> > of_node_get() when relevant.
> >     
> > Fixes: 76a832254ab0 ("mtd: partitions: use DT info for parsing partitions with "compatible" prop")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > "
> > 
> > Let me know if you're okay with this update.  
> 
> One missing work, otherwise I'm ok.

Fixed and pushed.

Thanks,

Boris
