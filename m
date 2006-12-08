Received: from rubidium.solidboot.com ([81.22.244.175] helo=mail.solidboot.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GsbM4-0001r7-R5
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 03:45:20 -0500
Date: Fri, 8 Dec 2006 10:43:39 +0200
From: Timo Teras <timo.teras@solidboot.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: OneNAND: Update OOB free table
Message-ID: <20061208084339.GA20013@mail.solidboot.com>
References: <1216089.366391165536680515.JavaMail.weblogic@ep_ml03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1216089.366391165536680515.JavaMail.weblogic@ep_ml03>
Sender: timo.teras@solidboot.com
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Timo Teras <timo.teras@solidboot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Dec 08, 2006 at 12:11:06AM +0000, Kyungmin Park wrote:
> Yes, The OneNAND Spec. says these bytes are manged by internal ecc logic.
> Acutually it means that when we write some data in this area. The ecc logic generates the ecc bytes automatically.
> So even though we write 3 bytes. the OneNAND is written by 5 bytes (3 data bytes, 2 space ecc bytes).
> 
> I think we consider the whole spare area. if we don't use this area. we only have 8 bytes of 64 bytes in spare area.
> If it makes misbehavior of JFFS2, we have alternative method turn off ecc logic when write oob area.

Yes. The original problem was that when we wrote JFFS2 clean marker, the ECC
bytes changed which caused JFFS2 code to think the block unclean
effectively considering all clean and empty blocks as dirty at each boot.

> % original
> 
>  OOB Data: ff ff 85 19 03 ff ff ff ff ff ff 30 ff ff ff ff
> 
> % after patch
> 
>  OOB Data: ff ff 85 19 03 ff ff ff ff ff ff ff ff ff ff ff
> 
> Pleaes test this patch

I suppose this fixes the JFFS2 problem as well. 8 bytes of OOB data in a
page should be enough, but having more free OOB space is always a good thing.

Cheers,
  Timo
