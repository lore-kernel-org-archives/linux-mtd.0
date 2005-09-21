Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHyxz-0007VY-CY
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 03:24:38 -0400
From: Andrew Victor <andrew@sanpeople.com>
To: dedekind@infradead.org
In-Reply-To: <1127233915.20014.76.camel@sauron.oktetlabs.ru>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>
	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<43300C08.80005@yandex.ru> <433010D8.7000209@mw-itcon.de>
	<1127225899.20014.61.camel@sauron.oktetlabs.ru>
	<43302456.4080601@mw-itcon.de>
	<1127229060.17496.128.camel@fuzzie.sanpeople.com>
	<1127233915.20014.76.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Message-Id: <1127287279.25521.866.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 21 Sep 2005 09:21:19 +0200
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
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

hi Artem,

> > To reduce the number of erase blocks, JFFS2 may also concatenate a
> > number of erase-blocks in a 'virtual block'.  That is what sector_size
> > and wbuf_pagesize might get set to.
> Yes, right. Albeit this is fixed, this doesn't matter.
> 
> The question is *why you set wbuf size = eraseblock size?

I don't.  I set the wbuf_pagesize to the sector_size.
(Which at that time was 1 or more eraseblocks.  And I think sector_size
is/was the smallest unit of flash that JFFS2 would ever erase/write).


> In case of
> DataFlash, I assume, wbuf_size = DataFlash page size (the minimal
> writing unit). Eraseblock size must be = DataFlash block size.

Maybe there is some confusion here.  Dataflash has both 'pages' and
'blocks'.  With a 'page' being the smallest unit that can be
erased/written.

The MTD-device's erasesize is therefore set to the smallest unit - the
Dataflash page size (528 or 1056, depending on device)


> Yes, it is theoretically correct to set write buffer size = eraseblock
> size, but this is *really* bad. This is wasteful (imagine, any sync will
> will add lots of padding and waste the whole eraseblock).

Dataflash does not use Padding nodes.


> And, the size wbuf has nothing to do with "concatenate number of
> eraseblocks", whare is the relation?

Maybe it would be more optimal to set the wbuf_size to eraseblocksize? 
I don't know.

I do know that JFFS2-on-Dataflash was working fine when I committed the
changes in February.


Regards,
  Andrew Victor
