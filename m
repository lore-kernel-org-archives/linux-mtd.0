Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EISAb-0008CF-K0
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 10:36:01 -0400
From: Andrew Victor <andrew@sanpeople.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <4332BA7E.3060409@yandex.ru>
References: <432812E8.2030807@mw-itcon.de> <4332A3E8.8020002@mw-itcon.de>
	<1127393059.20014.105.camel@sauron.oktetlabs.ru>
	<4332B24F.2050305@mw-itcon.de>  <4332BA7E.3060409@yandex.ru>
Content-Type: text/plain
Message-Id: <1127399523.6125.79.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 22 Sep 2005 16:32:03 +0200
Content-Transfer-Encoding: 7bit
Cc: Peter Menzebach <pm@mw-itcon.de>, linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

> > Problem is here, how does the user get the information about the erase 
> > size used by jffs2?
> He detects that the flash is DataFlash (mtd->type == MTD_DATAFLASH). 
> Afterwards he knows, that
> 1. mtd->erasesize is the size of DataFlash block
> 2. mtd->oobblock is the size of DataFlash page

No.  You can't change mtd->erasesize.
There are other existing applications that access the raw MTD layer and
want the real erasesize.


> Sorry, didn't get it. I mean, MTD provide information about both 
> DataFlash block size and DataFlash page size. That's obvious.

This magic minimum block size could always be calculated in JFFS2 (in
jffs2_dataflash_setup).  It is a JFFS2-specific value.
Just calculate an 'N' where:
   (N * mtd->erasesize) >= jffs2_minimum_block_size
and
   (mtd->size % (N * mtd->erasesize)) == 0


Regards,
  Andrew Victor
