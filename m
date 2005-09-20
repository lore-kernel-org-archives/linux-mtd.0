Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHjpD-0000aq-LQ
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 11:15:35 -0400
From: Andrew Victor <andrew@sanpeople.com>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
In-Reply-To: <43302456.4080601@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>
	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<43300C08.80005@yandex.ru> <433010D8.7000209@mw-itcon.de>
	<1127225899.20014.61.camel@sauron.oktetlabs.ru>
	<43302456.4080601@mw-itcon.de>
Content-Type: text/plain
Message-Id: <1127229060.17496.128.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 20 Sep 2005 17:11:00 +0200
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
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

> How can this reported from the flash device to the mtd layer and then to 
> jffs2?

Via mtd_info.erasesize


> In the code, I see at the moment only, that in the device driver 
> mtd_info.erasesize is set, later on in jffs2 I see, that this has become 
> the sector_size, which becomes then the wbuf_pagesize.

To reduce the number of erase blocks, JFFS2 may also concatenate a
number of erase-blocks in a 'virtual block'.  That is what sector_size
and wbuf_pagesize might get set to.


> Is here mtd_info.ooblock to be set?

No.  All bytes on a DataFlash device are directly addressable, so there
is not really an OOB area.


Regards,
  Andrew Victor
