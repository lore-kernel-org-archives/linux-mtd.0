Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHl2m-0002N0-Tc
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 12:32:48 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1127229060.17496.128.camel@fuzzie.sanpeople.com>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>
	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<43300C08.80005@yandex.ru> <433010D8.7000209@mw-itcon.de>
	<1127225899.20014.61.camel@sauron.oktetlabs.ru>
	<43302456.4080601@mw-itcon.de>
	<1127229060.17496.128.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Tue, 20 Sep 2005 20:31:55 +0400
Message-Id: <1127233915.20014.76.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	Peter Menzebach <pm-mtd@mw-itcon.de>
Subject: Re: data  loss on jffs2 filesystem on dataflash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew,

On Tue, 2005-09-20 at 17:11 +0200, Andrew Victor wrote:
> > In the code, I see at the moment only, that in the device driver 
> > mtd_info.erasesize is set, later on in jffs2 I see, that this has become 
> > the sector_size, which becomes then the wbuf_pagesize.
> 
> To reduce the number of erase blocks, JFFS2 may also concatenate a
> number of erase-blocks in a 'virtual block'.  That is what sector_size
> and wbuf_pagesize might get set to.
Yes, right. Albeit this is fixed, this doesn't matter.

The question is *why you set wbuf size = eraseblock size?* In case of
DataFlash, I assume, wbuf_size = DataFlash page size (the minimal
writing unit). Eraseblock size must be = DataFlash block size.

Yes, it is theoretically correct to set write buffer size = eraseblock
size, but this is *really* bad. This is wasteful (imagine, any sync will
will add lots of padding and waste the whole eraseblock).

And, the size wbuf has nothing to do with "concatenate number of
eraseblocks", whare is the relation?

> > Is here mtd_info.ooblock to be set?
> 
> No.  All bytes on a DataFlash device are directly addressable, so there
> is not really an OOB area.
Stop, mtd_info.ooblock is the size of NAND page in case of NAND. I would
read it as 'the size of block which contains OOB'. Agree, not very good
name.

So, I offered to fill mtd_info.ooblock by the size of DataFlash page,
and set.

Comments? Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
