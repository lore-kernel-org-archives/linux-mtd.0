From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050317181737.GB11836@wohnheim.fh-wedel.de>
References: <20050317161110.GA10864@wohnheim.fh-wedel.de>
	<1111081817.24487.64.camel@hades.cambridge.redhat.com>
	<20050317180217.GA11836@wohnheim.fh-wedel.de>
	<1111082993.24487.69.camel@hades.cambridge.redhat.com>
	<20050317181737.GB11836@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Mar 2005 18:22:26 +0000
Message-Id: <1111083747.24487.80.camel@hades.cambridge.redhat.com>
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

On Thu, 2005-03-17 at 19:17 +0100, Jörn Engel wrote:
> Simplicity, code size, speed, quality of entropy.
> 
> I'll give it a try and see whether it's worth it.

My original estimate was that it wouldn't be. If you have to collect
entropy from JFFS2 version numbers anyway, you're not making a lot of
progress on the code size. If you feed it into the random pool via a
cryptographic hash, you do get a better quality of entropy, but it costs
you a lot of time -- and time during the mount is at a premium already. 

-- 
dwmw2
