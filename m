Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBzrt-0001na-1z
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 13:37:13 -0500
Date: Thu, 17 Mar 2005 19:37:15 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050317183715.GD11836@wohnheim.fh-wedel.de>
References: <20050317161110.GA10864@wohnheim.fh-wedel.de>
	<1111081817.24487.64.camel@hades.cambridge.redhat.com>
	<20050317180217.GA11836@wohnheim.fh-wedel.de>
	<1111082993.24487.69.camel@hades.cambridge.redhat.com>
	<20050317181737.GB11836@wohnheim.fh-wedel.de>
	<1111083747.24487.80.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1111083747.24487.80.camel@hades.cambridge.redhat.com>
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

On Thu, 17 March 2005 18:22:26 +0000, David Woodhouse wrote:
> 
> My original estimate was that it wouldn't be. If you have to collect
> entropy from JFFS2 version numbers anyway, you're not making a lot of
> progress on the code size. If you feed it into the random pool via a
> cryptographic hash, you do get a better quality of entropy, but it costs
> you a lot of time -- and time during the mount is at a premium already. 

Agreed.  More thinking then.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
