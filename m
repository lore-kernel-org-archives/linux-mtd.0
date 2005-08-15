Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4ae0-0005WM-R8
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 04:48:37 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Amit Sharma <amitsharma91@gmail.com>
In-Reply-To: <9185a3fa05081301087267b070@mail.gmail.com>
References: <9185a3fa05081301087267b070@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 15 Aug 2005 12:47:59 +0400
Message-Id: <1124095679.6148.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mount time an dfile size
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-08-13 at 17:08 +0900, Amit Sharma wrote:
> 1. how big file i can  access with jffs2 from NAND flash device
> because when i create big files in my device by mounting it response
> time increase and mount time too.I want to create 100Mb file file in
> my nand device for JFFS2 performance testing on my arm platform.

You may glance at the introduction chapters of the JFFS3 design document
(http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf) for a brief
overview of the JFFS2 scalability issues.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
