Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Bdkc-0002J9-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Dec 2001 15:14:22 +0000
Date: Wed, 5 Dec 2001 15:25:00 +0000 (GMT)
From: <ilatypov@infradead.org>
To: Mike Ruthven <mike@creonova.com>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: nftl
Message-ID: <Pine.LNX.4.33.0112051523540.27871-100000@infradead.org>
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

Mike,

On Tue, 4 Dec 2001, Mike Ruthven wrote:

> nftl_format gives error
> Erase size not 8Kb - I'm confused

Comment out the conditional statement.  David Woodhouse explained that
the only reason for this check is that NFTL formatting with the other
erase block sizes is not tested.

> loading nftl module gives error
> Sorry, we don't support UnitSizeFactor of != 1 yet.
> Could not find valid boot record
> Could not mount NFTL device

I encountered the same with an M-Sys-pre-formatted DOC chip.  It seems
that the existing MTD code will work only after re-formatting the chip
with the nftl_format.  Correct me if I am wrong.

Ilguiz
