Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bakk6-0002kW-Ek
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 20:26:58 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <34463.160.114.55.5.1087282322.squirrel@webmail.inf.u-szeged.hu>
References: <40CD76C2.1080007@inf.u-szeged.hu> <40CDACF2.5040502@yandex.ru>
	<34463.160.114.55.5.1087282322.squirrel@webmail.inf.u-szeged.hu>
Content-Type: text/plain
Date: Thu, 17 Jun 2004 01:25:40 +0100
Message-Id: <1087431940.4530.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: (NAND) JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-06-15 at 08:52 +0200, Ferenc Havasi wrote:
> About our idea/plan: we would like to modify the mkfs and umount porcess
> to store some extra information (inode_cache). 

I wasn't going to do it on umount. I was going to do it at the end of
each eraseblock. When we've almost filled an eraseblock we write a
summary to the end of it, containing all the information which we would
otherwise have to read from it during mount.

That's basically a list of the { inode#, physical_offset, length } for
each node in the eraseblock, and something about nlink. Note that
there's a lot of redundancy in the offsets and lengths so we can
contrive a storage method which is fairly efficient. 

Then at mount we look first at the _end_ of each eraseblock for such a
summary. If it exists, we read in the state from it. If not, we scan
that particular eraseblock the old way.

-- 
dwmw2
