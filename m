Received: from bay17-f16.bay17.hotmail.com ([64.4.43.66] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DvADH-0004y3-4z
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 04:46:20 -0400
Message-ID: <BAY17-F167D2FBC2A9CD84727C551E8D70@phx.gbl>
From: =?gb2312?B?1dQgtrm2uQ==?= <zhao_fusheng@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 20 Jul 2005 16:28:09 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: A problem in JFFS2 code about ECC'd NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

For ECC'd NOR flash, the clean marker is written by
jffs2_flash_direct_writev() in jffs2_mark_erased_block().
Then the first 16 bytes of first page is filled with
clean marker. But wbuf know nothing about this 16 bytes.
So subsequent jffs2_flash_writev() will have problem. In
particular jffs2_flash_writev() will write the first page
for the second time.
Am I right? Or can this be confirmed by the JFFS2 developer?

Thanks,
Forrest

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
