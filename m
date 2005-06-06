Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfI9g-0000fc-Mp
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 10:00:41 -0400
Date: Mon, 6 Jun 2005 16:00:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050606140010.GE31739@wohnheim.fh-wedel.de>
References: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
	<20050606131534.GC31739@wohnheim.fh-wedel.de>
	<42A45382.5080301@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42A45382.5080301@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS3 superblock search
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 June 2005 17:45:38 +0400, Artem B. Bityuckiy wrote:
> 
> providing the key is 16 bytes and the pointer is 8 bytes, the 4-level 
> B-tree is enough for (4096/24)^4 = 170^4 ~1E8. If this isn't enough we 
> may use more levels as well.

There are valid reasons to use 512 byte blocks instead.  Most likely I
will do just that for logfs, just as a hint.  Therefore, even with 8
byte keys, you'd be down to 32^4 or about a million.  Prepare for more
levels.

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
