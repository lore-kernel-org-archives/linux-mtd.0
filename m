Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VoQA-0002dp-I6
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 09:17:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vikram Mehta <vm6580@hotmail.com>
In-Reply-To: <Law14-OE49BCUcoYhpl00054291@hotmail.com>
References: <Law14-OE49BCUcoYhpl00054291@hotmail.com>
Message-Id: <1056701866.28202.40.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 27 Jun 2003 09:17:46 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: blkmem.c questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-26 at 03:55, Vikram Mehta wrote:
> HI folks,
> 
> I am working on uCdimm.
> On trying to mount jffs2 , I get a message ,
> 
> "arena open of 1 failed"
> Now this message is in blkmem.c

Do not use blkmem.c. You need to use the real Linux flash drivers.

-- 
dwmw2
