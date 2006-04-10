Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FStEc-00037i-FH
	for linux-mtd@lists.infradead.org; Mon, 10 Apr 2006 06:03:08 -0400
Date: Mon, 10 Apr 2006 12:02:52 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Massimiliano Galanti <massiblue@libero.it>
Message-ID: <20060410100252.GA17383@wohnheim.fh-wedel.de>
References: <4436A961.7050209@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4436A961.7050209@libero.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: checking write_cached_data return status inside _release and
	_flush?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 April 2006 20:03:13 +0200, Massimiliano Galanti wrote:
> 
> i experienced some corruption of data on flash memories i am using, and
> discovered that this is related to these functions in mtdblock.c:
> 
> 	static int mtdblock_release(struct mtd_blktrans_dev *mbd)
> 	static int mtdblock_flush(struct mtd_blktrans_dev *dev)
> 
> not checking the return value of the function:
> 
>         write_cached_data(mtdblk)
> 
> i fixed that by checking the return value inside a while cycle but is 
> there any particular reason the original code is written that way?

Sounds like a plain bug.  Can you send a patch?

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
