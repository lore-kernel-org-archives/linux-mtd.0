From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050317161110.GA10864@wohnheim.fh-wedel.de>
References: <20050317161110.GA10864@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Mar 2005 17:50:17 +0000
Message-Id: <1111081817.24487.64.camel@hades.cambridge.redhat.com>
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

On Thu, 2005-03-17 at 17:11 +0100, Jörn Engel wrote:
> This little puppy removes a lot of code.  Not sure what the original
> idea behind the pseudo_random implementation was, so whoever dislikes
> my patch may speak up now.

We don't necessarily have any entropy in the random pool yet, when we're
mounting the rootfs.

-- 
dwmw2
