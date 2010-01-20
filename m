Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXaof-0007su-BH
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 13:41:54 +0000
Date: Wed, 20 Jan 2010 13:41:42 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Liu Hui <onlyflyer@gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
Message-ID: <20100120134142.GE30789@shareable.org>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Liu Hui wrote:
> This is a question confused me for a long time. As I know, writing a
> sector for a hard disk is atomic. That is to say, when we are writing
> a sector to hard disk and power failure happen, the sector will be
> written completely or not at all.

Are you sure about that?
I have never seen a reliable confirmation of it.

-- Jamie
