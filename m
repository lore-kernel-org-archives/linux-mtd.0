From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050317180217.GA11836@wohnheim.fh-wedel.de>
References: <20050317161110.GA10864@wohnheim.fh-wedel.de>
	<1111081817.24487.64.camel@hades.cambridge.redhat.com>
	<20050317180217.GA11836@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Mar 2005 18:09:52 +0000
Message-Id: <1111082993.24487.69.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2005-03-17 at 19:02 +0100, Jörn Engel wrote:
> We could feed the current pseudo_randomness into the entropy pool.
>
> Will have to look into the details, there may be accounting problems.
> Adding pseudo_randomness is not a big problem, since everything is
> hashed.  But accounting it as real entropy would be creating a false
> sense of security to other users.

You could feed it in, but not account for it. Then get random bytes from
the equivalent of /dev/urandom -- i.e. without waiting for there to be
enough. But if you're going to generate your own pseudo-entropy and then
get it back again, what's the point?

-- 
dwmw2
