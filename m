Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18964j-0000LE-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 15:57:09 +0000
Date: Tue, 5 Nov 2002 17:27:22 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: vijay vijay <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Message-ID: <20021105162722.GA30984@wohnheim.fh-wedel.de>
References: <F43HNrBBfE0q2TUniNA00011392@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F43HNrBBfE0q2TUniNA00011392@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 November 2002 14:13:47 +0000, vijay vijay wrote:
> 
> Had tried doing all that. Do not have the log message, will
> try again and get back to you. Only remember the crash happening
> in cramfs_read -> bread -> ...submit_bh.

Should be a pretty simple mistake - when you see it. 

> About the second query on raw operations:
> Being new to Linux, am still trying to grasp the 'user/kernel'
> space concepts. I tried my test using __raw_writel() operation
> in inode.c itself. Guess that puts me in kernel space right?.
> Should it work if tried from user space( build my code as a library,
> copy it to filesystem and run from there like other utils(dd)) ?.

If your code runs inside the kernel, either linked directly or as a
kernel module, it runs from kernel space.
If your code is compiled into a program and executed from bash, etc.
it runs from user space.
Plain and simple. :-)

Working from userspace, you don't have any access to __raw_writel().
Do you have a reason, why working on the block device from user space
is not sufficient for your needs?

Jörn

Oh, and could you leave the quotation you refer to over the text you
write? This makes the reference obvious.

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
