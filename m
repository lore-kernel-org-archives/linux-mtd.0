Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOlcs-0008Rp-DT
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 03:48:22 +0000
Message-ID: <48928786.4000104@billgatliff.com>
Date: Thu, 31 Jul 2008 22:48:22 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: David Brown <davidb@davidb.org>
Subject: Re: Node CRC failures in latest mainline git?
References: <48913EA3.9080603@billgatliff.com>
	<20080731045624.GA24431@old.davidb.org>
	<4892205F.2080005@billgatliff.com>
	<20080801024706.GB2296@old.davidb.org>
In-Reply-To: <20080801024706.GB2296@old.davidb.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brown wrote:
> Yes.  Basically, there are merge conflicts that got resolved at the end.
> You're trying to linearize that which means you have to figure them out for
> the pieces.  It's kind of a pain, but this particular one isn't all that
> hard.

Yea, I got through that pretty easily once I figured out what it was telling me.
 Git is so smart, it's scary.  :)

BUT, I'm not confident now that the problem isn't that I simply corrupted my
filesystem: I'm getting error messages (but it still mounts) on .24 and .23.  So
now I've got to find the time to generate a new one, and then test that.

Don't hold your breath, I have a business trip to a destination 12 timezones
away coming up.  I'll try to work it in...

I do appreciate the help, though.  I'll let you know as soon as I have something
credible to report.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
