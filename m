Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4yD6-0005BM-Jg
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 05:58:29 -0400
Date: Tue, 16 Aug 2005 11:58:23 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Timofey Kutergin <tkutergin@mail.ru>
Message-ID: <20050816095823.GC14405@wohnheim.fh-wedel.de>
References: <20050802121453.GA24417@wohnheim.fh-wedel.de>
	<E1E4vgl-000HN8-00.tkutergin-mail-ru@f29.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1E4vgl-000HN8-00.tkutergin-mail-ru@f29.mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re[4]: working mphysmap.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 August 2005 11:16:47 +0400, Timofey Kutergin wrote:
> 
> Hi !
> I guess removed code is related to command line processing which was incomplete. My code uses just static configuration from Kconfig. We also have newer mphysmap.c code which includes D-cache enabling for selected flash regions. How do you think, is it interesting for inclusion ?

[ Your lines are rather wide. ]

Yes, definitely.  Since you're the only user I've ever heard back
from, your changes can just go in.  Which reminds me to commit your
last patch.  Would you mind sending it again, preferrably with the
D-cache enabling as well?


Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
