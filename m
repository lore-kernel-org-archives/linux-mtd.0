Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBzYs-0000tc-9l
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 13:17:35 -0500
Date: Thu, 17 Mar 2005 19:17:37 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050317181737.GB11836@wohnheim.fh-wedel.de>
References: <20050317161110.GA10864@wohnheim.fh-wedel.de>
	<1111081817.24487.64.camel@hades.cambridge.redhat.com>
	<20050317180217.GA11836@wohnheim.fh-wedel.de>
	<1111082993.24487.69.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1111082993.24487.69.camel@hades.cambridge.redhat.com>
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

On Thu, 17 March 2005 18:09:52 +0000, David Woodhouse wrote:
> 
> You could feed it in, but not account for it. Then get random bytes from
> the equivalent of /dev/urandom -- i.e. without waiting for there to be
> enough. But if you're going to generate your own pseudo-entropy and then
> get it back again, what's the point?

Simplicity, code size, speed, quality of entropy.

I'll give it a try and see whether it's worth it.

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
