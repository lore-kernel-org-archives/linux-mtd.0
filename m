Received: from mail.fh-wedel.de ([213.39.232.194])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BsIdV-0003Oq-Kx
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2004 06:04:45 -0400
Date: Wed, 4 Aug 2004 12:04:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Dermot McGahon <dermot@dspsrv.com>
Message-ID: <20040804100435.GA10493@wohnheim.fh-wedel.de>
References: <20040731135955.GA10803@wohnheim.fh-wedel.de>
	<opsb69q3lv3ertue@mail.dspsrv.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <opsb69q3lv3ertue@mail.dspsrv.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Volatile data device vor jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 August 2004 09:55:41 +0100, Dermot McGahon wrote:
> 
> >Comments?
> 
> Well, it still needs to be flushed to something non-volatile at
> some point.

With a DRAM based device, yes.

> You can vary the time between flushes. It depends on how valuable
> that data is to you. With an approach such as this you are really
> deciding how big of a window for data loss you are willing to put
> up with.
> 
> The approach I took while doing this a couple of years ago was not
> to erase blocks until absolutely necessary and then do all the
> garbage collection/file system reorganisation once. This took time
> to do though, was suitable for the device in question (a KVM), but
> possibly not for a general filesystem.

That can be moved to a different thread, as already the case.  Except
for high-throughput write situations, it should be unnoticed by the
user.

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
