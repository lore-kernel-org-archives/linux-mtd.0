Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JitJd-00073P-ME
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 15:31:25 +0000
Date: Mon, 7 Apr 2008 16:31:18 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: choosing a file system to use on NAND/UBI
Message-ID: <20080407153118.GA719@shareable.org>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron>
	<20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron>
	<20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron>
	<20080407112010.GA8942@cloud.net.au>
	<1207570534.8040.94.camel@sauron>
	<20080407122253.GA12359@cloud.net.au>
	<1207572259.8040.107.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207572259.8040.107.camel@sauron>
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2008-04-07 at 22:22 +1000, Hamish Moffatt wrote:
> > My idea is that you can "ubiupdatevol /dev/ubi0_0 myimage.gz", which
> > ubiupdatevol would decompress on the fly. You could decompress it
> > somewhere first but it may not fit in RAM (and writing it to flash
> > temporarily would be slower).

> How do you copy the file? If you have network connection, may be you
> could teach ubifs to take the image from the network?

I have a similar application, but it's using NOR, JFFS2 and "flashcp"
to write; still, the principle is the same.

Flashing while reading from the network is dangerous if the network
fails in the middle, and it's the critical boot partition being
written.  In my application, this is not uncommon.

> > Looking at the code I see the main issue is that you need to know the
> > file size before you start updating.
> Yeah, that is right. This is what UBI update ictl expects. But probably
> gzip has this info somewhere in its meta-data.

The size is optional in the tiny gzip header, at the start of the
file.  I think files compressed with "gzip file" will have it, and
files compressed with "gzip <file >file.gz" won't.  Also, it is
limited to 4GiB-1.

-- Jamie
