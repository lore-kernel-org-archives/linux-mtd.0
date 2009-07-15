Received: from smtp105.sbc.mail.gq1.yahoo.com ([67.195.14.108])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR8hR-0006Z8-UI
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 17:55:32 +0000
From: David Brownell <david-b@pacbell.net>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: Kernel Oops when trying to suspend with ubifs mounted on
	block2mtd mtd device on 2.3.31-rc2
Date: Wed, 15 Jul 2009 10:55:17 -0700
References: <20090715122051.GA1439@yamamaya.is-a-geek.org>
	<4A5DD233.7090702@nokia.com>
In-Reply-To: <4A5DD233.7090702@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907151055.17959.david-b@pacbell.net>
Cc: Tobias Diedrich <ranma@tdiedrich.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 15 July 2009, Adrian Hunter wrote:
> Looks like it might be related to MTD driver model updates.

Not the sysfs support ... more likely the patch adding cls_suspend()
support, 15bce40cb3133bcc07d548013df97e4653d363c1, is goofed.  Maybe
it's invoking suspend on the wrong device node...
