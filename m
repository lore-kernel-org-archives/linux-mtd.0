Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K4eM-00041D-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 20:57:58 +0100
Date: Wed, 2 Aug 2000 21:57:54 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Philipp Rumpf <prumpf@uzix.org>
cc: Markus Thiesmeyer <mthi@gmx.de>, David Woodhouse <dwmw2@infradead.org>,
        mtd@infradead.org
Subject: Re: Is JFFS a full featured filesystem?
In-Reply-To: <20000802123623.C20345@fruits.uzix.org>
Message-ID: <Pine.LNX.3.96.1000802215642.9489A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 2 Aug 2000, Philipp Rumpf wrote:

> On Wed, Aug 02, 2000 at 08:06:42PM +0200, Alexander Larsson wrote:
> > Hmm. It can't handle private writable mmaps either. If such a thing
> > exists.
> 
> It doesn't ?  A private writable mapping means all the changes the mmap()ing
> process does get thrown away after the munmap, so it should work fine as long
> as readpage works.

I just saw that on l-k, sorry. Just ignore my ignorant rantings.

/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
