Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIRfq-0007PQ-Ih
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 10:03:52 -0400
Date: Thu, 22 Sep 2005 16:02:23 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20050922140223.GB6854@wohnheim.fh-wedel.de>
References: <20050922122052.GB4548@wohnheim.fh-wedel.de>
	<1127394310.3229.8.camel@windu.rchland.ibm.com>
	<20050922132104.GA6354@wohnheim.fh-wedel.de>
	<1127396504.28625.7.camel@sauron.oktetlabs.ru>
	<20050922134811.GA6854@wohnheim.fh-wedel.de>
	<1127397298.28625.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127397298.28625.12.camel@sauron.oktetlabs.ru>
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 September 2005 17:54:58 +0400, Artem B. Bityutskiy wrote:
> On Thu, 2005-09-22 at 15:48 +0200, Jörn Engel wrote:
> > Can you explain "when JFFS2 has detected that the image is an old
> > image" in C?
> Well, we may even do better. Scan FS. If we meet any node which crosses
> the eraseblock boundary - bye bye. That must be easy to implement as
> node headers contain the total node length.

Sounds fine.  Yes, that appears to be the best solution.

Jörn

-- 
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall 
