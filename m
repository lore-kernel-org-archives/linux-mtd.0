Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZKq0-00019x-TB
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 07:57:55 +0000
Subject: Re: [UBIFS] Filesystem capacity
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Adam S. Turowski" <a.turowski@wb.com.pl>
In-Reply-To: <499A69BA.6080005@wb.com.pl>
References: <49997BBF.7080906@wb.com.pl>  <49998C2D.7000505@nokia.com>
	<1234850859.17790.213.camel@localhost.localdomain>
	<499A69BA.6080005@wb.com.pl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 09:57:46 +0200
Message-Id: <1234857466.17790.227.camel@localhost.localdomain>
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

On Tue, 2009-02-17 at 08:39 +0100, Adam S. Turowski wrote:
> Artem Bityutskiy pisze:
> > Well, UBIFS does try to squeeze small nodes to the ends of eraseblocks.
> > And I am not convinced it is worse than JFFS2 in this respect, unless
> > someone shows this with a test. Where did you get those numbers?
> > Did you try to measure how much you can really fit? Did you read this:
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
> > ?
> > 
> 
> As I wrote in my first post, I used dd from /dev/urandom to create files 
> and those were sizes of those files.
> df also reports the same:
> Filesystem                Size      Used Available Use% Mounted on
> ubi0:root                24.9M     24.9M         0 100% /part_root
> ubi1:data                22.4M     22.4M         0 100% /part_data

OK, then indeed Adrian wrote exactly the right thing. You have huge
4144-byte uncompressible nodes. You fit 3 of them to each eraseblock,
and you waste 3440 bytes in each eraseblock. JFFS2 would jam a little
more data, because it can split big blocks on parts.

In real life you will likely have compressible data, and many small
files, so you will have small data nodes and many inode nodes, which
are 160 bytes in size, so you will fit more.

However, I just agree with what Adrian said you in his replay.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
