Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy4Gh-0006Gz-0r
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 05:01:41 -0400
Date: Thu, 28 Jul 2005 11:01:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050728090110.GA25033@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
	<20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru> <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<1122502084.8952.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1122502084.8952.42.camel@localhost.localdomain>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 July 2005 23:08:03 +0100, David Woodhouse wrote:
> On Tue, 2005-07-26 at 12:03 +0200, Jörn Engel wrote:
> > o 80 columns (see CodingStyle)
> 
> Go easy on that one. I just rejected a patch from Artem because he went
> overboard with the 80-column thing. Sometimes it's better to have longer
> lines than that.

Did I hear someone volunteer for the next review? ;)

Jörn

-- 
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it.
-- Brian W. Kernighan
