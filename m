Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBzK3-0000UL-Mq
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 13:02:16 -0500
Date: Thu, 17 Mar 2005 19:02:17 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050317180217.GA11836@wohnheim.fh-wedel.de>
References: <20050317161110.GA10864@wohnheim.fh-wedel.de>
	<1111081817.24487.64.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1111081817.24487.64.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] replace pseudo_random with standard random calls
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 March 2005 17:50:17 +0000, David Woodhouse wrote:
> On Thu, 2005-03-17 at 17:11 +0100, Jörn Engel wrote:
> > This little puppy removes a lot of code.  Not sure what the original
> > idea behind the pseudo_random implementation was, so whoever dislikes
> > my patch may speak up now.
> 
> We don't necessarily have any entropy in the random pool yet, when we're
> mounting the rootfs.

We could feed the current pseudo_randomness into the entropy pool.

Will have to look into the details, there may be accounting problems.
Adding pseudo_randomness is not a big problem, since everything is
hashed.  But accounting it as real entropy would be creating a false
sense of security to other users.

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
