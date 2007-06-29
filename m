Received: from www19.your-server.de ([213.133.104.19])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I4CKD-00069c-SH
	for linux-mtd@lists.infradead.org; Fri, 29 Jun 2007 04:59:35 -0400
From: Uli Luckas <u.luckas@road.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
Date: Fri, 29 Jun 2007 10:59:30 +0200
References: <200706141509.50621.u.luckas@road.de>
	<200706291024.49018.u.luckas@road.de>
	<1183105708.1170.223.camel@pmac.infradead.org>
In-Reply-To: <1183105708.1170.223.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706291059.30383.u.luckas@road.de>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, 29. June 2007, David Woodhouse wrote:
> On Fri, 2007-06-29 at 10:24 +0200, Uli Luckas wrote:
> > But then again, my patch was more complex for a reason :-) How does your
> > patch handle the situation, where try_to_freeze returns true _and_ there
> > is a pending SIGHUP?
>
> It'll go back to the beginning of the loop, then if it _does_ take the
> !thread_should_wake() path it'll be woken immediately by the pending
> SIGHUP, and it'll do one GC pass as intended.
>
Hi David,
Thanks for your explanation. You are obviously right. 
I missed the point where a pending signal keeps wakeing INTERRUPTIBLE tasks 
until it is handled.

regards,
Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
