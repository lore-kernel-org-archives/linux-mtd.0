Received: from bombadil.infradead.org
	([2001:4830:2446:ff00:4687:fcff:fea6:5117])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qlgqf-0004r2-So
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2011 12:34:58 +0000
Date: Tue, 26 Jul 2011 08:34:53 -0400
From: Christoph Hellwig <hch@infradead.org>
To: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
Message-ID: <20110726123453.GA18513@infradead.org>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
Cc: linux-embedded@vger.kernel.org, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	tim.bird@am.sony.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> TODO:
>  * the modules keeps a table of the devices which length is the maximum number
>    of UBI volumes.  It should make use of a linked list.

A linked list isn't very nice either.  Try using idr, which gives you
both an allocator for the minor number space, and a way to look up
the structure by that index.

> Advantages of ubiblk over gluebi+mtdblock_ro:

This section should be in the main commit log, and not that part with
the changelog which gets dropped.

> +int major;

Please don't use global variables with generic names.  In this case you
should neither make it global nor give it a generic name.
