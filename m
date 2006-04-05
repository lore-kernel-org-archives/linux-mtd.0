Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FRDK0-0004Gp-F9
	for linux-mtd@lists.infradead.org; Wed, 05 Apr 2006 15:05:42 -0400
Date: Wed, 5 Apr 2006 21:05:25 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ralph Siemsen <ralphs@netwinder.org>
Message-ID: <20060405190525.GE20310@wohnheim.fh-wedel.de>
References: <4433E9A1.1030807@netwinder.org>
	<1144254468.6227.84.camel@pmac.infradead.org>
	<4433F9FE.7020501@rossvideo.com>
	<1144258058.6227.90.camel@pmac.infradead.org>
	<44340038.3000602@netwinder.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44340038.3000602@netwinder.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: FAQ entry for loopback mounting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 April 2006 13:36:56 -0400, Ralph Siemsen wrote:
> David Woodhouse wrote:
> 
> >We _are_ being lenient. If you say 'k' or 'M' instead of 'Ki' or 'Mi'
> >then you are going to get the powers of ten which you asked for... which
> >is almost certainly _not_ what you wanted. Giving you powers of two is
> >not an option. So it's best not to accept it at all.
> 
> No, if you give it "k" only, then it multiples by 1024, but because 
> there is no "i", it does not advance *endp, and then parse_num() returns 
> -EINVAL because it sees trailing garbage.  So just "k" is not accepted 
> at all, which is not "leniant" in my books.

Well, we have the following options:
1) accept "k" only, interpret as 1024
2) accept both "k" and "ki", interpret as 1024
3) accept "k" and interpret as 1000, accept "ki" and interpret as 1024
4) accept "ki" only, interpret as 1024

Option 1 is what has been done by every piece of software for years.
People are used to it.  But it also causes confusion at time.  For
example, my 40GB hard disk is only 37GiB in size.  Hard disk
manufacturers _do_ mean 1000*1000*1000 when talking about GB.  DRAM
manufacturers mean 1024*1024*1024 when talking about GB.  GBit
ethernet means 1000MBit.  10MBit might mean 10*1024*1024, not sure
about that.

Ergo: It is confusing, don't do it.


Option 2 has all the disadvantages of 1.

Ergo: It is confusing, don't do it.


Option 3 will cause many people to expect "k" to be interpreted as
1024, while something completely different happens.

Ergo: It is confusing, don't do it.


Option 4 simply doesn't accept "k".  People used to it will have to
stop and think, then notice that it is called "ki" now and definitely
means 1024, even when talking about hard disks, ethernet, etc.

Ergo: Initial surprise, but after that the interface does what one
expects.


I personally don't like solution 4 too much either.  But it is much
better than the other three.  And the "but this is flash, so in this
particular case everyone knows it means 1024" argument simply doesn't
work.  If you look at the FAQ section of your favorite computer
magazine, you see the "why is my 40GB hard disk only 37GiB in size"
question in it.  People don't know when "k" means 1000 and when it
means 1024.

If you have a better solution, though, I'm all yours. ;)

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
