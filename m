Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ARJLV-0006hN-Sd
	for <linux-mtd@lists.infradead.org>; Tue, 02 Dec 2003 22:50:18 +0000
Date: Tue, 2 Dec 2003 16:54:23 -0500 (EST)
From: joshua@dashnine.joshuawise.com
To: Rick Bronson <rick@efn.org>
In-Reply-To: <E1ARHGG-00018H-00@c-67-164-61-95.client.comcast.net>
Message-ID: <Pine.LNX.4.44.0312021653280.30871-100000@dashnine.joshuawise.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
Subject: Re: nand_write_ecc() broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>   If bad block managemnet is not really an mtd responsibility then why
> does nand_erase() inside mtd/nand/nand.c call
> this->block_bad(mtd, page) which checks for bad blocks?
It is in the specification for most chips that you must not erase bad
blocks, as you'll wipe out the bad block data and generally cause Bad
Stuff to happen.

>   Rick Bronson
/joshua
