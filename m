Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJpNe-0005sR-0U
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 05:34:43 -0400
Date: Mon, 26 Sep 2005 11:34:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050926093440.GE17756@wohnheim.fh-wedel.de>
References: <1127433949.6937.30.camel@localhost.localdomain>
	<20050925150635.GD28978@wohnheim.fh-wedel.de>
	<4337B727.2050809@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4337B727.2050809@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2 whitespace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 September 2005 12:53:59 +0400, Artem B. Bityutskiy wrote:
> 
> Well, I looked through the patch and have not found anything really bad. 
> Some changes are neutral, but as for me the patch is OK. And why should 
> we care about external patches? Let people work them out and regenerate. :-)

Because we want things like ebh, summary, xattr, etc.?  If we accept
this patch, it makes life a bit worse for people who write the stuff
we want.  It may be the straw that makes them go away and never come
back.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
