Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bjumg-0006kD-7T
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 02:59:30 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Achuth Kamath <achuth_m_kamath@yahoo.co.in>
In-Reply-To: <20040712053939.97681.qmail@web8302.mail.in.yahoo.com>
References: <20040712053939.97681.qmail@web8302.mail.in.yahoo.com>
Content-Type: text/plain
Date: Mon, 12 Jul 2004 07:56:05 +0100
Message-Id: <1089615365.4217.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: file system corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-07-12 at 06:39 +0100, Achuth Kamath wrote:
>    I had a jffs2 file system on my flash of one
> device. After some changes, and restart, it looks like
> the file system is corrupted. It says something like
> this:
>  jffs2_scan_inode_mode(): Data CRC failed on node at
> 0x...

So you get just one of these messages, or many of them along with other
messages? Do you have actual data corruption or loss, or are you just
scared by the message?

It's perfectly normal to see a few of these messages if you make a habit
of restarting the machine while garbage collection is in progress. It
happens when the garbage-collector is writing out a new node as a
replacement for an older copy of the same data which just happened to be
in the wrong place. If we get interrupted before completing the write,
the CRC of the new node fails and we ignore it -- but no data are lost
because the old node still exists.

-- 
dwmw2
