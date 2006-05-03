Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbJBY-000130-Lu
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 11:22:48 -0400
Date: Wed, 3 May 2006 17:21:51 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060503152151.GC5250@wohnheim.fh-wedel.de>
References: <200605031556.37660.atrey@emcraft.com> <44589BCE.2060402@yandex.ru>
	<200605031828.51552.atrey@emcraft.com>
	<625fc13d0605030807q43ee416bo8cb1dcf9f2a71645@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0605030807q43ee416bo8cb1dcf9f2a71645@mail.gmail.com>
Cc: Dmitry Bazhenov <atrey@emcraft.com>, linux-mtd@lists.infradead.org
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 3 May 2006 10:07:22 -0500, Josh Boyer wrote:
> 
> What Artem was asking is if it was physically possible to have a
> file/directory with 4294967296 versions to being with.  Take a 1 byte
> file as an example.  If that was the only file on the whole device,
> and you had that many versions of it you'd have:
> 
> 68 bytes overhead per version + 1 byte of data per version =

68 bytes + 1 byte + 3 bytes padding

> 296352743424 bytes required to store.

309237645312

> That's 276 GiB.  Which isn't even sane for JFFS2 anyway.

Divided by 100k erase cycles:
3.092.376

3MiB is not that insane at all.  Yes, we can theoretically run into
this problem.  But the probability is fairly low.  I'm not too worried
about this.

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
