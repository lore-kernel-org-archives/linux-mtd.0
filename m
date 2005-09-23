Received: from bay17-f31.bay17.hotmail.com ([64.4.43.81] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIdkS-0002vq-2N
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 03:57:16 +0100
Message-ID: <BAY17-F31136691CA372165BD3066E8960@phx.gbl>
In-Reply-To: <20050922140223.GB6854@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, dedekind@infradead.org
Date: Fri, 23 Sep 2005 10:56:56 +0800
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
