Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAqXv-000075-BP
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 09:27:52 -0500
Date: Mon, 14 Mar 2005 15:27:55 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20050314142755.GA17977@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0503121217090.24583@localhost.localdomain>
	<20050314141509.GA17590@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050314141509.GA17590@wohnheim.fh-wedel.de>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how to access jffs2 partition properties?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 March 2005 15:15:09 +0100, Jörn Engel wrote:
> 
> Not all mtd are flash based.  Mtd code should have zero knowledge
                                      ^
mtd core, i meant.

> about chip, start address, etc.  If you need that information, you
> have to tweak the mapping driver to give it out.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
