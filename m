Received: from web52710.mail.yahoo.com ([206.190.39.161])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CbM96-00034r-3a
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 11:55:33 -0500
Message-ID: <20041206165530.42422.qmail@web52710.mail.yahoo.com>
Date: Mon, 6 Dec 2004 08:55:29 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <550530ef04120606054caa83cc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Compiling MTD-utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi All
> 
> I'm tring to compile the latest snapshot of MTD utils for my host
> and
> embedded target systems. According to Karim Yaghmour's Building
> Embedded Linux Systems I should use:
> 
> $ automake --foreign; autoconf
> $ ./configure --with-kernel=/usr/src/linux
> 

No, I don't believe those are the correct commands.  I've never
used them anyways, and MTD has changed since his instructions.

I simply enter the 'mtd/util' directory, and do
make CROSS=arm-linux-  flash_erase flash_eraseall nanddump
nandwrite
(as those are the only utilities I use)

Take a look at the makefile, it seems pretty straightforward.

Mike
