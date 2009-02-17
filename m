Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZM4Q-0006Ql-Ta
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 09:17:04 +0000
Date: Tue, 17 Feb 2009 09:16:33 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [UBIFS] Filesystem capacity
Message-ID: <20090217091633.GB26354@shareable.org>
References: <49997BBF.7080906@wb.com.pl> <49998C2D.7000505@nokia.com>
	<1234850859.17790.213.camel@localhost.localdomain>
	<499A69BA.6080005@wb.com.pl>
	<1234857466.17790.227.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1234857466.17790.227.camel@localhost.localdomain>
Cc: "Adam S. Turowski" <a.turowski@wb.com.pl>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> OK, then indeed Adrian wrote exactly the right thing. You have huge
> 4144-byte uncompressible nodes. You fit 3 of them to each eraseblock,
> and you waste 3440 bytes in each eraseblock. JFFS2 would jam a little
> more data, because it can split big blocks on parts.
> 
> In real life you will likely have compressible data, and many small
> files, so you will have small data nodes and many inode nodes, which
> are 160 bytes in size, so you will fit more.

Also, in real life, JFFS2 will behave badly when the filesystem is
completely full.  Its garbage collector can use 100% CPU for minutes
even on a small NOR flash, if the filesystem fills up too much.  It
happens because it's difficult to reorganise the data when there's no
spare room.

I wonder if the "lost" space in UBIFS is helpful to prevent long
garbage collection cycles?

-- Jamie
