Received: from bay17-f4.bay17.hotmail.com ([64.4.43.54] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIdqW-00037n-I8
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 23:05:40 -0400
Message-ID: <BAY17-F4C91E73BC95A9EE314ACFE8960@phx.gbl>
In-Reply-To: <20050922140223.GB6854@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, dedekind@infradead.org
Date: Fri, 23 Sep 2005 11:03:29 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > Can you explain "when JFFS2 has detected that the image is an old
> > > image" in C?
> > Well, we may even do better. Scan FS. If we meet any node which crosses
> > the eraseblock boundary - bye bye. That must be easy to implement as
> > node headers contain the total node length.
>
>Sounds fine.  Yes, that appears to be the best solution.
>
This solution has been in my patch.

Until now we only disscussed one aspect of the problem.
Another aspect is that what should we do when users mount new JFFS2 image
with old JFFS2 code? Is the "big warning" in readme enough? Or we should
let old JFFS2 code reject mounting new JFFS2 image?

Thanks,
Forrest
