Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DhjM0-0004nA-7c
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 03:27:29 -0400
Date: Mon, 13 Jun 2005 09:27:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: tong changda <tongcd@hotmail.com>
Message-ID: <20050613072709.GB26966@wohnheim.fh-wedel.de>
References: <20050610112127.GA29546@wohnheim.fh-wedel.de>
	<BAY7-F7DE7464BD17A2C4E930DEDAF00@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY7-F7DE7464BD17A2C4E930DEDAF00@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org, munira.ahmed@radixs.com
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 June 2005 10:23:28 +0800, tong changda wrote:
> 
> Seem a little hard for me
> I guess all changeset for jffs2 is limited in fs/jffs2/. the interface with 
> mtd should keep unchanged, If so, is it easier to start from linux-2.4.31 
> instead of 2.6.11.11?

Most likely.  It should still be quite a bit of work.  An mtd update
once caused people to claim that I effectively updated our kernel.  It
pulled in quite a bit from header files that didn't exist in the old
kernel, etc.

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
