Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192bEe-0006W2-GS
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 19:20:48 +0100
Date: Mon, 7 Apr 2003 20:20:50 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "George G. Davis" <gdavis@mvista.com>
Message-ID: <20030407182050.GC8178@wohnheim.fh-wedel.de>
References: <3E91B790.6040608@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E91B790.6040608@mvista.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD support for Micron SyncFlash (p/n MT28S4M)?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 April 2003 13:38:24 -0400, George G. Davis wrote:
> 
> I've noticed in the list archives that this has been asked recently. But no
> follow-ups there. So, I'm asking again, has anyone worked on MTD support for
> Micron SyncFlash p/n MT28S4M?
> 
> Here's the data sheet URL for reference:
> 
> 	http://download.micron.com/pdf/datasheets/flash/mt28s4m16lc_6.pdf
> 
> I'm not finding any support for this device in current MTD CVS. I'm 
> interested
> in getting this device supported. So if anyone has started working on 
> support
> for this device, I'ld like to help out.

Looks quite weird to me. Looks like it was designed for XIP, but a
search for "cfi" was unsuccessful.

My guess is that even after you finished the coding, noone else would
use it, so you're on your own. Feel free to ask specific questions,
that's about it.

Maybe the best starting point would be the mtdram driver, adjust it to
this device for read-only access and later look at some flash drivers
when adding write, erase, etc. support.

A hardware debugger really helps, if you can get one.

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
