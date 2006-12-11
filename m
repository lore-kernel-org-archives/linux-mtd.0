Received: from rubidium.solidboot.com ([81.22.244.175] helo=mail.solidboot.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gtk8r-00006G-EA
	for linux-mtd@lists.infradead.org; Mon, 11 Dec 2006 07:20:24 -0500
Date: Mon, 11 Dec 2006 14:20:01 +0200
From: Timo Teras <timo.teras@solidboot.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: OneNAND: Update OOB free table
Message-ID: <20061211122001.GA28125@mail.solidboot.com>
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

On Fri, Dec 08, 2006 at 12:11:06AM +0000, Kyungmin Park wrote:
> I think we consider the whole spare area. if we don't use this area. we
> only have 8 bytes of 64 bytes in spare area. If it makes misbehavior of
> JFFS2, we have alternative method turn off ecc logic when write oob area.
> 
> % original
> 
>  OOB Data: ff ff 85 19 03 ff ff ff ff ff ff 30 ff ff ff ff
> 
> % after patch
> 
>  OOB Data: ff ff 85 19 03 ff ff ff ff ff ff ff ff ff ff ff
> 
> Pleaes test this patch

Tested. This breaks reading OOB area and the clean marker from there. After
OOB has been written without ECC it must be read without ECC too or
we start to get ECC errors.

Cheers,
  Timo
