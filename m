Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YQTj-0008A2-2J
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jul 2003 14:19:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cristiano Parzani <c.parzani@tattile.com>
In-Reply-To: <000701c3422d$eb1417f0$1d00a8c0@cristianop>
References: <000701c3422d$eb1417f0$1d00a8c0@cristianop>
Message-Id: <1057324808.12384.314.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 04 Jul 2003 14:20:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Secure Digital on Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-07-04 at 14:12, Cristiano Parzani wrote:
> Hi to all,
> I am interested in Secure Digital (SD) under Linux, I have read the
> previous email posted here, someone could gladly tell me where to find
> information? 

SD is a problem because the specs are fairly hard to get hold of, and
without them we don't know how to initialise the cards. 

There is some information at
http://polysat.calpoly.edu/documents_cp2/cdh/data_sheets/toshiba_m1283bx.pdf

I'm not sure if it's enough to get anything working though.

> There is already something in kernel tree, what type of
> file-system mount. I have read that SD use FAT16 on Win9x and under
> Linux is the same? 

There's only MMC support as far as I'm aware. It presents itself as a
block device and you should be able to put any type of file system on
it.

-- 
dwmw2
