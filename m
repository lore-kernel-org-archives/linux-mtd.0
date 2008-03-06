Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXHrp-0004pl-24
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 15:18:45 +0000
Date: Thu, 6 Mar 2008 15:19:48 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Dach Miroslaw <miroslaw.dach@psi.ch>
Subject: Re: MTD and jffs2 mount problem on Linux-2.6.23 rc2
Message-ID: <20080306141948.GC5280@lazybastard.org>
References: <C3F2E592.DC63%gerickson@nuovations.com>
	<1B4F8000449511488D1A640DD6DECA3501EC25E3@MAILBOX0A.psi.ch>
	<1204710323.3599.12.camel@lisa.alm.archives.at>
	<20080305120320.GH6616@lazybastard.org>
	<1B4F8000449511488D1A640DD6DECA3501EC25EC@MAILBOX0A.psi.ch>
	<20080305135024.GA8301@lazybastard.org>
	<1B4F8000449511488D1A640DD6DECA3501EC25F0@MAILBOX0A.psi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1B4F8000449511488D1A640DD6DECA3501EC25F0@MAILBOX0A.psi.ch>
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

On Thu, 6 March 2008 08:48:46 +0100, Dach Miroslaw wrote:
>
> # insmod block2mtd block2mtd=/dev/loop0,640ki
                                          ^^^^^
> [ 2715.317777] block2mtd: mtd4: [d: /dev/loop0] erase_size = 640KiB [655360]
                                                               ^^^^^^

That number is likely wrong.  Also you might have to pad your image with
0xff a bit.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
