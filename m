Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AyNz-0004JX-EL
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 21:41:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
In-Reply-To: <5.1.0.14.0.20030430145340.02502ea8@ns.webzsite.com>
References: <5.1.0.14.0.20030430145340.02502ea8@ns.webzsite.com>
Message-Id: <1051735274.2850.305.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 30 Apr 2003 21:41:14 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops in mounting jffs2 (jffs2_get_ino_cache())
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-30 at 21:22, Vipin Malik wrote:
> I'm using CVS code (HEAD) from Feb 16th on x86 w/ NOR flash chips (AMD).
> 
> I've been doing pwr fail testing on my application code and during a power 
> up I got the following Oops.

http://lists.infradead.org/pipermail/linux-mtd/2003-February/007115.html

cvs up


-- 
dwmw2
