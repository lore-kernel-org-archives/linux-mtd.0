Subject: Re: [PATCH] [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO
	ioctl()
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20080823222707.2fb972b5.akpm@linux-foundation.org>
References: <48ABCC0B.40607@gmail.com>
	<20080822153451.bb79bd1f.akpm@linux-foundation.org>
	<48AFC5ED.50005@gmail.com>
	<20080823222707.2fb972b5.akpm@linux-foundation.org>
Content-Type: text/plain
Date: Mon, 25 Aug 2008 12:37:37 +0100
Message-Id: <1219664257.9583.36.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Rodolfo Giometti <giometti@enneenne.com>, Zev Weiss <zevweiss@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-08-23 at 22:27 -0700, Andrew Morton wrote:
> 
> > On the other hand, if I'm missing something completely, please let me know,
> > and perhaps I can prepare a more suitable fix.
> 
> "good enough" is never good enough ;)
> 
> What is the ideal implementation?  Let's implement that.

It involves ditching the ioctls altogether (well, not adding anything
_more_ to them, at least) and doing it through sysfs.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
