Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHjx1-0000sK-EW
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 11:22:44 -0400
Date: Tue, 20 Sep 2005 17:22:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Victor <andrew@sanpeople.com>
Message-ID: <20050920152233.GE4634@wohnheim.fh-wedel.de>
References: <43292E16.70401@yandex.ru> <43292F91.9010302@mw-itcon.de>
	<432FE1EF.9000807@yandex.ru> <432FEF55.5090700@mw-itcon.de>
	<433006D8.4010502@yandex.ru> <43300C08.80005@yandex.ru>
	<433010D8.7000209@mw-itcon.de>
	<1127225899.20014.61.camel@sauron.oktetlabs.ru>
	<43302456.4080601@mw-itcon.de>
	<1127229060.17496.128.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127229060.17496.128.camel@fuzzie.sanpeople.com>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	Peter Menzebach <pm-mtd@mw-itcon.de>
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 September 2005 17:11:00 +0200, Andrew Victor wrote:
> 
> > How can this reported from the flash device to the mtd layer and then to 
> > jffs2?
> 
> Via mtd_info.erasesize
> 
> > In the code, I see at the moment only, that in the device driver 
> > mtd_info.erasesize is set, later on in jffs2 I see, that this has become 
> > the sector_size, which becomes then the wbuf_pagesize.
> 
> To reduce the number of erase blocks, JFFS2 may also concatenate a
> number of erase-blocks in a 'virtual block'.  That is what sector_size
> and wbuf_pagesize might get set to.

Not any more.  That strategy can cause data loss and other fun things
which we don't want.

> > Is here mtd_info.ooblock to be set?
> 
> No.  All bytes on a DataFlash device are directly addressable, so there
> is not really an OOB area.

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
