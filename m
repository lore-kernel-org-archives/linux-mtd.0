Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWu1e-0003Dt-M3
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 13:51:19 +0000
Date: Wed, 5 Mar 2008 14:50:25 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Dach Miroslaw <miroslaw.dach@psi.ch>
Subject: Re: MTD and jffs2 mount problem on Linux-2.6.23 rc2
Message-ID: <20080305135024.GA8301@lazybastard.org>
References: <C3F2E592.DC63%gerickson@nuovations.com>
	<1B4F8000449511488D1A640DD6DECA3501EC25E3@MAILBOX0A.psi.ch>
	<1204710323.3599.12.camel@lisa.alm.archives.at>
	<20080305120320.GH6616@lazybastard.org>
	<1B4F8000449511488D1A640DD6DECA3501EC25EC@MAILBOX0A.psi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1B4F8000449511488D1A640DD6DECA3501EC25EC@MAILBOX0A.psi.ch>
Cc: =?utf-8?Q?Schl=C3=A4gl_Manfred_jun=2E?= <manfred.schlaegl@gmx.at>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Grant Erickson <gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 March 2008 14:44:45 +0100, Dach Miroslaw wrote:
> 
> Thank you for the hint. I have recompiled the kernel with built-in block2mtd driver.
> 
> Do you know where to find some examples how to use block2mtd with jffs2 image.

I don't.  If someone wants to write some documentation, I'd gladly add
it.

But I believe this should do the trick:
echo block2mtd=/dev/loop0 > /sys/modules/block2mtd/parameters/block2mtd
or to explicitly set the erase size:
echo block2mtd=/dev/loop0,128KiB > /sys/modules/block2mtd/parameters/block2mtd

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
