Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cy9Vh-0004zr-G0
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 09:05:06 -0500
Date: Mon, 7 Feb 2005 15:04:53 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Victor <andrew@sanpeople.com>
Message-ID: <20050207140453.GB25504@wohnheim.fh-wedel.de>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
	<20050202124043.GB23156@wohnheim.fh-wedel.de>
	<1107421396.32163.53.camel@fuzzie.sanpeople.com>
	<20050207125500.GA25504@wohnheim.fh-wedel.de>
	<1107782843.28634.114.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107782843.28634.114.camel@fuzzie.sanpeople.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 February 2005 15:27:23 +0200, Andrew Victor wrote:
> 
> We don't need cleanmarkers since the DataFlash device will automatically
> performs a page-erase before writing to the page.

Ah, thanks.

Maybe a similar comment in the code would help other people who are
just as stupid as me.

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
