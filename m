Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JgSa-0007oI-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 19:08:12 +0100
Date: Tue, 1 Aug 2000 11:08:05 -0700
From: Philipp Rumpf <prumpf@uzix.org>
To: Markus Thiesmeyer <mthi@gmx.de>
Cc: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: Is JFFS a full featured filesystem?
Message-ID: <20000801110805.B19485@fruits.uzix.org>
References: <002a01bffbd5$6e5da560$fd8907d4@gallien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002a01bffbd5$6e5da560$fd8907d4@gallien>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Aug 01, 2000 at 06:15:31PM +0200, Markus Thiesmeyer wrote:
> So I've written a small program which uses file-mapping to change given
> files.

At least on 2.3 you shouldn't be able to get a shared writable mmap of a
JFFS file.  I don't think this should be any different in 2.2.

Can you send your code ?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
