Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AkLC0-0000xl-WD
	for linux-mtd@lists.infradead.org; Sat, 24 Jan 2004 10:39:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: "Shailesh P. Shirali" <shailesh@teneoris.com>
In-Reply-To: <1074939438.2382.16.camel@shailesh.amplewave.com>
References: <1074939438.2382.16.camel@shailesh.amplewave.com>
Content-Type: text/plain
Message-Id: <1074940638.6736.0.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 24 Jan 2004 10:37:18 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd partitions in user space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-01-24 at 15:47 +0530, Shailesh P. Shirali wrote:
> hello,
>       My user-space application needs to know the
> partition table as in contents /proc/mtd. Can I 
> achieve this through ioctls...basically want to avoid 
> parsing the /proc/mtd file itself.

No. The information is available through /proc/mtd only.

-- 
dwmw2
