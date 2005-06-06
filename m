Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfIQJ-00016Z-Mc
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 10:18:03 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050606140010.GE31739@wohnheim.fh-wedel.de>
References: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
	<20050606131534.GC31739@wohnheim.fh-wedel.de>
	<42A45382.5080301@yandex.ru>
	<20050606140010.GE31739@wohnheim.fh-wedel.de>
Content-Type: text/plain
Date: Mon, 06 Jun 2005 18:17:16 +0400
Message-Id: <1118067436.5629.18.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS3 superblock search
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> There are valid reasons to use 512 byte blocks instead.  Most likely I
> will do just that for logfs, just as a hint.  Therefore, even with 8
> byte keys, you'd be down to 32^4 or about a million.  Prepare for more
> levels.
It might make sense to have leafs = 4K (like the RAM page) and non-leafs
= NAND page.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
