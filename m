Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E78rE-0005vP-IX
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 05:44:52 -0400
Date: Mon, 22 Aug 2005 11:44:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050822094433.GA10958@wohnheim.fh-wedel.de>
References: <43098213.1020807@prie.de> <43099109.3050609@inf.u-szeged.hu>
	<430993B1.5010502@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430993B1.5010502@yandex.ru>
Cc: Bernhard Priewasser <bernhard@prie.de>, linux-mtd@lists.infradead.org
Subject: Re: Testing JFFS2 using mtdram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 August 2005 12:58:25 +0400, Artem B. Bityuckiy wrote:
> 
> Albeit you cannot emulate > 128 MB flashes (just because 128 MB is the 
> vmalloc()'s limit). This may be fixed, I just did not bother.

I did that for ramtd.  Allocate an array of pointers and then lazily
allocate memory for those pointers.  Moves the limit to 128G on i386.
For even bigger flashes, a 2-3 level tree would work, but I rarely
need more than a gig.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
