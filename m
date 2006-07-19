Subject: Re: autoconf for mtd-utils
From: David Woodhouse <dwmw2@infradead.org>
To: dbyron@hheld.com
In-Reply-To: <000001c6ab64$87a7fad0$a134800a@RudiDell>
References: <000001c6ab64$87a7fad0$a134800a@RudiDell>
Content-Type: text/plain
Date: Wed, 19 Jul 2006 15:24:50 -0400
Message-Id: <1153337091.2719.2.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-07-19 at 11:52 -0700, David Byron wrote:
> In my environment, it would help to have separate build and source
> directories for mtd-utils.  I need a native build for mkfs.jffs2 and a
> cross-compiled build for flash_eraseall, etc.  A few weeks ago it looks like
> Josh Boyer removed an attempt at a Makefile.am.
> 
> Is there a general aversion to automake?  If I submit a Makefile.in /
> configure.ac that uses autoconf but not automake, does it have a chance of
> getting accepted? 

No.

If you just send a proper Makefile patch which provides separate source
and build directories, that'd be useful though.

-- 
dwmw2
