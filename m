From: David Woodhouse <dwmw2@infradead.org>
To: Armin <armin@melware.de>
In-Reply-To: <Pine.LNX.4.31.0401271245140.5630-100000@phoenix.one.melware.de>
References: <Pine.LNX.4.31.0401271245140.5630-100000@phoenix.one.melware.de>
Content-Type: text/plain
Message-Id: <1075209218.1633.47.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 13:13:39 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 12:47 +0100, Armin wrote:
> What is the time the garbage collection starts or finished this?
> I waited some time (about 10 minutes) and the messages still occured after
> remount.

The garbage collection may not erase the offending block immediately, or
even soon. Only when enough of the _rest_ of the nodes in the same
eraseblock are considered dirty will the block be likely to be selected
for garbage collection. 

-- 
dwmw2
