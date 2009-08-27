Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgaHA-0005cQ-PC
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 08:24:13 +0000
Date: Thu, 27 Aug 2009 09:24:04 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Creating an ext3 partition on an mtd device
Message-ID: <20090827082404.GB22631@shareable.org>
References: <dac45060908261244wbfc744apec0d5195a0f1dbcf@mail.gmail.com>
	<1251321997.10982.101.camel@jjw-linux>
	<dac45060908262259r2f5ff85tb2608bd02153e797@mail.gmail.com>
	<1251354560.3514.5.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1251354560.3514.5.camel@localhost>
Cc: Mark Ryden <markryde@gmail.com>, Justin Waters <justin.waters@timesys.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> mtdblock does not do any bad block handling, so you cannot use it with
> NAND. And it does not do any wear-leveling, and it has zero tolerance to
> power cuts.
> 
> I think the text above assumes that you have NOR, you do not care about
> WL and power-cuts.

That's right.  Basically you should only use mtdblock for filesystems
that are mounted read-only, and only written rarely such as
exceptional system updates.  (Not if system updates are often).

Don't even mount the filesystem writable, even if you're not writing
to it most of the time, because just mounting writable wears the flash
and is not safe against power cuts.

-- Jamie
