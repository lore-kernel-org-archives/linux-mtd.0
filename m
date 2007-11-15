Date: Thu, 15 Nov 2007 14:26:31 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
In-Reply-To: <20071115132027.GC10165@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0711151418060.8133@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
	<Pine.LNX.4.64.0711151241140.30407@pentafluge.infradead.org>
	<Pine.LNX.4.64.0711151250550.30407@pentafluge.infradead.org>
	<20071115132027.GC10165@lazybastard.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1831524198-1381566035-1195136791=:8133"
Cc: Roman.borisov@intel.com, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1831524198-1381566035-1195136791=:8133
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 15 Nov 2007, Jörn Engel wrote:

> 
> Could be a writebuffer thing.  Maybe a testcase like this will force it
> on NAND.
> 
No it is low probable. At least we were able to see the issue when JFFS2 worked with M18 like device. 
> # mount
> head -c3960 /dev/urandom > wbuf_preload
> echo 12345 > foo
> # wait long enough for write to finish, but not long enough for wbuf to
> # get flushed, hit reset button
> 
> The size of the preload should be carefully crafted.  3960 bytes plus
> node header of 68 bytes leaves exactly another 68 bytes for the next
> node header.  So the wbuf gets filled and written right after the second
> node's header, but before its data.  Works with wbuf sizes of 512, 1024,
> 2048 and 4096.
> 
You right here. We need to clearly understand why we do not see the bug for NAND. Probably the issue is in the test case.
Thanks,
Alexey
---1831524198-1381566035-1195136791=:8133--
