Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q87b-00057b-LT
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:06:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3EE752EE.8090902@imc-berlin.de>
References: <3EE752EE.8090902@imc-berlin.de>
Message-Id: <1055347637.2097.240.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 17:07:17 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Stopping the GC thread?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 17:03, Steven Scholz wrote:
> Is it safe to just do a
> 
> ~ # kill -s SIGSTOP `pidof jffs2_gcd_mtd0`
> 
> even if my root fs is on this JFFS2 partition?

Yes.

> (I just tried it now and it seems to work. But IIRC a while ago my 
> system hung when I did something like that...)

It shouldn't. The GC thread remains strictly an optimisation (and
doesn't exist in the eCos port, etc.)

-- 
dwmw2
