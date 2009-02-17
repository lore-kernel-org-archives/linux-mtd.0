Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZJ7U-00058m-SO
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 06:07:51 +0000
Subject: Re: [UBIFS] Filesystem capacity
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Adam S. Turowski" <a.turowski@wb.com.pl>
In-Reply-To: <49998C2D.7000505@nokia.com>
References: <49997BBF.7080906@wb.com.pl>  <49998C2D.7000505@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 08:07:39 +0200
Message-Id: <1234850859.17790.213.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-02-16 at 17:54 +0200, Adrian Hunter wrote:
> Adam S. Turowski wrote:
> > Hi,
> > Can anyone explain differences in filesystem capacity between jffs2 and
> > ubifs?
> > Kernel 2.6.28
> > mtd3 29MB nor flash
> > mtd4 31MB nand flash
> > File created by dd-ing from /dev/urandom:
> > jffs2:
> > nor: 28361 kB
> > nand: 31200 kB
> > 
> > ubifs:
> > one volume created on mtd3
> > UBIFS: mounted UBI device 0, volume 0, name "root"
> > UBIFS: file system size:   28676736 bytes (28004 KiB, 27 MiB, 219 LEBs)
> > UBIFS: journal size:       1440384 bytes (1406 KiB, 1 MiB, 11 LEBs)
> > UBIFS: media format:       4 (latest is 4)
> > UBIFS: default compressor: LZO
> > UBIFS: reserved for root:  1417227 bytes (1384 KiB)
> > 
> > one volume created on mtd4
> > UBIFS: mounted UBI device 1, volume 0, name "data"
> > UBIFS: file system size:   31870976 bytes (31124 KiB, 30 MiB, 2008 LEBs)
> > UBIFS: journal size:       1603072 bytes (1565 KiB, 1 MiB, 101 LEBs)
> > UBIFS: media format:       4 (latest is 4)
> > UBIFS: default compressor: LZO
> > UBIFS: reserved for root:  1575089 bytes (1538 KiB)
> > 
> > nor: 26960 kB (I can live with that)
> > nand: 23552 kB (With that I cannot)
> > 
> > Any suggestions?
> 
> It is because the LEB size is relatively small, and UBIFS does not
> fit data into the ends of eraseblocks the way JFFS2 does.  Your options
> are:

Well, UBIFS does try to squeeze small nodes to the ends of eraseblocks.
And I am not convinced it is worse than JFFS2 in this respect, unless
someone shows this with a test. Where did you get those numbers?
Did you try to measure how much you can really fit? Did you read this:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
