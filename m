Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WMPt-0002Jm-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 20:03:09 +0000
Date: Wed, 8 Jan 2003 21:33:31 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: Russ Dill <Russ.Dill@asu.edu>
cc: Srinivasu.Vaduguri@nokia.com, <linux-mtd@lists.infradead.org>
Subject: Re: CRAMFS on MTD/NAND Issue
In-Reply-To: <1042054935.10724.10.camel@timmy>
Message-ID: <Pine.LNX.4.44.0301082125001.9261-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 8 Jan 2003, Russ Dill wrote:

> roll your own: Please, make a static compressed filesystem (like cramfs)
> that incorporates extra blocks, so that when the checksum is bad while
> initially writing the filesystem, or reading the file system (in the
> case where ecc can save the data), it rewrites this block to a free
> sector). It would seem like a simple modification to cramfs to me.

It would indeed be quite simple to adopt cramfs to bad blocks as long as
the superblock can be read. You only need to make a list of bad blocks,
and then teach mkcramfs about this, avoiding allocating the bad areas when
making the filesystem layout.

For generic bad-block management it would probably be more beneficial to
all to add a simple (and free from the (N)FTL patent issue) translation
layer capable of dealing with bad blocks and/or ECC I think.

Regards
Henrik
