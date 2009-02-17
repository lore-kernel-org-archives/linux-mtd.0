Received: from v006910.home.net.pl ([212.85.123.52])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZKYS-0007HF-Hm
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 07:39:47 +0000
Message-ID: <499A69BA.6080005@wb.com.pl>
Date: Tue, 17 Feb 2009 08:39:38 +0100
From: "Adam S. Turowski" <a.turowski@wb.com.pl>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [UBIFS] Filesystem capacity
References: <49997BBF.7080906@wb.com.pl> <49998C2D.7000505@nokia.com>
	<1234850859.17790.213.camel@localhost.localdomain>
In-Reply-To: <1234850859.17790.213.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy pisze:
> Well, UBIFS does try to squeeze small nodes to the ends of eraseblocks.
> And I am not convinced it is worse than JFFS2 in this respect, unless
> someone shows this with a test. Where did you get those numbers?
> Did you try to measure how much you can really fit? Did you read this:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
> ?
> 

As I wrote in my first post, I used dd from /dev/urandom to create files 
and those were sizes of those files.
df also reports the same:
Filesystem                Size      Used Available Use% Mounted on
ubi0:root                24.9M     24.9M         0 100% /part_root
ubi1:data                22.4M     22.4M         0 100% /part_data

--
Regards,
Adam Turowski
