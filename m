Subject: Re: [BUG] JFFS2 usage of write_begin and write_end
	functions	causes kernel panic
From: David Woodhouse <dwmw2@infradead.org>
To: Anders =?ISO-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>
In-Reply-To: <48120242.9020908@users.sourceforge.net>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<1208011719.2698.19.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
	<Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>
	<4810F73A.5000305@users.sourceforge.net>
	<1209075315.11578.9.camel@shinybook.infradead.org>
	<48120242.9020908@users.sourceforge.net>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Apr 2008 15:52:07 +0100
Message-Id: <1209221527.25560.15.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-25 at 18:09 +0200, Anders Grafström wrote:
> 
> 
> I think I need an mtdoops partition to catch anything useful from
> CONFIG_JFFS2_FS_DEBUG.
> Too much output for the console. It slows it down so much that it
> doesn't trigger the panic.

Just the lines in the kernel's ring buffer leading up to the BUG should
be sufficient, if you can get them -- just the output of 'dmesg' ought
to be fairly useful. Why is it a panic anyway -- have you set
panic-on-oops?

-- 
dwmw2
